import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/dashboard.dart';
import 'package:velga_application/Screens/home_page.dart';
import 'package:velga_application/Screens/newaccount_page.dart';

import '../auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try {
      await _auth.signIn(email, password);
      Get.snackbar("Success", "Logged in successfully");
      Get.off(DashboardPage());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  bool textVisible = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.height * 0.025),
                  height: size.height * 0.08,
                  child: Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: size.height * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.green, offset: Offset(1, 1)),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: size.height * 0.20),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.00),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    bottom: size.height * 0.03,
                    left: size.height * 0.025,
                  ),
                  child: Text(
                    "Sign in!",
                    style: TextStyle(
                      fontSize: size.height * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(color: Colors.green, offset: Offset(1, 1)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),

            Container(
              height: size.height * 0.7,
              width: size.width * 0.99,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.10),
                  topRight: Radius.circular(size.width * 0.10),
                ),
                color: Colors.white,
              ),

              child: Column(
                children: [
                  SizedBox(height: size.height * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: size.width * 0.93,
                          height: size.height * 0.08,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Enter your email",
                              labelStyle: TextStyle(
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                              suffixIcon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.93,
                        height: size.height * 0.09,

                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Passsword",
                            hintText: "Enter your Password",
                            labelStyle: TextStyle(
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  textVisible = !textVisible;
                                });
                              },
                              icon: textVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: textVisible,
                          maxLength: 10,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.12),
                    width: size.width * 0.80,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: TextButton(
                      onPressed: () {
                        login();
                      },
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ),
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
