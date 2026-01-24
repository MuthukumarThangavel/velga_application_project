import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'profilepage.dart'; // Change path according to your project

class Submitpage extends StatefulWidget {
  const Submitpage({super.key});

  @override
  State<Submitpage> createState() => _SubmitpageState();
}

class _SubmitpageState extends State<Submitpage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // ✅ Load existing data if available
  Future<void> _loadUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot doc = await _firestore.collection('users').doc(user.uid).get();
      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        nameController.text = data['name'] ?? '';
        numberController.text = data['number'] ?? '';
      }
    }
    setState(() => loading = false);
  }

  // ✅ Submit name + number and navigate
  Future<void> submitData() async {
    String name = nameController.text.trim();
    String number = numberController.text.trim();

    if (name.isEmpty || number.isEmpty) {
      Get.snackbar("Error", "Please enter name and number");
      return;
    }

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        String uid = user.uid;

        // Update existing user document
        await _firestore.collection('users').doc(uid).update({
          'name': name,
          'number': number,
        });

        Get.snackbar("Success", "Data submitted successfully!");

        // ✅ Navigate to ProfilePage
        Get.off(() => Profilepage(uid: uid,));
      } else {
        Get.snackbar("Error", "User not logged in");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Page'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: numberController,
              decoration: const InputDecoration(hintText: 'Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: submitData,
              child: Card(
                elevation: 4,
                color: Colors.green,
                child: Container(
                  height: 50,
                  width: 230,
                  alignment: Alignment.center,
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
