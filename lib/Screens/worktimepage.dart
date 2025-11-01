import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Worktimepage extends StatefulWidget {
  final String? userNameFromDashboard; // 🔹 Name passed from Dashboard

  const Worktimepage({super.key, this.userNameFromDashboard});

  @override
  State<Worktimepage> createState() => _WorktimepageState();
}

class _WorktimepageState extends State<Worktimepage> {
  String? startTime;
  String? endTime;
  Duration elapsed = Duration.zero;
  Timer? timer;
  bool isRunning = false;

  final user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  String userName = "User";

  @override
  void initState() {
    super.initState();
    _loadUserName();
    _loadTodayData();
  }

  /// 🔹 Load username (prefer Dashboard name → then Firestore)
  Future<void> _loadUserName() async {
    if (widget.userNameFromDashboard != null &&
        widget.userNameFromDashboard!.isNotEmpty) {
      setState(() => userName = widget.userNameFromDashboard!);
      return;
    }

    try {
      if (user == null) return;
      final doc = await firestore.collection('users').doc(user!.uid).get();
      if (doc.exists && doc.data() != null && doc.data()!.containsKey('name')) {
        setState(() => userName = doc['name']);
      }
    } catch (e) {
      debugPrint("⚠️ Error loading user name: $e");
    }
  }

  /// 🔹 Load today’s saved time (for continuation)
  Future<void> _loadTodayData() async {
    final todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final userId = user!.uid;

    final doc = await firestore
        .collection('worktimes')
        .doc(userId)
        .collection('days')
        .doc(todayDate)
        .get();

    if (doc.exists) {
      final data = doc.data()!;
      setState(() {
        elapsed = Duration(seconds: (data['totalSeconds'] ?? 0));
      });
    }
  }

  /// 🔹 Start timer
  void _startWork() {
    final now = DateTime.now();
    setState(() {
      startTime = DateFormat('hh:mm a').format(now);
      endTime = null;
      isRunning = true;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        elapsed = Duration(seconds: elapsed.inSeconds + 1);
      });
    });
  }

  /// 🔹 End work and save to Firestore
  void _endWork() async {
    final now = DateTime.now();
    timer?.cancel();

    setState(() {
      endTime = DateFormat('hh:mm a').format(now);
      isRunning = false;
    });

    final todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final userId = user!.uid;

    final docRef = firestore
        .collection('worktimes')
        .doc(userId)
        .collection('days')
        .doc(todayDate);

    // 🔹 Get previous total time if exists
    final existingDoc = await docRef.get();
    int previousTotal = 0;
    if (existingDoc.exists) {
      previousTotal = existingDoc.data()?['totalSeconds'] ?? 0;
    }

    // 🔹 Add new elapsed time to total
    int updatedTotal = elapsed.inSeconds;

    await docRef.set({
      'uid': userId,
      'userName': userName, // ✅ username from Dashboard or Firestore
      'date': todayDate,
      'startTime': startTime,
      'endTime': endTime,
      'totalSeconds': updatedTotal,
      'totalFormatted': _formatDuration(Duration(seconds: updatedTotal)),
      'timestamp': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  /// 🔹 Show total worked hours dialog
  

  /// 🔹 Format time display
  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes.remainder(60))}:${twoDigits(d.inSeconds.remainder(60))}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Center(
      child: Card(
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.02),
        ),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        elevation: 5,
        child: Container(
          height: 300,
          width: 320,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Work Timer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Timer display
              Text(
                _formatDuration(elapsed),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),
              if (startTime != null)
                Text("Start: $startTime",
                    style: const TextStyle(color: Colors.white70)),
              if (endTime != null)
                Text("End: $endTime",
                    style: const TextStyle(color: Colors.white70)),

              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Start Button
                  InkWell(
                    onTap: isRunning ? null : _startWork,
                    child: Card(
                      color: isRunning ? Colors.grey : Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 40,
                        width: 90,
                        alignment: Alignment.center,
                        child: const Text('Start'),
                      ),
                    ),
                  ),

                  // End Button
                  InkWell(
                    onTap: isRunning ? _endWork : null,
                    child: Card(
                      color: isRunning ? Colors.redAccent : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 40,
                        width: 90,
                        alignment: Alignment.center,
                        child: const Text('End'),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Total Hours Button
              
            ],
          ),
        ),
      ),
    );
  }
}
