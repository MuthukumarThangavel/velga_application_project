import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAccountPage extends StatelessWidget {
  const NewAccountPage({super.key});

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
                Get.to(NewAccountPage()); 
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}