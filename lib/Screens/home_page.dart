import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () async {
        await _auth.signOut();
        Get.to(LoginPage());
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginPage()));
      }, child: Text("Logout")),
      ),
    );
  }
}