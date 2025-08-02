import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:velga_application/Screens/msgrecievepage.dart';
class Msg1 extends StatelessWidget {
  const Msg1 ({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent
        ,
        title: Text("Primary",
        style: TextStyle(
          color: Colors.cyan,
          shadows: [
            Shadow(
              color: const Color.fromARGB(255, 81, 79, 79),
              offset: Offset(1, 1)
            )
          
          ]
        ),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height*0.99,
          color: Colors.white30,
          child: Column(
            children: [
              SizedBox(height: size.height*0.035,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                  InkWell(
                    onTap: (){
                      Get.to(Msg2());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.018)
                      ),
                      elevation: size.height*0.020,
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: size.height*0.0002),
                          borderRadius: BorderRadius.circular(size.height*0.018)
                        ),
                        height: size.height*0.137,
                        width: size.width*0.855,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("Muthukumar",
                                  style: TextStyle(
                                    fontSize: size.height*0.02,
                                    color: Colors.black
                                  ),),
                                ),
                                SizedBox(width: size.width*0.3,),
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("11.00 am",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.005,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Estimation for web application",
                                  style: TextStyle(
                                    fontSize: size.height*0.014,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(width: size.width*0.27,),
                                Container(
                                  child: Icon(Icons.star,
                                  size: size.height*0.019,
                                  color: Colors.grey,),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.011,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Hello everyone,can you add in your estimation for me to....",
                                  style: TextStyle(
                                    fontSize: size.height*0.012,
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                              
                           
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height*0.035,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(Msg2());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.018)
                      ),
                      elevation: size.height*0.020,
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: size.height*0.0002),
                          borderRadius: BorderRadius.circular(size.height*0.018)
                        ),
                        
                          height: size.height*0.137,
                        width: size.width*0.855,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("Bharathi",
                                  style: TextStyle(
                                    fontSize: size.height*0.02,
                                    color: Colors.black
                                  ),),
                                ),
                                SizedBox(width: size.width*0.3,),
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.058),
                                  child: Text("11.00 am",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.005,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Estimation for web application",
                                  style: TextStyle(
                                    fontSize: size.height*0.014,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(width: size.width*0.27,),
                                Container(
                                  child: Icon(Icons.star,
                                  size: size.height*0.019,
                                  color: Colors.grey,),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.011,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Hello everyone,can you add in your estimation for me to....",
                                  style: TextStyle(
                                    fontSize: size.height*0.012,
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                              
                           
                          ],
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),
               SizedBox(height: size.height*0.035,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(Msg2());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.018)
                      ),
                      elevation: size.height*0.020,
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: size.height*0.0002),
                          borderRadius: BorderRadius.circular(size.height*0.018)
                        ),
                        
                          height: size.height*0.137,
                        width: size.width*0.855,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("Mathi",
                                  style: TextStyle(
                                    fontSize: size.height*0.02,
                                    color: Colors.black
                                  ),),
                                ),
                                SizedBox(width: size.width*0.3,),
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.082),
                                  child: Text("11.00 am",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.005,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Estimation for web application",
                                  style: TextStyle(
                                    fontSize: size.height*0.014,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(width: size.width*0.27,),
                                Container(
                                  child: Icon(Icons.star,
                                  size: size.height*0.019,
                                  color: Colors.grey,),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.011,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Hello everyone,can you add in your estimation for me to....",
                                  style: TextStyle(
                                    fontSize: size.height*0.012,
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                              
                           
                          ],
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),
               SizedBox(height: size.height*0.035,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(Msg2());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.018)
                      ),
                      elevation: size.height*0.020,
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: size.height*0.0002),
                          borderRadius: BorderRadius.circular(size.height*0.018)
                        ),
                        
                          height: size.height*0.137,
                        width: size.width*0.855,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("Kaviyarasi",
                                  style: TextStyle(
                                    fontSize: size.height*0.02,
                                    color: Colors.black
                                  ),),
                                ),
                                SizedBox(width: size.width*0.3,),
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.04),
                                  child: Text("11.00 am",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.005,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Estimation for web application",
                                  style: TextStyle(
                                    fontSize: size.height*0.014,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(width: size.width*0.27,),
                                Container(
                                  child: Icon(Icons.star,
                                  size: size.height*0.019,
                                  color: Colors.grey,),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.011,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Hello everyone,can you add in your estimation for me to....",
                                  style: TextStyle(
                                    fontSize: size.height*0.012,
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                              
                           
                          ],
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),
               SizedBox(height: size.height*0.035,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(Msg2());
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.018)
                      ),
                      elevation: size.height*0.020,
                      
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey,width: size.height*0.0002),
                          borderRadius: BorderRadius.circular(size.height*0.018)
                        ),
                        
                          height: size.height*0.137,
                        width: size.width*0.855,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("Muthukumar",
                                  style: TextStyle(
                                    fontSize: size.height*0.02,
                                    color: Colors.black
                                  ),),
                                ),
                                SizedBox(width: size.width*0.3,),
                                Container(
                                  margin: EdgeInsets.only(top: size.height*0.023,left: size.height*0.018),
                                  child: Text("11.00 am",
                                  style: TextStyle(
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.005,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Estimation for web application",
                                  style: TextStyle(
                                    fontSize: size.height*0.014,
                                    color: Colors.cyan,
                                    fontWeight: FontWeight.bold
                                  ),),
                                ),
                                SizedBox(width: size.width*0.27,),
                                Container(
                                  child: Icon(Icons.star,
                                  size: size.height*0.019,
                                  color: Colors.grey,),
                                )
                              ],
                            ),
                            SizedBox(height: size.height*0.011,),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: size.height*0.018),
                                  child: Text("Hello everyone,can you add in your estimation for me to....",
                                  style: TextStyle(
                                    fontSize: size.height*0.012,
                                    color: Colors.grey
                                  ),),
                                )
                              ],
                            ),
                              
                           
                          ],
                        ),
                      ),
                    ),
                  )
                  
                ],
              ),

          
              
            ],
          ),
        ),
      ),
    );
  }
}