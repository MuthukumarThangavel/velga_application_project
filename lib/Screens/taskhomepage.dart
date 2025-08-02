import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velga_application/Screens/taskassignpage.dart';


class Task1 extends StatelessWidget {
  const Task1 ({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
   extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: size.height*1,
        width: size.width*1,
        color: Colors.blueAccent,
        child: Column(
          children: [
            SizedBox(height: size.height*0.05,),
            
            Row(
              children: [


               Container(
                margin: EdgeInsets.only(left: size.height*0.35),
                height: size.height*0.08,
                width: size.width*0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: size.height*0.003)
                ),
                child: Container(
                  height: size.height*0.08,
                  width: size.width*0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.XSZAFm-5JI7nriDLwZqRQQHaE7?pid=Api&P=0&h=180"),
                      fit: BoxFit.cover)
                  ),
                ),
               )

              ],
            ),
            SizedBox(height: size.height*0.020,),
            Row(
              children: [
                Container(
                  
                  margin: EdgeInsets.only(left: size.width*0.06),
                  child: Text("Hi Bharathi",style: TextStyle(
                    color: Colors.white,
                    fontSize: size.height*0.035,
                    fontWeight: FontWeight.bold
                  ),),
                )
              ],
            ),
             SizedBox(height: size.height*0.008),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.width*0.065),

                    
                  child: Text("6 Tasks are pending",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: size.height*0.020,
                  
                  ),),
                )
              ],
            ),
            SizedBox(height: size.height*0.03,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height*0.17,
                  width: size.width*0.885,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height*0.02),
                    color: Colors.white.withOpacity(0.15),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                         height: size.height*0.17,
                  width: size.width*0.885,
                  color: Colors.transparent,
                  child: Container(

                     height: size.height*0.17,
                  width: size.width*0.885,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white,width: 0.5),
                    borderRadius: BorderRadius.circular(size.height*0.02),
                    color: Colors.white.withOpacity(0.15)
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: size.height*0.02,),
                      Container(
                        margin: EdgeInsets.only(right: size.width*0.4),
                        child: Text("Mobile App Design",
                        style: TextStyle(
                          fontSize: size.height*0.020,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),)),
                          SizedBox(height: size.height*0.003,),
                      Container(
                        margin: EdgeInsets.only(right: size.width*0.435),
                        child: Text("Muthu and Bharathi",
                        style: TextStyle(
                          fontSize: size.height*0.017,
                       
                          color: Colors.white70
                        ),)),
                        SizedBox(height: size.height*0.015,),
                        
                        Row(
                          children: [
                            Stack(
                              children: [
                                Positioned(
                                  child:Container(
                                    margin: EdgeInsets.only(left: size.height*0.02),
                                    height: size.height*0.06,
                                    width: size.height*0.07,
                                    
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white,width: size.height*0.002),
                                    image: DecorationImage(
                                      image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.W2KJjtG9La9uYbL8LD4SCgHaHa?pid=Api&P=0&h=180"),
                                      fit: BoxFit.fill)),
                                    
                                   
                                  ) ),
                                  Positioned(
                                  child:Container(
                                    margin: EdgeInsets.only(left: size.height*0.065),
                                    height: size.height*0.06,
                                    width: size.height*0.07,
                                    
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    color: Colors.white,
                                    border: Border.all(color: Colors.white,width: size.height*0.002),
                                    image: DecorationImage(
                                      image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.eoqv2dfc_NyJKlxp8CAy0QHaHa?pid=Api&P=0&h=180"),
                                      
                                      fit: BoxFit.fill)),
                                    
                                   
                                  ) ),

                                  Container(
                                    margin: EdgeInsets.only(top: size.height*0.02,left: size.height*0.32),
                                    child: Text("Now",
                                    style: TextStyle(
                                      fontSize: size.height*0.015,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold
                                    ),),
                                  )
                                
                              ],
                            )
                          ],
                        ),

                    ],
                  ),

                  ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.01,),
            Row(

              children: [
                Container(
                margin: EdgeInsets.only(left: size.height*0.036),
                child: Text("Monthly Review",
                style: TextStyle(
                  fontSize: size.height*0.020,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),),
              ),
              SizedBox(width: size.height*0.17,),
              InkWell(
                onTap: (){
                  Get.to(Task2());
                  
                },
                child: Container(
                  
                  height: size.height*0.090,
                  width: size.width*0.090,
                  
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyan,
                
                  ),
                  margin: EdgeInsets.only(left: size.height*0.020,top: size.height*0.001),
                  child: Container(
                    child: Icon(Icons.calendar_month,
                    color: Colors.white,),
                  ),
                ),
              )
              ],
              
            ),
            SizedBox(height: size.height*0.035,),

            Container(
              height: size.height*0.4276,
              width: size.width*1.0,
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    child:Container(
                      margin: EdgeInsets.only(left: size.height*0.034),
                      height: size.height*0.17,
                      width: size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001),

                        
                       
                         
                      ),
                      child: Stack(
                        children: [
                          Container(
                                                
                                               height: size.height*0.17,
                      width: size.width*0.39,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(size.height*0.03),
                                                  border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001),
                                                 
                                                  
                                                ),
                                                
                                                child: Column(
                                                  
                                                  
                                                  children: [
                          SizedBox(height: size.height*0.04,),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          
                              Container(
                                
                                
                                
                        
                            child: Container(
                              margin: EdgeInsets.only(right: size.height*0.001),
                              child: Text("22",
                              style: TextStyle(
                                fontSize: size.height*0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          ),
                          
                          Row(
                            children: [
                          
                              Container(
                          
                          
                            child: Container(
                              margin: EdgeInsets.only(left: size.width*0.15),
                              child: Text("Done",
                              style: TextStyle(
                                fontSize: size.height*0.015,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          )
                                                  ],
                                                ),)
                          
                          
                        ],
                    
                      ),
                    
                    ) ),
                    Positioned(
                    child:Container(
                      margin: EdgeInsets.only(left: size.width*0.52),
                      height: size.height*0.13,
                      width:   size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),
                      child: Stack(
                        children: [
                          Container(
                      
                        height: size.height*0.13,
                      width:   size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),
                      child: Column(
                        
                        
                        children: [
                          SizedBox(height:  size.height*0.02,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(

                          margin: EdgeInsets.only(right: size.height*0.05),
                            child: Container(
                              margin: EdgeInsets.only(left: size.height*0.05),
                              child: Text("7",
                              style: TextStyle(
                                fontSize:size.height*0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          ),
                          
                          Row(
                            children: [

                              Container(

                          
                            child: Container(
                              margin: EdgeInsets.only(left:  size.width*0.11),
                              child: Text("In Process",
                              style: TextStyle(
                                fontSize: size.height*0.015,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          )
                        ],
                      ),
                      
                            
                            )
                          
                          
                        ],

                      ),

                    ) ),

                    Positioned(
                    child:Container(
                      margin: EdgeInsets.only(top: size.height*0.205,left: size.height*0.034),
                     
                      height: size.height*0.13,
                      width:   size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),
                      child: Stack(
                        children: [
                          Container(
                      
                        height: size.height*0.13,
                      width:   size.width*0.39,                     
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),child: Column(
                        
                        
                        children: [
                          SizedBox(height: size.height*0.02,),

                          Row(

                            children: [

                              Container(

                          
                            child: Container(
                              margin: EdgeInsets.only(left: size.height*0.06),
                              child: Text("10",
                              style: TextStyle(
                                fontSize: size.height*0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          ),
                          
                          Row(

                            children: [

                              Container(

                          
                            child: Container(
                              
                              child: Container(
                                margin: EdgeInsets.only(left: size.height*0.06),
                                child: Text("Ongoing",
                                style: TextStyle(
                                  fontSize: size.height*0.015,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),),
                              ),
                            ),
                          ),
                            ],
                          )
                        ],
                      ),
                      )
                          
                          
                        ],

                      ),

                    ) ),
                    Positioned(
                    child:Container(
                      margin: EdgeInsets.only(left: size.width*0.52 ,top: size.height*0.166),
                      height: size.height*0.17,
                      width: size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),
                      child: Stack(
                        children: [
                          Container(
                      
                       height: size.height*0.17,
                      width: size.width*0.39,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(size.height*0.03),
                        border: Border.all(color: Colors.white.withOpacity(0.15),width: size.height*0.0001)
                      ),
                      child: Column(
                        
                        
                        children: [
                          SizedBox(height:  size.height*0.035,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Container(

                          margin: EdgeInsets.only(right: size.height*0.009),
                            child: Container(
                              
                              child: Text("12",
                              style: TextStyle(
                                fontSize: size.height*0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          ),
                          
                          Row(
                            children: [

                              Container(

                          
                            child: Container(
                              margin: EdgeInsets.only(left: size.height*0.03),
                              child: Text("Wait for Review",
                              style: TextStyle(
                                fontSize: size.height*0.015,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),),
                            ),
                          ),
                            ],
                          )
                        ],
                      ),)
                      
                          
                          
                        ],

                      ),

                    ) )
                ],
              ),
            )
          ],
        ),
      )

    );
  }
}