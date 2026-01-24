import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class AttendenceHomePage extends StatefulWidget {
  final String uid;
  const AttendenceHomePage({super.key, required this.uid});

  @override
  State<AttendenceHomePage> createState() => _AttendenceHomePageState();
}

class _AttendenceHomePageState extends State<AttendenceHomePage> {
  bool isClockedIn = false;
  bool isClockedOut = false;
  String? currentDocId;

  @override
  void initState() {
    super.initState();
    _checkTodayStatus();
  }

  // ✅ Check today's attendance status
  Future<void> _checkTodayStatus() async {
    final today = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final snapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .where('uid', isEqualTo: widget.uid)
        .where('date', isEqualTo: today)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final data = doc.data();

      setState(() {
        currentDocId = doc.id;
        isClockedIn = data['clockIn'] != null && data['clockIn'] != '';
        isClockedOut = data['clockOut'] != null && data['clockOut'] != '';
      });
    }
  }

  // ✅ Clock In
  Future<void> _clockIn() async {
    final today = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(now);

    // Check if already clocked in today
    final snapshot = await FirebaseFirestore.instance
        .collection('attendance')
        .where('uid', isEqualTo: widget.uid)
        .where('date', isEqualTo: today)
        .get();

    if (snapshot.docs.isNotEmpty) {
      Get.snackbar("Already Clocked In", "You have already clocked in today!");
      return;
    }

    final docRef = await FirebaseFirestore.instance.collection('attendance').add({
      'uid': widget.uid,
      'date': today,
      'clockIn': formattedTime,
      'clockOut': '',
      'totalHours': '',
      'timestamp': FieldValue.serverTimestamp(),
    });

    setState(() {
      isClockedIn = true;
      isClockedOut = false;
      currentDocId = docRef.id;
    });

    Get.snackbar("Success", "Clocked In at $formattedTime");
  }

  // ✅ Clock Out
  Future<void> _clockOut() async {
    if (currentDocId == null) {
      Get.snackbar("Error", "No active clock-in found for today!");
      return;
    }

    if (isClockedOut) {
      Get.snackbar("Already Clocked Out", "You have already clocked out today!");
      return;
    }

    final now = DateTime.now();
    final formattedTime = DateFormat('hh:mm a').format(now);

    final docRef =
        FirebaseFirestore.instance.collection('attendance').doc(currentDocId);
    final snapshot = await docRef.get();
    final data = snapshot.data();
    if (data == null) return;

    // ✅ Fix: parse with date to avoid 489384 hrs issue
    final todayDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    final clockInDateTime = DateFormat('dd MMMM yyyy hh:mm a')
        .parse("$todayDate ${data['clockIn']}");

    final duration = now.difference(clockInDateTime);
    final totalHours =
        "${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')} hrs";

    await docRef.update({
      'clockOut': formattedTime,
      'totalHours': totalHours,
    });

    setState(() {
      isClockedOut = true;
      isClockedIn = false;
      currentDocId = null;
    });

    Get.snackbar("Success", "Clocked Out at $formattedTime");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final today = DateFormat('dd MMMM yyyy').format(DateTime.now());

    final Color containerColor = isClockedIn && !isClockedOut
        ? Colors.green
        : Colors.blueGrey;
    final Color textColor = Colors.white;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F9),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Attendance", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // 🔵 Status Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: containerColor.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      isClockedIn && !isClockedOut
                          ? "You are Clocked In!"
                          : isClockedOut
                              ? "You have Clocked Out Today"
                              : "Not Clocked In Yet",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isClockedIn && !isClockedOut
                          ? "Tap below to Clock Out"
                          : isClockedOut
                              ? "You already completed today's attendance"
                              : "Tap below to Clock In",
                      style: TextStyle(color: textColor.withOpacity(0.8)),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: size.width * 0.8,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () async {
                          if (isClockedOut) {
                            Get.snackbar(
                                "Done", "You already clocked out today!");
                          } else if (isClockedIn) {
                            await _clockOut();
                          } else {
                            await _clockIn();
                          }
                          _checkTodayStatus(); // refresh after action
                        },
                        child: Text(
                          isClockedOut
                              ? "Completed"
                              : isClockedIn
                                  ? "Clock Out"
                                  : "Clock In",
                          style: TextStyle(
                            color: containerColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 🕒 Attendance Details
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('attendance')
                  .where('uid', isEqualTo: widget.uid)
                  .where('date', isEqualTo: today)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("No attendance for today."),
                  );
                }

                final doc = snapshot.data!.docs.first;
                final data = doc.data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.blueAccent),
                              const SizedBox(width: 8),
                              Text(
                                data['date'] ?? '-',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Clock In: ${data['clockIn'] ?? '--'}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          Text(
                            "Clock Out: ${data['clockOut'] == '' ? '--' : data['clockOut']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Total Hours: ${data['totalHours'] == '' ? '--' : data['totalHours']}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
