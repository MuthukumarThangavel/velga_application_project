import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:velga_application/Screens/prodectivity.dart';
import 'package:velga_application/Screens/worktimepage.dart';

class Dashboard3 extends StatefulWidget {
  final String uid;

  const Dashboard3({super.key, required this.uid});

  @override
  State<Dashboard3> createState() => _Dashboard3State();
}

class _Dashboard3State extends State<Dashboard3> {
  Color circleColor = Colors.blueGrey;
  String statusText = "";

  String? intime;
  String? outtime;
  String userName = "User";

  @override
  void initState() {
    super.initState();
    _loadUserNameFromFirebase();
    _loadTimes();
  }

  Future<void> _loadUserNameFromFirebase() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.uid)
          .get();

      if (doc.exists) {
        final data = doc.data();
        if (data != null && data.containsKey('name')) {
          setState(() => userName = data['name'].toString());
        } else {
          setState(() => userName = "User");
        }
      }
    } catch (e) {
      debugPrint("⚠️ Error loading user name: $e");
      setState(() => userName = "User");
    }
  }

  Future<void> _loadTimes() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('savedDate');
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());

    if (savedDate != today) {
      await prefs.remove('intime');
      await prefs.remove('outtime');
      await prefs.setString('savedDate', today);
    }

    final inTimeSaved = prefs.getString('intime');
    final outTimeSaved = prefs.getString('outtime');

    setState(() {
      intime = inTimeSaved;
      outtime = outTimeSaved;

      if (intime != null && outtime == null) {
        circleColor = Colors.green;
        statusText = "In";
      } else if (outtime != null) {
        circleColor = Colors.blueGrey;
        statusText = "Out";
      } else {
        circleColor = Colors.blueGrey;
        statusText = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: size.height * 0.06),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.06),
                  child: Text(
                    userName,
                    style: TextStyle(
                      fontSize: size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
              ],
            ),

            SizedBox(height: size.height * 0.04),

                    Worktimepage(),
            SizedBox(height: size.height * 0.02),

            ProductivityPage(uid: widget.uid),
            SizedBox(height: size.height * 0.02),
            _buildLargeCard(size, "Active Users", "9"),
          ],
        ),
      ),
    );
  }

  Widget _buildLargeCard(Size size, String title, String value) {
    return Card(
      color: Colors.blueGrey,
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        height: size.height * 0.14,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.02)),
                Text("past 90 days",
                    style: TextStyle(
                        color: Colors.white70, fontSize: size.height * 0.014)),
              ],
            ),
            Row(
              children: [
                Text(value,
                    style: TextStyle(
                        fontSize: size.height * 0.06,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const Icon(Icons.arrow_upward, color: Colors.greenAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
