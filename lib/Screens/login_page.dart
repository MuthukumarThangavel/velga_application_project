import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/newaccount_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                Get.to(NewAccountPage()); 
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}