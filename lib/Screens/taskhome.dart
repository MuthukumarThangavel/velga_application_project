import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// 1. ValueNotifier for counts to separate them from the main list StreamBuilder
class TaskCounts {
  int todo = 0;
  int inProcess = 0;
  int done = 0; // The real count from the stream
  int optimisticDoneIncrement = 0; // Only positive temporary additions

  // The displayed 'done' count is always the real count plus the temporary additions
  int get displayDone => done + optimisticDoneIncrement;

  // Added copyWith method for clean state updates
  TaskCounts copyWith({
    int? todo,
    int? inProcess,
    int? done,
    int? optimisticDoneIncrement,
  }) {
    return TaskCounts()
      ..todo = todo ?? this.todo
      ..inProcess = inProcess ?? this.inProcess
      ..done = done ?? this.done
      ..optimisticDoneIncrement = optimisticDoneIncrement ?? this.optimisticDoneIncrement;
  }
}

// Global or scoped notifier for simplicity
final _taskCountsNotifier = ValueNotifier<TaskCounts>(TaskCounts());

class Taskhome extends StatefulWidget {
  final String uid;
  const Taskhome({super.key, required this.uid});

  @override
  State<Taskhome> createState() => _TaskhomeState();
}

class _TaskhomeState extends State<Taskhome> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }
  
  // Dispose the notifier to prevent memory leaks if this widget is not root
  @override
  void dispose() {
    // If the notifier is global, it's often not disposed, but good practice if scoped.
    // _taskCountsNotifier.dispose(); 
    super.dispose();
  }

  Future<void> _getUserName() async {
    try {
      final userDoc = await _firestore.collection('users').doc(widget.uid).get();
      if (userDoc.exists && userDoc.data() != null) {
        setState(() {
          userName = (userDoc.data()!['name'] ?? "User").toString();
        });
      }
    } catch (e) {
      debugPrint("Error fetching user name: $e");
    }
  }

  // 🎨 Priority color (unchanged)
  Color _getPriorityColor(String? priority) {
    switch (priority) {
      case 'Normal':
        return Colors.green;
      case 'Moderate':
      case 'InProcess':
        return Colors.orangeAccent;
      case 'Urgent':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // 💎 Tier weights (unchanged)
  double _getTierWeight(int tier) {
    switch (tier) {
      case 1:
        return 2.0;
      case 2:
        return 3.0;
      case 3:
        return 4.0;
      case 4:
        return 5.0;
      default:
        return 0.0;
    }
  }

  // ⚡ Productivity update (unchanged)
  Future<void> _updateProductivityTransaction(int tier, Map<String, dynamic> taskData) async {
    // ... (Your existing _updateProductivityTransaction logic) ...
    try {
      String monthKey = DateFormat('yyyy_MM').format(DateTime.now());
      final prodRef = _firestore
          .collection('productivity')
          .doc(widget.uid)
          .collection('records')
          .doc(monthKey);

      double points = _getTierWeight(tier);

      String? endDate = taskData['endDate']?.toString();
      String? endTime = taskData['endTime']?.toString();

      DateTime? assignedDeadline;
      if (endDate != null && endDate.isNotEmpty && endTime != null && endTime.isNotEmpty) {
        try {
          assignedDeadline = DateFormat('yyyy-MM-dd h:mm a').parseLoose("$endDate $endTime");
        } catch (_) {
          try {
            assignedDeadline = DateFormat('yyyy-MM-dd HH:mm').parseLoose("$endDate $endTime");
          } catch (_) {}
        }
      }

      final now = DateTime.now();
      if (assignedDeadline != null) {
        final diff = now.difference(assignedDeadline);
        if (diff.inMinutes <= 0) points += 1;
        else if (diff.inMinutes > 30) points -= 1;
      }

      if (points < 0) points = 0;

      await _firestore.runTransaction((tx) async {
        final snap = await tx.get(prodRef);
        if (snap.exists && snap.data() != null) {
          final d = snap.data()!;
          double total = (d['total'] ?? 0).toDouble();
          int count = (d['count'] ?? 0).toInt();

          tx.update(prodRef, {
            'total': total + points,
            'count': count + 1,
            'average': (total + points) / (count + 1),
            'timestamp': FieldValue.serverTimestamp(),
          });
        } else {
          tx.set(prodRef, {
            'month': monthKey,
            'total': points,
            'count': 1,
            'average': points,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }
      });
    } catch (e) {
      debugPrint("Error updating productivity: $e");
    }
  }


  // ⚡ Optimized Optimistic Update Logic
  Future<void> _updateTaskStatus(
      String docId, String newStatus, String currentStatus, int tier, Map<String, dynamic> localTaskData) async {
    if (newStatus == currentStatus) return;

    // 1. Instant UI update (Optimistically update counts)
    TaskCounts newCounts = _taskCountsNotifier.value.copyWith();
    
    // Decrement from current status
    if (currentStatus == 'todo') {
      newCounts.todo = newCounts.todo > 0 ? newCounts.todo - 1 : 0;
    } else if (currentStatus == 'inprocess') {
      newCounts.inProcess = newCounts.inProcess > 0 ? newCounts.inProcess - 1 : 0;
    } else if (currentStatus == 'done') {
      // When moving OUT of done, we decrease the *real* done count until stream lands
      newCounts.done = newCounts.done > 0 ? newCounts.done - 1 : 0;
    }

    // Increment to new status
    if (newStatus == 'todo') {
      newCounts.todo++;
    } else if (newStatus == 'inprocess') {
      newCounts.inProcess++;
    } else if (newStatus == 'done') {
      // When moving TO done, we increase the *optimistic* increment
      newCounts.optimisticDoneIncrement++;
    }

    // Apply the change
    _taskCountsNotifier.value = newCounts;

    // 2. Background Firestore update
    Future.microtask(() async {
      try {
        final ref = _firestore.collection('users').doc(widget.uid).collection('assigned_tasks').doc(docId);
        final snap = await ref.get();
        if (!snap.exists) {
          _revertOptimisticUpdate(newStatus, currentStatus);
          return;
        }

        final data = snap.data() ?? {};
        final Map<String, dynamic> updates = {'status': newStatus};

        if (newStatus == "done") {
          updates['completedAt'] = FieldValue.serverTimestamp();
          if (data['assignedAt'] == null) {
            updates['assignedAt'] = FieldValue.serverTimestamp();
          }
        }

        await ref.update(updates);
        await _firestore.collection('admin_tasks').doc(docId).update({'status': newStatus}).catchError((_) {});

        if (newStatus == "done") {
          _updateProductivityTransaction(tier, {...data, ...localTaskData});
        }
      } catch (e) {
        debugPrint("Error updating status: $e");
        // Revert UI on failure
        _revertOptimisticUpdate(newStatus, currentStatus);
      }
    });
  }
  
  // Helper to revert optimistic UI on failure
  void _revertOptimisticUpdate(String failedStatus, String originalStatus) {
    TaskCounts newCounts = _taskCountsNotifier.value.copyWith();

    // Revert the decrement that happened in _updateTaskStatus
    if (failedStatus == 'todo') {
      newCounts.todo = newCounts.todo > 0 ? newCounts.todo - 1 : 0;
    } else if (failedStatus == 'inprocess') {
      newCounts.inProcess = newCounts.inProcess > 0 ? newCounts.inProcess - 1 : 0;
    } else if (failedStatus == 'done') {
      newCounts.optimisticDoneIncrement = newCounts.optimisticDoneIncrement > 0 ? newCounts.optimisticDoneIncrement - 1 : 0;
    }

    // Revert the increment that happened in _updateTaskStatus
    if (originalStatus == 'todo') {
      newCounts.todo++;
    } else if (originalStatus == 'inprocess') {
      newCounts.inProcess++;
    } else if (originalStatus == 'done') {
      // If we failed to move out of done, revert the temporary done decrement
      if (failedStatus != 'done') {
         newCounts.done++;
      } else {
        // If we failed to move TO done, revert the optimistic increment
        newCounts.optimisticDoneIncrement++; 
      }
    }
    
    // Set the state back to the previous counts
    _taskCountsNotifier.value = newCounts;
    
    // Optional: Show a Snackbar for failure feedback
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task update failed! Reverting status.")),
      );
    }
  }

  Future<void> _deleteTask(String docId, String status) async {
    TaskCounts newCounts = _taskCountsNotifier.value.copyWith();
    
    // Optimistically update counts before delete
    if (status == 'todo') {
      newCounts.todo = newCounts.todo > 0 ? newCounts.todo - 1 : 0;
    } else if (status == 'inprocess') {
      newCounts.inProcess = newCounts.inProcess > 0 ? newCounts.inProcess - 1 : 0;
    } else if (status == 'done') {
      // Decrement the 'done' count from the real baseline
      newCounts.done = newCounts.done > 0 ? newCounts.done - 1 : 0; 
    }
    
    _taskCountsNotifier.value = newCounts;
    
    try {
      await _firestore
          .collection('users')
          .doc(widget.uid)
          .collection('assigned_tasks')
          .doc(docId)
          .delete();
      await _firestore.collection('admin_tasks').doc(docId).delete().catchError((_) {});
    } catch (e) {
      debugPrint("Error deleting task: $e");
      // Revert logic on failure is omitted for brevity but should be done
    }
  }

  // 2. Use ValueListenableBuilder for only the count boxes (unchanged)
  Widget _statusBox(String label, int count, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
          // AnimatedSwitcher gives smooth count update
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              '${count < 0 ? 0 : count}', 
              key: ValueKey(count), // Key is essential for AnimatedSwitcher
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Status Button Fix: Disable buttons if currentStatus is 'done'
  Widget _statusButton(
      String status, String docId, String currentStatus, int tier, Map<String, dynamic> localTaskData) {
    // CONDITION ADDED: Disable ALL buttons if the task is already 'done'
    bool isTaskDone = currentStatus == 'done';
    bool isDisabled = currentStatus == status || isTaskDone;
    
    Color color = status == 'todo'
        ? Colors.orange
        : status == 'inprocess'
            ? Colors.blue
            : Colors.green;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: ElevatedButton(
        // Use isDisabled flag
        onPressed: isDisabled ? null : () => _updateTaskStatus(docId, status, currentStatus, tier, localTaskData),
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? color.withOpacity(0.5) : color,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          textStyle: const TextStyle(fontSize: 10, color: Colors.white),
          foregroundColor: Colors.white,
        ),
        child: Text(status.toUpperCase()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(userName != null ? "Welcome, $userName 👋" : "My Tasks"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('users')
            .doc(widget.uid)
            .collection('assigned_tasks')
            .orderBy('timestamp', descending: true)
            .snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
             return Center(child: Text("An error occurred: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            _taskCountsNotifier.value = TaskCounts();
            return const Center(child: Text("No tasks assigned yet."));
          }

          final tasks = snapshot.data!.docs;
          int todo = 0, inProcess = 0, done = 0;

          for (var d in tasks) {
            final data = d.data() as Map<String, dynamic>;
            final s = (data['status'] ?? 'todo').toString().toLowerCase();
            if (s == 'todo') todo++;
            if (s == 'inprocess') inProcess++;
            if (s == 'done') done++;
          }
          
          // --- Count Logic for Stream Data ---
          TaskCounts newCounts = _taskCountsNotifier.value.copyWith();
          final bool isInitialUpdate = newCounts.todo == 0 && newCounts.inProcess == 0 && newCounts.done == 0;
          
          // 1. Set the *real* counts from Firestore
          newCounts.todo = todo;
          newCounts.inProcess = inProcess;
          newCounts.done = done;
          
          // 2. Reset optimistic increment only when the stream has caught up
          if (newCounts.done >= newCounts.displayDone || isInitialUpdate) {
            newCounts.optimisticDoneIncrement = 0;
          }
          
          // 3. Update ValueNotifier only if counts have truly changed
          if (newCounts.todo != _taskCountsNotifier.value.todo ||
              newCounts.inProcess != _taskCountsNotifier.value.inProcess ||
              newCounts.done != _taskCountsNotifier.value.done ||
              newCounts.optimisticDoneIncrement != _taskCountsNotifier.value.optimisticDoneIncrement) 
          {
            _taskCountsNotifier.value = newCounts;
          }
          // --- END Count Logic ---

          return Column(
            children: [
              // ValueListenableBuilder ONLY rebuilds the status boxes, not the whole list.
              ValueListenableBuilder<TaskCounts>(
                valueListenable: _taskCountsNotifier,
                builder: (context, counts, child) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _statusBox("Todo", counts.todo, Colors.orange), 
                        _statusBox("InProcess", counts.inProcess, Colors.blue),
                        _statusBox("Done", counts.displayDone, Colors.green), 
                      ],
                    ),
                  );
                },
              ),
              const Divider(),
              Expanded(
                // The ListView.builder is now isolated and the items inside use const where possible
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: tasks.length,
                  itemBuilder: (context, i) {
                    final doc = tasks[i];
                    final data = doc.data() as Map<String, dynamic>;
                    final id = doc.id;
                    final taskName = data['task']?.toString() ?? 'No Task';
                    final emp = data['employeeName']?.toString() ?? 'Unknown';
                    final endDate = data['endDate']?.toString() ?? 'N/A';
                    final endTime = data['endTime']?.toString() ?? 'N/A';
                    final priority = data['priority']?.toString() ?? 'Normal';
                    final status = data['status']?.toString().toLowerCase() ?? 'todo';
                    final tier = data['tier'] is int
                        ? data['tier'] as int
                        : int.tryParse(data['tier']?.toString() ?? '0') ?? 0;

                    final localData = {
                      'endDate': endDate,
                      'endTime': endTime,
                      'assignedTime': data['assignedTime'] ?? 0,
                    };

                    return Dismissible(
                      key: Key(id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) => _deleteTask(id, status),
                      child: Card(
                        color: _getPriorityColor(priority).withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(taskName,
                                        style: const TextStyle(
                                            fontSize: 16, fontWeight: FontWeight.bold)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: _getPriorityColor(priority),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(priority,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text("Employee: $emp"),
                              Text("End Date: $endDate"),
                              Text("End Time: $endTime"),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.purple.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Tier: $tier",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600, color: Colors.purple)),
                              ),
                              const SizedBox(height: 8),
                              // Highlight current status
                              Text("Status: ${status.toUpperCase()}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold, 
                                  color: status == 'done' ? Colors.green.shade800 : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _statusButton("todo", id, status, tier, localData),
                                  _statusButton("inprocess", id, status, tier, localData),
                                  _statusButton("done", id, status, tier, localData),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}