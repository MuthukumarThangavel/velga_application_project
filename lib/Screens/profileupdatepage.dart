import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class Updatepage extends StatefulWidget {

   Updatepage({super.key});

  @override
  State<Updatepage> createState() => _UpdatepageState();
}

class _UpdatepageState extends State<Updatepage> {
  TextEditingController nameController =TextEditingController();

    TextEditingController numberController =TextEditingController();

        TextEditingController emailController =TextEditingController();

    @override
void initState() {
  super.initState();
  _loadUserData();
} 

    Future<void>_loadUserData()async{
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        nameController.text = prefs.getString('username') ?? '';
        numberController.text =prefs.getString('number') ?? '';
        emailController.text =prefs.getString('email') ?? '';
      });
    }

  Future<void> _saveUserData() async {
  final prefs = await SharedPreferences.getInstance();

  // Old values
  final oldName = prefs.getString('username') ?? '';
  final oldNumber = prefs.getString('number') ?? '';
  final oldEmail = prefs.getString('email') ?? '';

  // New values
  final newName = nameController.text.trim();
  final newNumber = numberController.text.trim();
  final newEmail = emailController.text.trim();

  // Check if any change happened
  if (oldName == newName &&
      oldNumber == newNumber &&
      oldEmail == newEmail) {
    // No change → no snackbar
    return;
  }

  // ✅ Save only if data changed
  await prefs.setString('username', newName);  // Correct key
  await prefs.setString('number', newNumber);
  await prefs.setString('email', newEmail);

  // Show snackbar only when updated
  Get.snackbar('Update', 'Successfully updated');
}

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
      appBar: AppBar(

        title: Text('Update your profile',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 900,
        decoration: BoxDecoration(
            color: Colors.blueGrey
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 130,),
                Center(
              child: Card(
                child: Container(
                  height: 500,
                  width: 350,
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Container(
                        width: 280,
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                        Container(
                        width: 280,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: numberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.call)
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                        Container(
                        width: 280,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email)
                          ),
                        ),
                      ),
                      SizedBox(height: 80,),
            
                    InkWell(
                          onTap: ()async{
                            await _saveUserData();
                            setState(() {
                              // Get.snackbar('Update', 'Succesfully');
                               
                            });
                            
                          },
                          child: Card(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)
                            ),
                            elevation: 4,
                            child: Container(
                              height: 50,
                              width: 230, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: Icon(Icons.upgrade,color: Colors.white,),
                                  ),
                                  // SizedBox(width: 5,),
                                  Container(
                                    child: Text('UPDATE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                    ),),
                                  )
                                ],
                              ),
                              
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            ],
          
          ),
        ),
      )
    );
  }
}