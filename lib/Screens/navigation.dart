import 'package:flutter/material.dart';
import 'package:velga_application/Screens/attendenceHomePage.dart';
import 'package:velga_application/Screens/dashboard2.dart';
import 'package:velga_application/Screens/dashboard3.dart';
import 'package:velga_application/Screens/leavehomepage.dart';
import 'package:velga_application/Screens/msghomepage.dart';
import 'package:velga_application/Screens/profilepage.dart';
import 'package:velga_application/Screens/taskhomepage.dart';

class Navigationpage extends StatefulWidget {
  const Navigationpage({super.key});

  @override
  State<Navigationpage> createState() => NavigationpageState();
}

class NavigationpageState extends State<Navigationpage> {
int myindex =0;

final tabs =[
  Dashboard3(),
  Task1(),
  Msg1(),
  AttendenceHomePage(),
  Profilepage(),
];

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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.space_dashboard),label: 'Dashboard', ),
            BottomNavigationBarItem(icon: Icon(Icons.task),label: 'Task'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications),label: 'Notification'),
            BottomNavigationBarItem(icon: Icon(Icons.timer),label: 'Attedence'),
           BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),

        ],
        
        onTap: (index){
          setState(() {
            myindex =index;
          });
        },
        currentIndex: myindex,),

     
    );
  }
}
