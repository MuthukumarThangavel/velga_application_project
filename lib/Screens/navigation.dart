import 'package:flutter/material.dart';
import 'package:velga_application/Screens/attendenceHomePage.dart';
import 'package:velga_application/Screens/dashboard3.dart';
import 'package:velga_application/Screens/msghomepage.dart';
import 'package:velga_application/Screens/profilepage.dart';
import 'package:velga_application/Screens/taskhome.dart';

class Navigationpage extends StatefulWidget {
  final String uid; // ✅ receive user UID from login.dart

  const Navigationpage({super.key, required this.uid});

  @override
  State<Navigationpage> createState() => NavigationpageState();
}

class NavigationpageState extends State<Navigationpage> {
  int myindex = 0;

  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();
    // ✅ Pass UID to all pages that need user-specific data
    tabs = [
      Dashboard3(uid: widget.uid),
      Taskhome(uid: widget.uid),
      Msg1(uid: widget.uid),
      AttendenceHomePage(uid: widget.uid),
      Profilepage(uid: widget.uid),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[myindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconSize: 25,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.space_dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notification'),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Attendance'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: myindex,
        onTap: (index) {
          setState(() {
            myindex = index;
          });
        },
      ),
    );
  }
}
