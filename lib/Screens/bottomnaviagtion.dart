import 'package:flutter/material.dart';
import 'package:velga_application/Screens/dashboard2.dart';

class Naviagtion extends StatefulWidget {
  const Naviagtion({super.key});

  @override
  State<Naviagtion> createState() => _NaviagtionState();
}

class _NaviagtionState extends State<Naviagtion> {
  int index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        onTap: (Myindex){

           setState(() {
              index =Myindex;
           });
            
          

        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: 'dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month),label: 'Attedence'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task),label: 'Task'),
          BottomNavigationBarItem(icon: Icon(Icons.leave_bags_at_home),label: 'Leave'),
          
        ],
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,),

    );
  }
}