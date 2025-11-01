import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart'; // 💡 Ensure this package is in pubspec.yaml

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController taskController = TextEditingController();

  String? selectedName;
  String? selectedPriority;
  String? selectedStatus;
  String? selectedTier;
  
  DateTime? selectedEndDate;
  TimeOfDay? selectedEndTime;

  List<String> namesFromFirestore = [];

  final List<String> priorities = ['Normal', 'Moderate', 'Urgent'];
  final List<String> statuses = ['todo', 'inprocess', 'done'];
  final List<String> tiers = ['Tier 1', 'Tier 2', 'Tier 3', 'Tier 4'];

  @override
  void initState() {
    super.initState();
    _loadNames();
  }

  // Firestore-இல் இருந்து யூசர்களின் பெயர்களை லோட் செய்கிறது
  Future<void> _loadNames() async {
    // This is asynchronous, so use mounted check before setState
    if (!mounted) return; 
    try {
      final snap = await firestore.collection('users').get();
      namesFromFirestore = snap.docs
          .map((d) => d.data()['name']?.toString() ?? d.id)
          .where((n) => n.isNotEmpty)
          .toList();
      setState(() {});
    } catch (e) {
      // Handle error, e.g., print('Error loading names: $e');
    }
  }

  // Priority-க்கு ஏற்ற கலரை தருகிறது
  Color _getPriorityColor(String? p) {
    switch (p) {
      case 'Normal':
        return Colors.green;
      case 'Moderate':
        return Colors.orangeAccent;
      case 'Urgent':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Tier லேபிளிலிருந்து அதன் எண்ணைப் பிரித்தெடுக்கிறது
  int _parseTierIndex(String? tierLabel) {
    if (tierLabel == null) return 0;
    // Extract numbers, parse them, default to 0 if parsing fails
    return int.tryParse(tierLabel.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;
  }

  // Tier எண்ணிலிருந்து புள்ளிகளை கணக்கிடுகிறது
  int _getTierPoints(int tier) => tier + 1;

  // பெயரைக் கொண்டு UID-ஐ தேடுகிறது
  Future<String?> _findUidByName(String name) async {
    final q = await firestore
        .collection('users')
        .where('name', isEqualTo: name)
        .limit(1)
        .get();
    if (q.docs.isNotEmpty) return q.docs.first.id;
    return null;
  }

  // --- End Date Picker ---
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate ?? DateTime.now().add(const Duration(days: 7)),
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  // --- End Time Picker ---
  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedEndTime) {
      setState(() {
        selectedEndTime = picked;
      });
    }
  }


  // --- டாஸ்க்கை சேமிக்கும் ஃபங்ஷன் ---
  Future<void> _saveTask() async {
    if (selectedName == null ||
        taskController.text.trim().isEmpty ||
        selectedPriority == null ||
        selectedStatus == null ||
        selectedTier == null ||
        selectedEndDate == null ||
        selectedEndTime == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('All fields are mandatory!'), backgroundColor: Colors.red),
        );
      }
      return;
    }

    final employeeName = selectedName!;
    final uid = await _findUidByName(employeeName);
    if (uid == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User $employeeName not found!'), backgroundColor: Colors.red),
        );
      }
      return;
    }

    final date = DateFormat('yyyy-MM-dd').format(selectedEndDate!);
    // Ensure you use context for format() inside a widget method
    final time = selectedEndTime!.format(context); 
    final tierInt = _parseTierIndex(selectedTier);
    final tierPoints = _getTierPoints(tierInt);

    // ✅ 1️⃣ புதிய doc reference உருவாக்குதல் மற்றும் ID-ஐ எடுத்தல்
    final adminDocRef = firestore.collection('admin_tasks').doc();
    final newDocId = adminDocRef.id;

    final taskData = {
      'docId': newDocId, 
      'employeeName': employeeName,
      'userId': uid,
      'task': taskController.text.trim(),
      'priority': selectedPriority,
      'status': selectedStatus,
      'tier': tierInt,
      'assignedPoints': tierPoints,
      'endDate': date,
      'endTime': time,
      'assignedBy': 'admin',
      'assignedAt': FieldValue.serverTimestamp(),
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Use a batch write for atomicity and efficiency
    final batch = firestore.batch();

    // ✅ 2️⃣ admin_tasks-க்கு எழுதுதல்
    batch.set(adminDocRef, taskData);
    
    // ✅ 3️⃣ யூசரின் subcollection-க்கு எழுதுதல்
    final userTaskRef = firestore
        .collection('users')
        .doc(uid)
        .collection('assigned_tasks')
        .doc(newDocId);
    batch.set(userTaskRef, taskData);
    
    await batch.commit();

    // 🔥 சேமித்த பின் UI-ஐ உடனே கிளியர் செய்தல்
    taskController.clear();
    if (mounted) {
      setState(() {
        selectedName = null;
        selectedPriority = null;
        selectedStatus = null;
        selectedTier = null;
        selectedEndDate = null;
        selectedEndTime = null;
      });
    }
     if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task assigned successfully!'), backgroundColor: Colors.green),
        );
      }
  }

  // --- டாஸ்க்கை எடிட் செய்வதற்கான டயலாக் (முழுமையான எடிட் ஆப்ஷன்) ---
  Future<void> _editTaskDialog(String docId, Map<String, dynamic> data) async {
    String originalEmployeeName = data['employeeName'] ?? '';
    String originalUid = data['userId'];

    String task = data['task'] ?? '';
    String employeeName = originalEmployeeName; 
    String priority = data['priority'] ?? 'Normal';
    String status = data['status'] ?? 'todo';
    int tier = data['tier'] ?? 1;
    String tierLabel = 'Tier $tier';
    
    DateTime? dialogEndDate;
    TimeOfDay? dialogEndTime;
    
    // Date Parsing
    try {
      if (data['endDate'] is String && data['endDate'].isNotEmpty) {
          dialogEndDate = DateFormat('yyyy-MM-dd').parse(data['endDate']);
      }
    } catch (_) {
        // Parsing error: ignore and leave dialogEndDate null
    }

    // Time Parsing
    try {
        if (data['endTime'] is String && data['endTime'].isNotEmpty) {
            final timeString = data['endTime'] as String;
            // Handle both "h:mm a" (e.g., 5:30 PM) and "H:mm" (e.g., 17:30) formats if needed. 
            // Assuming your format(context) uses the default locale style (like 5:30 PM)
            final format = DateFormat.jm(); // Uses locale's time pattern (e.g., h:mm a)
            final dt = format.parse(timeString);
            dialogEndTime = TimeOfDay.fromDateTime(dt);
        }
    } catch (e) {
      // Parsing error: ignore and leave dialogEndTime null
    }


    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task for $originalEmployeeName'),
          content: StatefulBuilder(
            builder: (context, setStateDialog) {
              
              // Date/Time Pickers inside dialog state
              Future<void> selectDialogDate() async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: dialogEndDate ?? DateTime.now().add(const Duration(days: 7)),
                  firstDate: DateTime.now().subtract(const Duration(days: 0)),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != dialogEndDate) {
                  setStateDialog(() => dialogEndDate = picked);
                }
              }

              Future<void> selectDialogTime() async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: dialogEndTime ?? TimeOfDay.now(),
                );
                if (picked != null && picked != dialogEndTime) {
                  setStateDialog(() => dialogEndTime = picked);
                }
              }

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // 1. Employee Name Dropdown (Re-assignment)
                    DropdownButtonFormField2<String>(
                      value: employeeName,
                      decoration: const InputDecoration(
                          labelText: 'Assign To', border: OutlineInputBorder()),
                      items: namesFromFirestore
                          .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                          .toList(),
                      onChanged: (v) => setStateDialog(() => employeeName = v!),
                    ),
                    const SizedBox(height: 12),
                    // 2. Task Description
                    TextFormField(
                      initialValue: task,
                      onChanged: (v) => task = v,
                      decoration: const InputDecoration(
                          labelText: 'Task Description', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    // 3. Priority
                    DropdownButtonFormField2<String>(
                      value: priority,
                      items: priorities
                          .map((p) => DropdownMenuItem(
                              value: p,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      radius: 6,
                                      backgroundColor: _getPriorityColor(p)),
                                  const SizedBox(width: 8),
                                  Text(p)
                                ],
                              )))
                          .toList(),
                      onChanged: (v) => setStateDialog(() => priority = v!),
                      decoration: const InputDecoration(
                          labelText: 'Priority', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    // 4. Status
                    DropdownButtonFormField2<String>(
                      value: status,
                      items: statuses
                          .map((s) =>
                              DropdownMenuItem(value: s, child: Text(s.toUpperCase())))
                          .toList(),
                      onChanged: (v) => setStateDialog(() => status = v!),
                      decoration: const InputDecoration(
                          labelText: 'Status', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    // 5. Tier
                    DropdownButtonFormField2<String>(
                      value: tierLabel,
                      items: tiers
                          .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                          .toList(),
                      onChanged: (v) => setStateDialog(() => tierLabel = v!),
                      decoration: const InputDecoration(
                          labelText: 'Tier', border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 12),
                    
                    // --- 6. & 7. End Date and Time Pickers (Row/Card Layout) ---
                    Row(
                      children: [
                        // End Date
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: selectDialogDate,
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_today, color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('End Date', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                          Text(
                                            dialogEndDate == null
                                                ? 'Select Date'
                                                : DateFormat('MMM d, yyyy').format(dialogEndDate!),
                                            style: TextStyle(
                                                fontWeight: dialogEndDate == null ? FontWeight.normal : FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // End Time
                        Expanded(
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            child: InkWell(
                              onTap: selectDialogTime,
                              borderRadius: BorderRadius.circular(8),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.access_time, color: Colors.blue),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('End Time', style: TextStyle(fontSize: 12, color: Colors.black54)),
                                          Text(
                                            dialogEndTime == null
                                                ? 'Select Time'
                                                : dialogEndTime!.format(context),
                                            style: TextStyle(
                                                fontWeight: dialogEndTime == null ? FontWeight.normal : FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // End of Row/Card implementation in dialog
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (dialogEndDate == null || dialogEndTime == null) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('End Date and Time must be set!'), backgroundColor: Colors.orange),
                    );
                  }
                  return;
                }

                final tierIndex = _parseTierIndex(tierLabel);
                final points = _getTierPoints(tierIndex);
                final newDate = DateFormat('yyyy-MM-dd').format(dialogEndDate!);
                final newTime = dialogEndTime!.format(context);

                Map<String, dynamic> updatedData = {
                  'task': task,
                  'priority': priority,
                  'status': status,
                  'tier': tierIndex,
                  'assignedPoints': points,
                  'endDate': newDate,
                  'endTime': newTime,
                  'lastEditedAt': FieldValue.serverTimestamp(),
                  // These are needed in case of re-assignment below
                  'docId': docId,
                  'assignedBy': data['assignedBy'] ?? 'admin', // Preserve original or set default
                  'assignedAt': data['assignedAt'], // Preserve original timestamp
                };

                List<Future<void>> updateFutures = [];
                String currentUid = originalUid;

                // --- 1. பணியாளர் பெயர் மாற்றம் இருந்தால் ---
                if (employeeName != originalEmployeeName) {
                  final newUid = await _findUidByName(employeeName);
                  if (newUid == null) {
                    if (context.mounted) Navigator.pop(context);
                    return; 
                  }

                  // ✅ பழைய யூசரின் கலெக்ஷனில் இருந்து நீக்குதல்
                  updateFutures.add(firestore
                      .collection('users')
                      .doc(originalUid)
                      .collection('assigned_tasks')
                      .doc(docId)
                      .delete());

                  // ✅ புதிய யூசரின் கலெக்ஷனுக்கு எழுதுதல் (SET with updated fields)
                  updatedData['userId'] = newUid;
                  updatedData['employeeName'] = employeeName; // Update name in data
                  updateFutures.add(firestore
                      .collection('users')
                      .doc(newUid)
                      .collection('assigned_tasks')
                      .doc(docId)
                      .set(updatedData, SetOptions(merge: true)));
                      
                  currentUid = newUid;
                } else {
                    // பெயர் மாறவில்லை என்றாலும், updatedData-வில் employeeName & userId இருக்க வேண்டும்
                    updatedData['employeeName'] = originalEmployeeName;
                    updatedData['userId'] = originalUid;
                }

                // --- 2. admin_tasks மற்றும் (மாறாத/புதிய) யூசர் subcollection-ஐ அப்டேட் செய்தல் ---
                
                // ✅ admin_tasks-ஐ அப்டேட் செய்கிறது (always UPDATE as it exists)
                updateFutures.add(firestore.collection('admin_tasks').doc(docId).update(updatedData));
                
                // ✅ பெயர் மாறவில்லை என்றால், பழைய யூசரின் subcollection-ஐ அப்டேட் செய்கிறது (UPDATE)
                if (employeeName == originalEmployeeName) {
                   updateFutures.add(firestore
                       .collection('users')
                       .doc(originalUid)
                       .collection('assigned_tasks')
                       .doc(docId)
                       .update(updatedData));
                }

                await Future.wait(updateFutures);

                if (context.mounted) {
                  Navigator.pop(context);
                   // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Task updated successfully!'), backgroundColor: Colors.green),
                  );
                }
                // setState() here to ensure the main screen rebuilds if needed
                setState(() {}); 
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  // --- UI Build ---
  @override
  Widget build(BuildContext context) {
    final priorityColor = _getPriorityColor(selectedPriority);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Task Assignment'), // Admin Page
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // --- ASSIGNMENT FORM FIELDS ---
              DropdownButtonFormField2<String>(
                value: selectedName,
                decoration: const InputDecoration(
                    labelText: 'Select Employee', border: OutlineInputBorder()),
                items: namesFromFirestore
                    .map((n) => DropdownMenuItem(value: n, child: Text(n)))
                    .toList(),
                onChanged: (v) => setState(() => selectedName = v),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: taskController,
                decoration: const InputDecoration(
                    labelText: 'Task Description', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField2<String>(
                value: selectedPriority,
                decoration: InputDecoration(
                    labelText: 'Priority',
                    border: const OutlineInputBorder(),
                    suffixIcon: selectedPriority != null
                        ? Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: priorityColor),
                          )
                        : null),
                items: priorities
                    .map((p) => DropdownMenuItem(
                            value: p,
                            child: Row(children: [
                              CircleAvatar(
                                  radius: 6, backgroundColor: _getPriorityColor(p)),
                              const SizedBox(width: 8),
                              Text(p)
                            ])))
                    .toList(),
                onChanged: (v) => setState(() => selectedPriority = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField2<String>(
                value: selectedTier,
                decoration: const InputDecoration(
                    labelText: 'Select Tier', border: OutlineInputBorder()),
                items: tiers
                    .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                    .toList(),
                onChanged: (v) => setState(() => selectedTier = v),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField2<String>(
                value: selectedStatus,
                decoration: const InputDecoration(
                    labelText: 'Initial Status', border: OutlineInputBorder()),
                items: statuses
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toUpperCase())))
                    .toList(),
                onChanged: (v) => setState(() => selectedStatus = v),
              ),
              
              const SizedBox(height: 12),

              // --- END DATE & TIME PICKERS (Row/Card Layout) ---
              Row(
                children: [
                  // --- END DATE PICKER ---
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () => _selectEndDate(context),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('End Date',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
                                    Text(
                                      selectedEndDate == null
                                          ? 'Select Date'
                                          : DateFormat('MMM d, yyyy')
                                              .format(selectedEndDate!),
                                      style: TextStyle(
                                          fontWeight:
                                              selectedEndDate == null
                                                  ? FontWeight.normal
                                                  : FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // --- END TIME PICKER ---
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: InkWell(
                        onTap: () => _selectEndTime(context),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          child: Row(
                            children: [
                              const Icon(Icons.access_time,
                                  color: Colors.blue),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('End Time',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
                                    Text(
                                      selectedEndTime == null
                                          ? 'Select Time'
                                          : selectedEndTime!.format(context),
                                      style: TextStyle(
                                          fontWeight:
                                              selectedEndTime == null
                                                  ? FontWeight.normal
                                                  : FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // --- ASSIGN TASK BUTTON ---
              ElevatedButton(
                onPressed: _saveTask,
                style: ElevatedButton.styleFrom(
                  backgroundColor: priorityColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Assign Task',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const Divider(height: 40),
              // --- ASSIGNED TASKS LIST ---
              const Text('📋 Assigned Tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              const SizedBox(height: 12),
              StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('admin_tasks')
                    .orderBy('timestamp', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator()); 
                  }
                  
                  if (snapshot.hasError) {
                    return Text('Error loading tasks: ${snapshot.error}');
                  }

                  final docs = snapshot.data?.docs ?? [];
                  if (docs.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(child: Text('No tasks assigned yet. Start assigning tasks above!', style: TextStyle(color: Colors.grey))),
                    );
                  }
                  
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: docs.length,
                    itemBuilder: (context, i) {
                      final data = docs[i].data() as Map<String, dynamic>;
                      // Use docs[i].id for docId since you use .doc() without ID in _saveTask, 
                      // but save the auto-generated ID as 'docId' in the map. The map's 'docId' is safer.
                      final docId = data['docId'] ?? docs[i].id; 
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: _getPriorityColor(data['priority']),
                            child: Text(
                              (data['status'] as String).substring(0, 1).toUpperCase(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                            ),
                          ),
                          title: Text(data['task'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              "👤 ${data['employeeName']} • Ends: ${data['endDate']} ${data['endTime']}\n🏷️ Tier ${data['tier']} (${data['assignedPoints']} pts) • Status: ${(data['status'] as String).toUpperCase()}"),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editTaskDialog(docId, data),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}