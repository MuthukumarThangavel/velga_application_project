import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/login_page.dart';
import 'package:velga_application/Screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading time, then check auth and navigate.
    Timer(Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        Get.offAll(() => HomePage());
      } else {
        Get.offAll(() => LoginPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 80),
            SizedBox(height: 20),
            Text('VELGA Pvt Ltd', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
