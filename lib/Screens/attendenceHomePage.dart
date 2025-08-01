// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AttendenceHomePage extends StatelessWidget {
//   const  AttendenceHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return  Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: const Color.fromARGB(255, 223, 223, 223),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [

//             Container(
//             height: size.height*0.35,
//             width: size.width*1.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(size.height*0.05),
//               bottomRight: Radius.circular(size.height*0.05)),
//               color: Colors.blueAccent,

//             ),
//             child: Stack(
//               children: [
//                 Row(

//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: size.height*0.08,
//                       left: size.height*0.028),
//                       height: size.height*0.05,
//                       width: size.width*0.9,
//                       color: Colors.transparent,
//                       child: Text("Let's Clock-In!",
//                       style: TextStyle(
//                         fontSize: size.height*0.04,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white
//                       ),),
//                     )
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: size.height*0.13,
//                       left: size.height*0.030),
//                        height: size.height*0.05,
//                       width: size.width*0.9,
//                       color: Colors.transparent,
//                       child: Text("Don't miss your clock in schedule ",
//                       style: TextStyle(
//                         color: const Color.fromARGB(255, 216, 212, 212),
//                         fontSize: size.height*0.018
//                       ),),
//                     )
//                   ],
//                 ),

//                 Positioned(
//                   right: size.width*-0.40,
//                   top: size.height*0.05,
//                   child: Container(
//                     height: size.height*0.12,
//                     width: size.width*1.09,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage("https://tse2.mm.bing.net/th/id/OIP.JBrHEAZcZGa8BPEOyLi8vgHaNL?pid=Api&P=0&h=180")),
//                         color: Colors.transparent,
//                     ),

//                   ),
//                 ),

//               ],
//             ),

//           ),

//          Stack(
//           clipBehavior: Clip.none,
//           children: [
//              Container(
//             height: size.height*0.3,
//             width: size.width*1.09,
//             color: Colors.transparent,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                  height: size.height*0.3,
//             width: size.width*1.09,
//             color: Colors.transparent,
//             child: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Positioned(
//                                 top: size.height*-0.16,
//                               child: Container(
//                                 margin: EdgeInsets.only(left: size.height*0.014),
//                                 height: size.height*0.29,
//                                 width: size.width*0.94,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(size.height*0.02),
//                                   color: Colors.white

//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(top: size.height*0.02,
//                                           left: size.height*0.023),
//                                           child: Text("Total Working Hour",
//                                           style: TextStyle(
//                                             fontSize: size.height*0.024,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black
//                                           ),),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(top: size.height*0.004,
//                                           left: size.height*0.026),
//                                           child: Text("Paid Period 1 Sept 2024-30 Sept 2024",
//                                           style: TextStyle(
//                                             fontSize: size.height*0.016,

//                                             color: Colors.black
//                                           ),),
//                                         )
//                                       ],
//                                     ),

//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Container(
//                                           margin: EdgeInsets.only(top:size.height*0.009),
//                                           height: size.height*0.085,
//                                           width:size.width*0.39,

//                                           decoration: BoxDecoration(
//                                             color: Colors.transparent,
//                                             borderRadius: BorderRadius.circular(size.height*0.01),
//                                             border: Border.all(color: Colors.black,width: size.height*0.0003)
//                                           ),
//                                           child: Container(
//                                             height: size.height*0.2,
//                                             width: size.width*0.3,
//                                             child: Column(
//                                               children: [
//                                                 Row(

//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(top: size.height*0.010,
//                                                   left: size.height*0.010),
//                                                   child: Icon(Icons.alarm,
//                                                   size: size.height*0.022,
//                                                   color: Colors.grey,),
//                                                 ),
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                     top: size.height*0.013,
//                                                   left: size.height*0.008
//                                                   ),
//                                                   child: Text("Today",
//                                                   style: TextStyle(
//                                                     fontSize: size.height*0.016,
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.bold
//                                                   ),),
//                                                 )
//                                               ],
//                                             ),
//                                             Row(

//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                     top: size.height*0.002,
//                                                     left: size.height*0.015),
//                                                   child: Text("00.00 Hrs",
//                                                   style: TextStyle(
//                                                     fontSize: size.height*0.025,
//                                                     color: Colors.black,
//                                                     fontWeight: FontWeight.bold
//                                                   ),),
//                                                 )
//                                               ],
//                                             )

//                                               ],
//                                             )
//                                           ),
//                                         ),

//                                           Container(
//                                           margin: EdgeInsets.only(top:size.height*0.009),
//                                           height: size.height*0.085,
//                                           width:size.width*0.39,

//                                           decoration: BoxDecoration(
//                                             color: Colors.transparent,
//                                             borderRadius: BorderRadius.circular(size.height*0.01),
//                                             border: Border.all(color: Colors.black,width: size.height*0.0003)
//                                           ),
//                                           child: Container(
//                                             height: size.height*0.2,
//                                             width: size.width*0.3,
//                                             child: Column(
//                                               children: [
//                                                 Row(

//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(top: size.height*0.010,
//                                                   left: size.height*0.010),
//                                                   child: Icon(Icons.alarm,
//                                                   size: size.height*0.022,
//                                                   color: Colors.grey,),
//                                                 ),
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                     top: size.height*0.013,
//                                                   left: size.height*0.008
//                                                   ),
//                                                   child: Text("This Pay Period",
//                                                   style: TextStyle(
//                                                     fontSize: size.height*0.016,
//                                                     color: Colors.grey,
//                                                     fontWeight: FontWeight.bold
//                                                   ),),
//                                                 )
//                                               ],
//                                             ),
//                                             Row(

//                                               children: [
//                                                 Container(
//                                                   margin: EdgeInsets.only(
//                                                     top: size.height*0.002,
//                                                     left: size.height*0.015),
//                                                   child: Text("32.00 Hrs",
//                                                   style: TextStyle(
//                                                     fontSize: size.height*0.025,
//                                                     color: Colors.black,
//                                                     fontWeight: FontWeight.bold
//                                                   ),),
//                                                 )
//                                               ],
//                                             )

//                                               ],
//                                             )
//                                           ),
//                                         ),

//                                             ],
//                                     ),

//                                     Container(
//                                       height: size.height*0.065,
//                                       width: size.width*0.8,

//                                       margin: EdgeInsets.only(top: size.height*0.028),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(size.height*0.1),
//                                         color: Colors.blueAccent,
//                                       ),
//                                       child: TextButton(

//                                         onPressed: (){
//                                           // Get.to(Attendence2());
//                                         },
//                                        child: Text("Clock In Now",
//                                        style: TextStyle(
//                                         fontSize: size.height*0.020,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold
//                                        ),),
//                                        ),
//                                     )
//                                   ],
//                                 ),
//                               ),

//                             ),

//               ],
//             ),

//                 ),

//               ],
//             ),

//           ),

//          Positioned(
//                   top: size.height*0.155,

//                   child:Container(
//                     margin: EdgeInsets.only(left: size.height*0.015),
//                   height: size.height*0.13,
//                   width: size.width*0.93,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(size.height*0.010),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: size.width*0.0003)
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.013),
//                             child: Icon(Icons.calendar_month,
//                             size: size.height*0.025,
//                             color: const Color.fromARGB(255, 124, 124, 124),),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.008),
//                             child: Text("27 September 2024",
//                             style: TextStyle(
//                               fontSize: size.height*0.018,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold
//                             ),),
//                           )
//                         ],
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(top: size.height*0.010),
//                         height: size.height*0.07,
//                         width: size.width*0.88,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(size.height*0.015),
//                           color: Colors.transparent,
//                           border: Border.all(color: Colors.black,
//                           width: size.width*0.0015)
//                         ),
//                         child: Column(
//                           children: [
//                             Row(

//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.023),

//                               child: Text("Total Hours",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),),
//                             ),

//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.074),
//                               child: Text("Clock in & Out",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.023),

//                               child: Text("08:00:00 hrs",
//                               style: TextStyle(
//                                 fontSize: size.height*0.022,
//                                 fontWeight: FontWeight.bold

//                               ),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.026),

//                               child: Text("09.00 AM - 05.00 PM",
//                               style: TextStyle(
//                                 fontSize: size.height*0.020,
//                                 fontWeight: FontWeight.bold
//                               ),),
//                             )
//                           ],
//                         )

//                           ],
//                         )

//                       )

//                     ],
//                   ),
//                  ) ),
//                  Positioned(
//                   top: size.height*0.310,

//                   child:Container(
//                     margin: EdgeInsets.only(left: size.height*0.015),
//                   height: size.height*0.13,
//                   width: size.width*0.93,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(size.height*0.010),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: size.width*0.0003)
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.013),
//                             child: Icon(Icons.calendar_month,
//                             size: size.height*0.025,
//                             color: const Color.fromARGB(255, 124, 124, 124),),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.008),
//                             child: Text("27 September 2024",
//                             style: TextStyle(
//                               fontSize: size.height*0.018,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold
//                             ),),
//                           )
//                         ],
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(top: size.height*0.010),
//                         height: size.height*0.07,
//                         width: size.width*0.88,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(size.height*0.015),
//                           color: Colors.transparent,
//                           border: Border.all(color: Colors.black,
//                           width: size.width*0.0015)
//                         ),
//                         child: Column(
//                           children: [
//                             Row(

//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.023),

//                               child: Text("Total Hours",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),),
//                             ),

//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.076),
//                               child: Text("Clock in & Out",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.023),

//                               child: Text("08:00:00 hrs",
//                               style: TextStyle(
//                                 fontSize: size.height*0.022,
//                                 fontWeight: FontWeight.bold

//                               ),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.028),

//                               child: Text("09.00 AM - 05.00 PM",
//                               style: TextStyle(
//                                 fontSize: size.height*0.020,
//                                 fontWeight: FontWeight.bold
//                               ),),
//                             )
//                           ],
//                         )

//                           ],
//                         )

//                       )

//                     ],
//                   ),
//                  ) ),

//                  Positioned(
//                   top: size.height*0.465,

//                   child:Container(
//                     margin: EdgeInsets.only(left: size.height*0.015),
//                   height: size.height*0.13,
//                   width: size.width*0.93,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(size.height*0.010),
//                     color: Colors.white,
//                     border: Border.all(
//                       color: Colors.black,
//                       width: size.width*0.0003)
//                   ),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.013),
//                             child: Icon(Icons.calendar_month,
//                             size: size.height*0.025,
//                             color: const Color.fromARGB(255, 124, 124, 124),),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(top: size.height*0.010,
//                             left: size.height*0.008),
//                             child: Text("27 September 2024",
//                             style: TextStyle(
//                               fontSize: size.height*0.018,
//                               color: Colors.black,
//                               fontWeight: FontWeight.bold
//                             ),),
//                           )
//                         ],
//                       ),

//                       Container(
//                         margin: EdgeInsets.only(top: size.height*0.010),
//                         height: size.height*0.07,
//                         width: size.width*0.88,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(size.height*0.015),
//                           color: Colors.transparent,
//                           border: Border.all(color: Colors.black,
//                           width: size.width*0.0015)
//                         ),
//                         child: Column(
//                           children: [
//                             Row(

//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.023),

//                               child: Text("Total Hours",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),),
//                             ),

//                             Container(
//                               margin: EdgeInsets.only(top: size.height*0.008,left: size.height*0.074),
//                               child: Text("Clock in & Out",
//                               style: TextStyle(
//                                 fontSize: size.height*0.015,
//                                 fontWeight: FontWeight.w400
//                               ),
//                               ),
//                             )
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.023),

//                               child: Text("08:00:00 hrs",
//                               style: TextStyle(
//                                 fontSize: size.height*0.020,
//                                 fontWeight: FontWeight.bold

//                               ),
//                               ),
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(left: size.height*0.037),

//                               child: Text("09.00 AM - 05.00 PM",
//                               style: TextStyle(
//                                 fontSize: size.height*0.020,
//                                 fontWeight: FontWeight.bold
//                               ),),
//                             )
//                           ],
//                         )

//                           ],
//                         )

//                       )

//                     ],
//                   ),
//                  ) ),

//           ],
//          ),

//           ],

//         ),
//       ),

//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'attendenceInandOutPage.dart'; // Uncomment if needed

class AttendenceHomePage extends StatelessWidget {
  const AttendenceHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // TODO: Replace with data from Firestore
    const recentAttendances = [
      {
        "date": "27 September 2024",
        "totalHours": "08:00:00 hrs",
        "clockInOut": "09.00 AM - 05.00 PM",
      },
      // Add more as needed...
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFEFEFEF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Large header
            Container(
              height: size.height * 0.36,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              padding: EdgeInsets.only(
                top: size.height * 0.08,
                left: 28,
                right: 28,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let's Clock-In!",
                    style: TextStyle(
                      fontSize: size.height * 0.04,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Don't miss your clock in schedule",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: size.height * 0.018,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),

                  // Total Working Hour Card
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          _WorkingHourBlock(
                            icon: Icons.alarm,
                            title: "Today",
                            hours: "00.00 Hrs",
                          ),
                          SizedBox(width: 16),
                          _WorkingHourBlock(
                            icon: Icons.alarm,
                            title: "This Pay Period",
                            hours: "32.00 Hrs",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),

            // Clock In Now button
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.065,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  // Get.to(() => AttendenceInandOutPage());
                  // TODO: Uncomment and import your page
                },
                child: Text(
                  "Clock In Now",
                  style: TextStyle(
                    fontSize: size.height * 0.020,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.025),

            // Recent Attendance Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Attendance",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),

            SizedBox(height: 10),
            // List of recent attendances
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: List.generate(
                  recentAttendances.length,
                  (i) => _AttendanceSummaryCard(data: recentAttendances[i]),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// COMPONENT for Today's/PayPeriod working hour summary
class _WorkingHourBlock extends StatelessWidget {
  final IconData icon;
  final String title, hours;

  const _WorkingHourBlock({
    required this.icon,
    required this.title,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, size: size.height * 0.022, color: Colors.grey),
              SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            hours,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.025,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

// COMPONENT for attendance summary cards
class _AttendanceSummaryCard extends StatelessWidget {
  final Map<String, String> data;
  const _AttendanceSummaryCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.015),
        child: Row(
          children: [
            Icon(
              Icons.calendar_month,
              color: Colors.blueGrey,
              size: size.height * 0.036,
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["date"]!,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      "Total Hours: ",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      data["totalHours"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Clock In & Out: ",
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      data["clockInOut"]!,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
