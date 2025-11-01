import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'navigation.dart'; // make sure this file exists

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool textVisible = true;
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ✅ LOGIN FUNCTION (auto-creates Firestore doc if missing)
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password required");
      return;
    }

    try {
      setState(() => loading = true);

      UserCredential userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCred.user!.uid;

      // Fetch user data from Firestore
      DocumentSnapshot userData =
          await _firestore.collection('users').doc(uid).get();

      if (userData.exists) {
        String name = userData['name'] ?? '';
        Get.snackbar("Success", "Welcome back $name!");
      } else {
        // Automatically create Firestore record if missing
        await _firestore.collection('users').doc(uid).set({
          'uid': uid,
          'email': email,
          'name': email.split('@')[0],
          'profilePic': '',
          'bio': '',
          'role': 'user',
          'createdAt': FieldValue.serverTimestamp(),
        });
        Get.snackbar("Profile Created", "Your account data has been initialized!");
      }

      // ✅ Navigate to main page with UID
      Get.offAll(() => Navigationpage(uid: uid));
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
      print("🔥 Firebase Login Error: $e");
    } finally {
      setState(() => loading = false);
    }
  }

  // ✅ SIGN UP FUNCTION
  Future<void> signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password required");
      return;
    }

    try {
      setState(() => loading = true);

      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCred.user!.uid;

      // Create Firestore user document
      await _firestore.collection('users').doc(uid).set({
        'uid': uid,
        'email': email,
        'name': email.split('@')[0],
        'profilePic': '',
        'bio': '',
        'role': 'user',
        'createdAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar("Success", "Account created successfully!");
      Get.offAll(() => Navigationpage(uid: uid));
    } catch (e) {
      Get.snackbar("Signup Error", e.toString());
      print("🔥 Firebase Signup Error: $e");
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.08),
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
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: size.height * 0.03, left: size.height * 0.025),
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

                  // Email Field
                  Container(
                    width: size.width * 0.93,
                    height: size.height * 0.08,
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        hintText: "Enter your email",
                        suffixIcon: Icon(Icons.email),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  // Password Field
                  Container(
                    width: size.width * 0.93,
                    height: size.height * 0.09,
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() => textVisible = !textVisible);
                          },
                          icon: textVisible
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: textVisible,
                      maxLength: 10,
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  // ✅ LOGIN BUTTON
                  Container(
                    width: size.width * 0.80,
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : TextButton(
                            onPressed: login,
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ),
                  ),

                  SizedBox(height: 20),

                  // ✅ SIGNUP BUTTON
                  TextButton(
                    onPressed: signUp,
                    child: const Text(
                      "Create a new account",
                      style: TextStyle(color: Colors.blueAccent),
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
