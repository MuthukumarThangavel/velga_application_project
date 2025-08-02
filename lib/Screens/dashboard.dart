// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size =MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
        
//         Container(
//             height: size.height*0.45,
//             width: size.width*0.99,
//             color: const Color.fromARGB(255, 0, 130, 237),
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.topRight,
              
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: size.height*0.12),
//                       height: size.height*0.12,
//                       width: size.width*0.30,
                      
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(width: size.width*0.003,
//                         color: Colors.white),
                        
//                         color: Colors.white
//                       ),
//                       child: Container(
                        
//                         height: size.height*0.05,
//                         width: size.width*0.1,
//                         child: CircleAvatar(
//                           backgroundImage: NetworkImage('https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg'),
                          
                          
                          
//                         ),
//                       ),
                      
//                     ),
                    
                    
//                   ],
//                 ),
//                 Container(
//                   alignment: Alignment.bottomCenter,
//                   margin: EdgeInsets.only(bottom: size.height*0.14),
//                     child: Text('MUTHUKUMAR',
//                     style: TextStyle(
//                       fontSize: size.height*0.022,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white
//                     ),),
//                 ),
                
                
                
//                 Container(
                  
                  
//                   height: size.height*0.13,
//                   width: size.width*0.3,
//                   decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white.withOpacity(0.50)
//                       ),
//                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.width*0.5)),
//                       color: Colors.white,
//                       gradient: LinearGradient(
//                         colors:[
//                           Colors.white.withOpacity(0.40),
//                           Colors.white.withOpacity(0.40)
//                         ] )
//                     ),
                    
          
//                 ),
          
//                 Positioned(
//                   bottom: size.height*0.0,
//                   left: size.height*0.0,
//                   child: Container(
//                     height: size.height*0.13,
//                     width: size.width*0.3,
          
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.white.withOpacity(0.50)
//                       ),
//                       borderRadius: BorderRadius.only(topRight: Radius.circular(size.width*0.5)),
//                       color: Colors.white,
//                       gradient: LinearGradient(
//                         colors:[
//                           Colors.white.withOpacity(0.40),
//                           Colors.white.withOpacity(0.40)
//                         ] )
//                     ),
//                   ),
//                 )
//               ],
//             ),
            
//           ),
          
//           Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Container(
                
//                 height: size.height*0.6,
//                 width: size.width*1.00,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height*0.05),
//                   topRight: Radius.circular(size.height*0.05)),
//                   color: Colors.white,
//                 ),
//                 child: Container(
//                  height: size.height*0.6,
//                 width: size.width*1.00,
//                   color: Colors.transparent,
//                   child: Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Positioned(
//                         top: size.height*-0.09,
//                         left: size.height*0.017,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          
//                           children: [
//                             InkWell(
//                               onTap: (){
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: size.height*0.05),
                                
                              
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     ),
                                    
//                                   ],
//                                   border: Border.all(color: Colors.black,width: 0.30)
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                       height: size.height*0.07,
//                                       width: size.width*0.2,
                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white
//                                       ),
//                                       child: Icon(Icons.task,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("TASK",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: (){
//                               },
//                               child: Container(
                                
                              
                                                    
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     )
//                                   ],
//                                      border: Border.all(color: Colors.black,width: 0.30)
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                       height: size.height*0.07,
//                                       width: size.width*0.2,

                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
//                                       ),
//                                       child: Icon(Icons.calendar_month,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("ATTEDENCE",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
                                
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height*0.01,),
//                       Positioned(
//                         left: size.height*0.018,
//                         top: size.height*0.12,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          
//                           children: [
//                             InkWell(
//                               onTap: (){
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: size.height*0.05),
                                
                              
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     )
//                                   ],
//                                      border: Border.all(color: Colors.black,width: 0.30)
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                        height: size.height*0.07,
//                                       width: size.width*0.2,

                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
//                                       ),
//                                       child: Icon(Icons.date_range,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("LEAVE",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               onTap: (){
//                               },
//                               child: Container(
                              
                                                    
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     )
//                                   ],
//                                      border: Border.all(color: Colors.black,width: 0.30)
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                       height: size.height*0.07,
//                                       width: size.width*0.2,

                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
//                                       ),
//                                       child: Icon(Icons.attach_money_outlined,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("FEES",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: size.height*0.01,),
        
//                       Positioned(
//                        left: size.height*0.018,
//                         top: size.height*0.33,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          
//                           children: [
//                             InkWell(
//                               onTap: (){
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.only(right: size.height*0.05),
                                
                              
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     )
//                                   ],
//                                      border: Border.all(color: Colors.black,width: 0.30)
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                       height: size.height*0.07,
//                                       width: size.width*0.2,

                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
//                                       ),
//                                       child: Icon(Icons.inbox,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("INBOX",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             InkWell(
//                               child: Container(
                              
                                                    
//                                 height: size.height*0.18,
//                                 width: size.width*0.40,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//         color: const Color.fromARGB(179, 255, 255, 255),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: const Color.fromARGB(255, 61, 60, 60),
//                                       offset: Offset(size.height*0.005, size.height*0.009),
//                                       blurRadius: size.height*0.005
//                                     )
//                                   ],
//                                      border: Border.all(color: Colors.black,width: 0.30)
                                  
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Container(
                                      
                                      
//                                        height: size.height*0.07,
//                                       width: size.width*0.2,

                                      
//                                       decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.white,
                                       
//                                       ),
//                                       child: Icon(Icons.star,
//                                                    size: size.height*0.035 ,
//                                                    color: Colors.black,
//                                                        ),
//                                     ),
//                                     SizedBox(height: size.height*0.01,),
//                                     Container(
//                                       child: Text("REVIEW",
//                                       style: TextStyle(
//                                         fontSize: size.height*0.019,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black
//                                       ),),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
             
//             ],
//           )
        
        
//           ],
          
//         ),
//       ),


      
      
      
//     );
//   }
// }
//------------------
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:velga_application/Screens/attendenceHomePage.dart';
// import 'package:velga_application/services/notification_helper.dart';

// import '../services/geofence_attendance_service.dart';

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // App colors
//     const profileBgColor = Color.fromARGB(255, 0, 130, 237);

// //    void initState() {
// //   super.initState();
// //   startGeofencing();  // Now listens for entry/exit and auto-punch
// // }

//   // This function is called automatically by the geofence service
//   void _autoPunch(String type) {
//     // 1. Save to Firestore or your attendance backend (if needed)
//     // 2. Show a local notification to user
//     showNotification('Attendance', 'Auto punch $type completed!');
//     // 3. Optionally refresh the UI or attendance records
//   }



//     return Scaffold(
//       backgroundColor: Colors.blue,
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // TOP PROFILE SECTION
//             Container(
//               height: size.height * 0.38,
//               width: double.infinity,
//               color: profileBgColor,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Profile avatar
//                   CircleAvatar(
//                     radius: size.height * 0.07,
//                     backgroundImage: NetworkImage(
//                       'https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg',
//                     ),
//                     backgroundColor: Colors.white,
//                   ),
//                   const SizedBox(height: 16),
//                   // Profile name
//                   Text(
//                     'MUTHUKUMAR',
//                     style: TextStyle(
//                       fontSize: size.height * 0.025,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             // BOTTOM ACTION CARDS SECTION
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(
//                   top: Radius.circular(size.height * 0.045),
//                 ),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 8,
//                     offset: Offset(0, -4),
//                   ),
//                 ],
//               ),
//               padding: EdgeInsets.symmetric(
//                 horizontal: size.width * 0.06,
//                 vertical: size.height * 0.04,
//               ),
//               child: Column(
//                 children: [
//                   // TOP ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       DashboardCard(
//                         icon: Icons.task,
//                         label: "TASK",
//                         onTap: () {},
//                       ),
//                       DashboardCard(
//                         icon: Icons.calendar_month,
//                         label: "ATTENDANCE",
//                         onTap: () {
//                           Get.to(AttendenceHomePage());
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   // MIDDLE ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       DashboardCard(
//                         icon: Icons.date_range,
//                         label: "LEAVE",
//                         onTap: () {},
//                       ),
//                       DashboardCard(
//                         icon: Icons.attach_money_outlined,
//                         label: "FEES",
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: size.height * 0.025),
//                   // BOTTOM ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       DashboardCard(
//                         icon: Icons.inbox,
//                         label: "INBOX",
//                         onTap: () {},
//                       ),
//                       DashboardCard(
//                         icon: Icons.star,
//                         label: "REVIEW",
//                         onTap: () {},
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // REUSABLE CARD WIDGET FOR DASHBOARD
// class DashboardCard extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onTap;
//   const DashboardCard({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(size.height * 0.02),
//       child: Container(
//         height: size.height * 0.17,
//         width: size.width * 0.36,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(size.height * 0.02),
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 4,
//               offset: Offset(2, 3),
//             ),
//           ],
//           border: Border.all(color: Colors.black12, width: 0.7),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: size.height * 0.035,
//               backgroundColor: Colors.blue.shade50,
//               child: Icon(
//                 icon,
//                 size: size.height * 0.035,
//                 color: Colors.black87,
//               ),
//             ),
//             SizedBox(height: size.height * 0.02),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: size.height * 0.020,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.black87,
//                 letterSpacing: 0.5,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//-----------------------------

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/attendenceHomePage.dart';
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  // void initState() {
  //   super.initState();
  //   // Start the geofencing service when the dashboard loads.
  //   // This will automatically trigger punch-in/out based on location.
  //   GeofenceAttendanceService.instance.start();
  // }

  // @override
  // void dispose() {
  //   // Stop the geofencing service when the dashboard is disposed.
  //   GeofenceAttendanceService.instance.stop();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // App colors
    const profileBgColor = Color.fromARGB(255, 0, 130, 237);

    return Scaffold(
      backgroundColor: Colors.blue,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP PROFILE SECTION
            Container(
              height: size.height * 0.38,
              width: double.infinity,
              color: profileBgColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Profile avatar
                  CircleAvatar(
                    radius: size.height * 0.07,
                    backgroundImage: const NetworkImage(
                      'https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg',
                    ),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  // Profile name
                  Text(
                    'MUTHUKUMAR',
                    style: TextStyle(
                      fontSize: size.height * 0.025,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM ACTION CARDS SECTION
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(size.height * 0.045),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.06,
                vertical: size.height * 0.04,
              ),
              child: Column(
                children: [
                  // TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardCard(
                        icon: Icons.task,
                        label: "TASK",
                        onTap: () {
                          // Handle Task navigation
                        },
                      ),
                      DashboardCard(
                        icon: Icons.calendar_month,
                        label: "ATTENDANCE",
                        onTap: () {
                          Get.to(() => const AttendenceHomePage());
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  // MIDDLE ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardCard(
                        icon: Icons.date_range,
                        label: "LEAVE",
                        onTap: () {
                          // Handle Leave navigation
                        },
                      ),
                      DashboardCard(
                        icon: Icons.attach_money_outlined,
                        label: "FEES",
                        onTap: () {
                          // Handle Fees navigation
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.025),
                  // BOTTOM ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardCard(
                        icon: Icons.inbox,
                        label: "INBOX",
                        onTap: () {
                          // Handle Inbox navigation
                        },
                      ),
                      DashboardCard(
                        icon: Icons.star,
                        label: "REVIEW",
                        onTap: () {
                          // Handle Review navigation
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// REUSABLE CARD WIDGET FOR DASHBOARD
class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const DashboardCard({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(size.height * 0.02),
      child: Container(
        height: size.height * 0.17,
        width: size.width * 0.36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.02),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 3),
            ),
          ],
          border: Border.all(color: Colors.black12, width: 0.7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: size.height * 0.035,
              backgroundColor: Colors.blue.shade50,
              child: Icon(
                icon,
                size: size.height * 0.035,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              label,
              style: TextStyle(
                fontSize: size.height * 0.020,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

