import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height*0.999,
          width: size.width*0.999,
          color: const Color.fromARGB(179, 216, 201, 201),
          child: SingleChildScrollView(
        
            child: Column(
             children: [
               SizedBox(height: size.height*0.06,),
               
               Row(
               children: [
                Container(
                 margin: EdgeInsets.only(left: size.height*0.37),
                     height: size.height*0.06,
                     width: size.width*0.13,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.white,
                       image: DecorationImage(
                         image: NetworkImage("https://tse4.mm.bing.net/th/id/OIP.XSZAFm-5JI7nriDLwZqRQQHaE7?pid=Api&P=0&h=180"),
                         fit: BoxFit.cover)
                     ),
                   ),
               ],
                             ),
                             SizedBox(height: size.height*0.03,),
                      
                             Row(
                               children: [
                                 Container(
                                  
                                   margin: EdgeInsets.only(left: size.height*0.035),
                      
                                   height: size.height*0.05,
                                   width: size.width*0.07,
                                   
                                   
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Icon(Icons.arrow_back,
                                     size:size.height*0.025,),
                                   ),
                      
                                 ),
                                 Container(
                                  
                                   
                      
                                  height: size.height*0.05,
                                   width: size.width*0.06,
                                   
                                   
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Text("Mar",
                                     style: TextStyle(
                                       fontSize: size.height*0.014
                                     ),),
                                   ),
                      
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(left: size.width*0.2),
                                   
                                   
                                   height: size.height*0.05,
                                   width: size.width*0.21,
                                   
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Text("April",
                                     style: TextStyle(
                                       fontSize: size.height*0.027,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black
                                     ),),
                                   ),
                      
                                 ),
                                 Container(
                                  
                                   
                                   margin: EdgeInsets.only(left: size.width*0.145,),
                                 
                                  height: size.height*0.05,
                                   width: size.width*0.07,
                                   
                                   
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Text("May",
                                     style: TextStyle(
                                       fontSize: size.height*0.014
                                     ),)),
                      
                                 ),
                                 Container(
                                   
                                   
                                  height: size.height*0.05,
                                   width: size.width*0.07,
                                   child: Container(
                                     alignment: Alignment.center,
                                     child: Icon(Icons.arrow_forward,
                                     size:size.height*0.025,),
                                   ),
                      
                                 )
                               ],
                             ),
                             SizedBox(height: size.height*0.03,),
                             SingleChildScrollView(
                               scrollDirection: Axis.horizontal,
                               child: Row(
                                 children: [
                                  Container(
                                   margin: EdgeInsets.only(left: size.height*0.02),
                                   
                                   
                                   height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                     
                                   
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                    Container(
                                   
                                   
                                    height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                    
                                    height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                   
                                     
                                    height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                   
                                   height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                   
                                   height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                   
                                  height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   Container(
                                   
                                   
                                    
                                  height: size.height*0.118,
                                   width: size.width*0.182,
                                   
                                   
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(size.height*0.05),
                                   color: Colors.white,),
                                   child: Column(
                                     children: [
                                       Row(
                                         children: [
                                           Container(
                                             margin: EdgeInsets.only(top: size.height*0.025,left: size.height*0.023),
                                             child: Text("12",style: TextStyle(
                                               fontSize: size.height*0.025,
                                               fontWeight: FontWeight.bold
                                             ),),
                                           )
                                         ],
                                       ),
                                       Row(
                                         children: [
                                           Container(
                                           margin: EdgeInsets.only(left:size.height*0.023),
                                             child: Text("Wed"),
                                           )
                                         ],
                                       )
                                     ],
                                   ),
                                  ),SizedBox(width: size.width*0.04,),
                                   
                                   
                      
                                 ],
                               ),
                             ),
                             SizedBox(
                               height: size.height*0.04,
                             ),
                      
                             Row(
                               children: [
                                 Container(
                                   child: Container(
                                     margin: EdgeInsets.only(left: size.height*0.03),
                                     
                                     child: Text("Ongoing",
                                     style: TextStyle(
                                       fontSize: size.height*0.032,
                                       fontWeight: FontWeight.bold,
                                     ),),
                                   ),
                                 )
                               ],
                             ),
                             SizedBox(height: size.height*0.03,),

                             Container(
                               height: size.height*0.555,
                               width: size.width*0.999,
                               
                               child: Stack(
                                 clipBehavior: Clip.none,
                                 children: [
                                   Positioned(
                                     
                                     child:Container(
                                     margin: EdgeInsets.only(left: size.height*0.125),
                                       height: size.height*0.142,
                                       width: size.width*0.67,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(size.height*0.025),
                                         color: Colors.blueAccent,
                                       ),
                                       child: Column(
                                               
                                         children: [
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.02,top: size.height*0.018),
                                                 child: Text("Mobile App Design",
                                                 style: TextStyle(
                                                   fontSize: size.height*0.020,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold
                                                 ),),
                                               )
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.021),
                                                 child: Text("Muthu and Bharathi",
                                                 style: TextStyle(
                                                   color: Colors.white70,
                                                   fontSize: size.height*0.015
                                                 ),),
                                               )
                                             ],
                                           ),
                                           SizedBox(height: size.height*0.012,),
                                           Row(
                                             children: [
                                               Stack(
                                                 children: [
                                                    Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.020),
                                                   height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     
                                                     border: Border.all(color: Colors.white,width: size.height*0.002),
                                                     image: DecorationImage(
                                                       image: NetworkImage("https://up.yimg.com/ib/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?pid=Api&rs=1&c=1&qlt=95&w=73&h=110"),
                                                       fit: BoxFit.fill)
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.055),
                                                  height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                     
                                                     border: Border.all(color: Colors.white,width:  size.height*0.002),
                                                     image: DecorationImage(
                                                       image:NetworkImage("https://up.yimg.com/ib/th/id/OIP.6Mv8PthsHE8jcCUDJOczBQHaE8?pid=Api&rs=1&c=1&qlt=95&w=166&h=111"),
                                                       fit: BoxFit.fill ),
                                                       
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                   child: Container(
                                                     margin: EdgeInsets.only(left: size.height*0.18,top: size.height*0.012),
                                                     child: Text("9 Am - 10 Am",style: TextStyle(
                                                       color: Colors.white70,
                                                       fontSize: size.height*0.014
                                               
                                                     ),),
                                                   )),
                                               
                                                   
                                                 ],
                                               )
                                              
                                             ],
                                           )
                                         ],
                                       ),
                                     ) ),
                                     Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.02,left: size.height*0.038),
                                         child: Text("9 AM"),
                                       ) ),
                                       Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.10,left: size.height*0.038),
                                         child: Text("10 AM"),
                                       ) ),
                                               
                                       Positioned(
                                     
                                     child:Container(
                                     margin: EdgeInsets.only(left: size.height*0.125,top: size.height*0.175),
                                        height: size.height*0.142,
                                       width: size.width*0.67,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(size.height*0.025),
                                         color: Colors.blueAccent,
                                       ),
                                       child: Column(
                                               
                                         children: [
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.02,top: size.height*0.02),
                                                 child: Text("Mobile App Design",
                                                 style: TextStyle(
                                                   fontSize: size.height*0.020,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold
                                                 ),),
                                               )
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.021),
                                                 child: Text("Muthu and Bharathi",
                                                 style: TextStyle(
                                                   color: Colors.white70,
                                                   fontSize: size.height*0.015
                                                 ),),
                                               )
                                             ],
                                           ),
                                           SizedBox(height: size.height*0.012,),
                                           Row(
                                             children: [
                                               Stack(
                                                 children: [
                                                    Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.020),
                                                   height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                   
                                                     border: Border.all(color: Colors.white,width: size.height*0.002),
                                                     image: DecorationImage(
                                                       image: NetworkImage("https://up.yimg.com/ib/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?pid=Api&rs=1&c=1&qlt=95&w=73&h=110"),
                                                       fit: BoxFit.fill)
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.055),
                                                  height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                   
                                                     border: Border.all(color: Colors.white,width: size.height*0.002),
                                                     image: DecorationImage(
                                                       image:NetworkImage("https://up.yimg.com/ib/th/id/OIP.6Mv8PthsHE8jcCUDJOczBQHaE8?pid=Api&rs=1&c=1&qlt=95&w=166&h=111"),
                                                       fit: BoxFit.fill )
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                   child: Container(
                                                     margin: EdgeInsets.only(left: size.height*0.18,top: size.height*0.012),
                                                     child: Text("9 Am - 10 Am",style: TextStyle(
                                                       color: Colors.white70,
                                                       fontSize: size.height*0.014

                                               
                                                     ),),
                                                   )),
                                               
                                                   
                                                 ],
                                               )
                                              
                                             ],
                                           )
                                         ],
                                       ),
                                     ) ),
                                     Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.195,left: size.height*0.038),
                                         child: Text("9 AM"),
                                       ) ),
                                       Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.28,left: size.height*0.038),
                                         child: Text("10 AM"),
                                       ) ),
                                       Positioned(
                                     
                                     child:Container(
                                     margin: EdgeInsets.only(left: size.height*0.125,top: size.height*0.355),
                                         height: size.height*0.142,
                                       width: size.width*0.67,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(size.height*0.025),
                                         color: Colors.blueAccent,
                                       ),
                                       child: Column(
                                               
                                         children: [
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.02,top: size.height*0.02),
                                                 child: Text("Mobile App Design",
                                                 style: TextStyle(
                                                   fontSize: size.height*0.020,
                                                   color: Colors.white,
                                                   fontWeight: FontWeight.bold
                                                 ),),
                                               )
                                             ],
                                           ),
                                           Row(
                                             children: [
                                               Container(
                                                 margin: EdgeInsets.only(left: size.height*0.021),
                                                 child: Text("Muthu and Bharathi",
                                                 style: TextStyle(
                                                   color: Colors.white70,
                                                   fontSize: size.height*0.015
                                                 ),),
                                               )
                                             ],
                                           ),
                                           SizedBox(height: size.height*0.012,),
                                           Row(
                                             children: [
                                               Stack(
                                                 children: [
                                                    Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.020),
                                                    height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                   
                                                     border: Border.all(color: Colors.white,width: size.height*0.002),
                                                     image: DecorationImage(
                                                       image: NetworkImage("https://up.yimg.com/ib/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgHaLH?pid=Api&rs=1&c=1&qlt=95&w=73&h=110"),
                                                       fit: BoxFit.fill)
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                 child:Container(
                                                   margin: EdgeInsets.only(left: size.height*0.055),
                                                   height: size.height*0.045,
                                                   width: size.width*0.09,
                                                   
                                                   decoration: BoxDecoration(
                                                     shape: BoxShape.circle,
                                                   
                                                     border: Border.all(color: Colors.white,width: size.height*0.002),
                                                     image: DecorationImage(
                                                       image:NetworkImage("https://up.yimg.com/ib/th/id/OIP.6Mv8PthsHE8jcCUDJOczBQHaE8?pid=Api&rs=1&c=1&qlt=95&w=166&h=111"),
                                                       fit: BoxFit.fill )
                                               
                                                   ),
                                                 ) ),
                                                 Positioned(
                                                   child: Container(
                                                     margin: EdgeInsets.only(left: size.height*0.18,top: size.height*0.012),
                                                     child: Text("9 Am - 10 Am",style: TextStyle(
                                                       color: Colors.white70,
                                                       fontSize: size.height*0.014
                                               
                                                     ),),
                                                   )),
                                               
                                                   
                                                 ],
                                               )
                                              
                                             ],
                                           )
                                         ],
                                       ),
                                     ) ),
                                     Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.375,left: size.height*0.038),
                                         child: Text("9 AM"),
                                       ) ),
                                       Positioned(
                                       child:Container(
                                         margin: EdgeInsets.only(top: size.height*0.456,left: size.height*0.038),
                                         child: Text("10 AM"),
                                       ) )
                                 ],
                               ),
                             )
                            
             ],
                      ),
          ),
        ),
      ),

    );
  }
}