import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/home_page.dart';
import 'package:velga_application/Screens/newaccount_page.dart';

import '../auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    try {
      await _auth.signIn(email, password);
      Get.snackbar("Success", "Logged in successfully");
      Get.to(HomePage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 255, 7),
        title: const Text('Login Page'),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(height: size.height*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height*0.02,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: size.height*0.02,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent
              ),
              onPressed: () {
                login();
                // Get.to(HomePage()); 
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}