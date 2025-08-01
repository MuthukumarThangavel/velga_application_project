// import 'package:flutter/material.dart';

// class AttendenceInandOutPage extends StatelessWidget {
//   const AttendenceInandOutPage({super.key});
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(backgroundColor: Colors.transparent),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             Container(
//               height: size.height * 0.4,
//               width: size.width * 0.999,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     "https://tse1.mm.bing.net/th/id/OIP.v22u2J4R8cbWYX1O_ebJmAHaE8?pid=Api&P=0&h=180",
//                   ),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: size.height * 0.035),
//               height: size.height * 0.115,
//               width: size.width * 0.93,

//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(size.height * 0.018),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: size.height * 0.025,
//                           left: size.width * 0.047,
//                         ),
//                         child: Text(
//                           "You are in the clock-in area!",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.020,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(
//                           top: size.height * 0.005,
//                           left: size.width * 0.05,
//                         ),
//                         child: Text(
//                           "Now you can press clock in this area",
//                           style: TextStyle(color: Colors.white70),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: size.height * 0.025),
//             Container(
//               margin: EdgeInsets.only(left: size.height * 0.02),
//               height: size.height * 0.04,
//               width: size.width * 0.99,
//               color: Colors.transparent,

//               child: Text(
//                 "MY PROFILE",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),

//             Container(
//               height: size.height * 0.11,
//               width: size.width * 0.93,

//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                   width: size.height * 0.0005,
//                 ),
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(size.height * 0.018),
//               ),
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: size.width * 0.03),
//                     height: size.height * 0.09,
//                     width: size.width * 0.195,

//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(
//                           "https://preview.redd.it/created-random-people-using-chatgpt-midjourney-do-you-know-v0-q1aa450i5dqb1.png?width=1024&format=png&auto=webp&s=c4e9abc47d193474a2fa1a7e337d9d9340dce947",
//                         ),
//                         fit: BoxFit.fill,
//                       ),
//                       color: Colors.transparent,
//                       borderRadius: BorderRadius.circular(size.height * 0.010),
//                     ),
//                   ),
//                   SizedBox(width: size.width * 0.03),
//                   Container(
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(
//                                 top: size.height * 0.015,
//                                 right: size.width * 0.28,
//                               ),

//                               child: Row(
//                                 children: [
//                                   Container(
//                                     child: Text(
//                                       "Tonald Drump",
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                       left: size.width * 0.025,
//                                     ),
//                                     child: Icon(
//                                       Icons.person,
//                                       size: size.height * 0.022,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(
//                                 top: size.height * 0.0045,
//                                 right: size.width * 0.26,
//                               ),
//                               child: Text("29 september 2024"),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: size.height * 0.0035),
//                         Row(
//                           children: [
//                             Container(
//                               child: Row(
//                                 children: [
//                                   Container(child: Icon(Icons.person)),
//                                   Container(
//                                     margin: EdgeInsets.only(
//                                       right: size.height * 0.025,
//                                     ),
//                                     child: Text(
//                                       "last 45.4334 Long 97897.576",
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: size.height * 0.018),

//             Container(
//               margin: EdgeInsets.only(left: size.height * 0.02),
//               height: size.height * 0.035,
//               width: size.width * 0.99,
//               color: Colors.transparent,

//               child: Text(
//                 "SCHEDULE",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: size.height * 0.092,
//                   width: size.width * 0.42,

//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.black,
//                       width: size.height * 0.0005,
//                     ),
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(size.height * 0.018),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         child: Text(
//                           "CLOCK IN",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.015,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Text(
//                           "09:00",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.030,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: size.height * 0.092,
//                   width: size.width * 0.42,

//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.black,
//                       width: size.height * 0.0005,
//                     ),
//                     color: Colors.transparent,
//                     borderRadius: BorderRadius.circular(size.height * 0.018),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         child: Text(
//                           "CLOCK OUT",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.015,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: Text(
//                           "05:00",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.030,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: size.height * 0.03),

//             Container(
//               height: size.height * 0.065,
//               width: size.width * 0.8,
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent,
//                 borderRadius: BorderRadius.circular(size.height * 0.05),
//               ),
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   "Clock In",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

// class AttendenceInandOutPage extends StatefulWidget {
//   const AttendenceInandOutPage({super.key});

//   @override
//   State<AttendenceInandOutPage> createState() => _AttendenceInandOutPageState();
// }

// class _AttendenceInandOutPageState extends State<AttendenceInandOutPage> {
//   Position? _location;
//   GoogleMapController? _mapController;
//   bool _loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _determineLocation();
//   }

//   Future<void> _determineLocation() async {
//     final pos = await Geolocator.getCurrentPosition();
//     setState(() {
//       _loading = false;
//       _location = pos;
//     });
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     // Replace with actual user/profile/shift details
//     const userName = "Tonald Drump";
//     final today = DateTime.now();

//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(backgroundColor: Colors.transparent),
//       body: _loading
//           ? const Center(child: CircularProgressIndicator())
//           : ListView(
//               padding: EdgeInsets.fromLTRB(0, size.height * 0.03, 0, 0),
//               children: [
//                 // Location on map
//                 SizedBox(
//                   height: size.height * 0.3,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(18),
//                     child: GoogleMap(
//                       initialCameraPosition: CameraPosition(
//                         target: _location != null
//                             ? LatLng(_location!.latitude, _location!.longitude)
//                             : LatLng(0, 0),
//                         zoom: 17,
//                       ),
//                       myLocationEnabled: true,
//                       markers: _location != null
//                           ? {
//                               Marker(
//                                 markerId: MarkerId('here'),
//                                 position: LatLng(
//                                     _location!.latitude, _location!.longitude),
//                                 infoWindow: const InfoWindow(title: "You're Here"),
//                               )
//                             }
//                           : {},
//                       onMapCreated: _onMapCreated,
//                     ),
//                   ),
//                 ),

//                 // Info area
//                 Container(
//                   height: size.height * 0.14,
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       color: Colors.blueAccent,
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.blueAccent.withOpacity(0.12),
//                             blurRadius: 8)
//                       ]),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "You are in the clock-in area!",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                             fontSize: size.height * 0.022),
//                       ),
//                       const SizedBox(height: 7),
//                       Text("Now you can press clock in this area",
//                           style: const TextStyle(color: Colors.white70)),
//                     ],
//                   ),
//                 ),

//                 // Profile summary
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5),
//                   child: Card(
//                     elevation: 2,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(13)),
//                     child: Padding(
//                       padding: const EdgeInsets.all(14.0),
//                       child: Row(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               "https://preview.redd.it/created-random-people-using-chatgpt-midjourney-do-you-know-v0-q1aa450i5dqb1.png?width=1024&format=png&auto=webp&s=c4e9abc47d193474a2fa1a7e337d9d9340dce947",
//                               height: size.height * 0.07,
//                               width: size.height * 0.07,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           SizedBox(width: 20),
//                           Expanded(
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Row(
//                                     children: [
//                                       Text(userName,
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 16)),
//                                     ],
//                                   ),
//                                   SizedBox(height: 8),
//                                   Text(
//                                     "${today.day} ${_monthName(today.month)} ${today.year}",
//                                     style: TextStyle(fontSize: 14),
//                                   ),
//                                   SizedBox(height: 6),
//                                   Row(
//                                     children: [
//                                       const Icon(Icons.location_on,
//                                           size: 16, color: Colors.blue),
//                                       SizedBox(width: 4),
//                                       Text(
//                                         "Lat ${_location?.latitude.toStringAsFixed(5) ?? "?"}, "
//                                         "Long ${_location?.longitude.toStringAsFixed(5) ?? "?"}",
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ]),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),

//                 // Schedule summary
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
//                   child: Row(
//                     children: [
//                       _ScheduleBox(label: "CLOCK IN", time: "09:00"),
//                       SizedBox(width: 18),
//                       _ScheduleBox(label: "CLOCK OUT", time: "05:00"),
//                     ],
//                   ),
//                 ),

//                 // Clock In button
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: size.width * 0.14, vertical: 14),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: size.height * 0.065,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green.shade600,
//                         shape: StadiumBorder(),
//                       ),
//                       onPressed: () {
//                         // TODO: Save Firestore attendance & navigate/feedback
//                         ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text("Clock In successful!")));
//                       },
//                       child: const Text(
//                         "Clock In",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   String _monthName(int number) {
//     return [
//       '',
//       'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
//       'September', 'October', 'November', 'December'
//     ][number];
//   }
// }

// class _ScheduleBox extends StatelessWidget {
//   final String label, time;
//   const _ScheduleBox({required this.label, required this.time});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Expanded(
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, width: 0.5),
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(size.height * 0.018)),
//         child: Column(
//           children: [
//             Text(label,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: size.height * 0.016)),
//             SizedBox(height: 7),
//             Text(time,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: size.height * 0.025)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

// class AttendenceInandOutPage extends StatefulWidget {
//   const AttendenceInandOutPage({Key? key}) : super(key: key);

//   @override
//   State<AttendenceInandOutPage> createState() => _AttendenceInandOutPageState();
// }

// class _AttendenceInandOutPageState extends State<AttendenceInandOutPage> {
//   Position? _currentPosition;
//   bool _loading = true;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   void _getCurrentLocation() async {
//     LocationPermission permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       setState(() => _loading = false);
//       return;
//     }
//     Position pos = await Geolocator.getCurrentPosition();
//     setState(() {
//       _currentPosition = pos;
//       _loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_loading) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }
//     if (_currentPosition == null) {
//       return const Scaffold(
//         body: Center(child: Text("Location permission denied.")),
//       );
//     }
//     final LatLng currentLatLng = LatLng(
//       _currentPosition!.latitude,
//       _currentPosition!.longitude,
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text("Mark Attendance")),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 270,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(14),
//                 child: FlutterMap(
//                   options: MapOptions(center: currentLatLng, zoom: 16.0),
//                   children: [
//                     TileLayer(
//                       urlTemplate:
//                           "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                       subdomains: const ["a", "b", "c"],
//                       userAgentPackageName:
//                           'com.example.velga_app', // replace with your real package
//                     ),
//                     MarkerLayer(
//                       markers: [
//                         Marker(
//                           point: currentLatLng,
//                           width: 40,
//                           height: 40,
//                           child: Icon(Icons.place, color: Colors.red, size: 40),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               "Your location: Lat ${_currentPosition!.latitude.toStringAsFixed(5)}, Lng ${_currentPosition!.longitude.toStringAsFixed(5)}",
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//             ),
//             const Spacer(),
//             ElevatedButton.icon(
//               icon: const Icon(Icons.login, color: Colors.white),
//               label: const Text("Punch In"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 14,
//                 ),
//               ),
//               onPressed: () {
//                 // TODO: Mark attendance logic, save to Firestore
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Clock-in marked!")),
//                 );
//               },
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//     );
//   }
// }
