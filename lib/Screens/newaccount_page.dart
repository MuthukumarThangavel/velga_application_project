import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/login_page.dart';

import '../auth.dart';

class NewAccountPage extends StatelessWidget {
  NewAccountPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService();

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    try {
      await _auth.signUp(email, password);
      Get.snackbar("Success", "Account created successfully");
      Get.to(LoginPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  } 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Create New Account"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: size.height*0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
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
                createAccount();
                // Get.to(NewAccountPage()); 
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}