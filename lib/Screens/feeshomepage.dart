import 'package:flutter/material.dart';
class Fees extends StatelessWidget {
  const Fees({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: Container(
        color: Colors.white60,
        child: Column(
          children: [
            SizedBox(height: size.height*0.06,),
            Row(

              children: [
                Container(
                  margin: EdgeInsets.only(right:size.height*0.015 ),
                  height: size.height*0.04,
                  width: size.width*0.45,
                  
                  
                  
                  child: Container(
                    margin: EdgeInsets.only(top: size.height*0.002,left: size.height*0.034),
                    child: Text("FedBook",
                    style: TextStyle(
                      fontSize: size.height*0.027,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 5, 51, 132)
                      
                    ),),
                  ),
                ),
                SizedBox(width: size.width*0.34,),
                Container(
                  height: size.height*0.045,
                  width: size.width*0.1,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://imgv3.fotor.com/images/gallery/a-man-profile-picture-with-blue-and-green-background-made-by-LinkedIn-Profile-Picture-Maker.jpg"),
                    ),shape: BoxShape.circle
                  ),
                  
                )
              ],
            ),
            SizedBox(height: size.height*0.02,),
            Row(
              
              children: [
                Container(
                  
                  height: size.height*0.025,
                  width: size.width*0.3,
                  
                  child: Container(
                    margin: EdgeInsets.only(left: size.height*0.034),
                    child: Text("DELITE",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 5, 51, 132)
                    ),),
                  ),
                ),
                SizedBox(width: size.width*0.135,),
                 Container(
                   height: size.height*0.025,
                  width: size.width*0.5,
                  
                  
                  
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      margin: EdgeInsets.only(left: size.height*0.08),
                     child: Text("View All Accounts",
                     style: TextStyle(
                      fontSize: size.height*0.017,
                      color: Colors.blueAccent
                     ),),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.018,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: size.height*0.009,
                  child: Container(
                    height: size.height*0.15,
                    width: size.width*0.92,
                    child: Column(
                      children: [
                        SizedBox(height: size.height*0.005,),
                        Row(
                          children: [
                            Container(
                              height: size.height*0.0355,
                              width: size.width*0.42,
                              
                              child: Container(
                                margin: EdgeInsets.only(left: size.height*0.036,top: size.height*0.005),
                                child: Text("Available Balance",
                                style: TextStyle(
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w300
                                ),),
                              ),
                            ),
                             Container(
                              height: size.height*0.0355,
                              width: size.width*0.45,
                              
                              child: Container(
                                margin: EdgeInsets.only(left: size.height*0.082,top: size.height*0.005),
                                child: Text("View Details",
                                style: TextStyle(
                                  fontSize: size.height*0.018,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.blueAccent
                                ),),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: size.height*0.012,),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size.height*0.025),
                              height: size.height*0.045,
                              width: size.width*0.11,
                              decoration: BoxDecoration(
                               image: DecorationImage(
                                image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                fit: BoxFit.fill), 
                                shape: BoxShape.circle,
                               
                              ),
                            ),
                            SizedBox(width: size.width*0.008,),
                            Container(
                              alignment: Alignment.center,
                              height: size.height*0.04,
                              width: size.width*0.025,
                            
                              
                              child: Container(
                                child: Text("+ "),
                              ),
                            ),
                             Container(
                              alignment: Alignment.center,
                              height: size.height*0.04,
                              width: size.width*0.21,
                            
                              
                              
                              child: Container(
                                child: Text("29,659.24 ",
                                style: TextStyle(
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                            SizedBox(width: size.width*0.05,),
                             Container(
                              alignment: Alignment.center,
                              height: size.height*0.04,
                              width: size.width*0.42,
                            
                              
                              child: Container(
                                child: Text("1787XXXXXX4876",
                                style: TextStyle(
                                  fontSize: size.height*0.02,
                                  fontWeight: FontWeight.bold
                                ),),
                              ),
                            )
                          ],
                        ),
                        
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: size.height*0.08),
                              height: size.height*0.03,
                              width: size.width*0.25,
                              
                              
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("Last Update at :",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 145, 142, 142),
                                  fontSize: size.height*0.012
                                ),),
                              ),
                            ),
                            Container(
                              
                              height: size.height*0.03,
                              width: size.width*0.45,
                              
                              child: Container(
                                margin: EdgeInsets.only(top: size.height*0.007),
                              
                                child: Text("July 22,2025 | 10.46 AM IST",
                                style: TextStyle(
                                  fontSize: size.height*0.012,
                                  fontWeight: FontWeight.w400
                                ),),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height*0.025,),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.height*0.022),
                  height: size.height*0.03,
                  width: size.width*0.45,
                  
                  child: Container(
                    child: Text("Mini Statement",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height*0.02,
                      color: const Color.fromARGB(255, 5, 51, 132)
                    ),),
                  ),
                ),
                Container(
                 height: size.height*0.03,
                  width: size.width*0.45,
                  
                  child: Container(

                    margin: EdgeInsets.only(left: size.height*0.045,top: size.height*0.002),
                    child: Text("View Full Statement",
                    style: TextStyle(
                      fontSize: size.height*0.016,
                      color: Colors.blueAccent

                    ),),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.02,),
           Row(
                          children: [

                            Expanded(child: Divider()),
                           
                            Container(
                              
                              height: size.height*0.03,
                              width: size.width*0.2,
                              
                              
                              
                              child: Container(
                                margin: EdgeInsets.only(top: size.height*0.006),
                                
                                child: Text("Last Update at :",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 145, 142, 142),
                                  fontSize: size.height*0.012
                                ),),
                              ),
                            ),
                            Container(
                               height: size.height*0.03,
                                width: size.width*0.35,
                                
                              
                              
                              child: Container(
                                alignment: Alignment.center,
                                child: Text("July 22,2025 | 10.46 AM IST",
                                style: TextStyle(
                                  fontSize: size.height*0.012,
                                  fontWeight: FontWeight.w400
                                ),),
                              ),
                              
                            ),
                            SizedBox(width: size.width*0.01,),
                              Expanded(child: Divider()),
                          ],
                        ),
                        SizedBox(height: size.height*0.025,),
                        Container(
                          height: size.height*0.5,
                          width: size.width*1.0,
                          
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                
                                Container(
                                  height: size.height*0.04,
                                  width: size.width*1.0,
                                  color: const Color.fromARGB(255, 216, 216, 216),
                                  child: Container(
                                    margin: EdgeInsets.only(top: size.height*0.005,left: size.height*0.013),
                                    child: Text("Tuesday,22 jul 2025",
                                    style: TextStyle(
                                      fontSize: size.height*0.018
                                    ),),
                                  ),
                                ),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),

                                Container(
                                  height: size.height*0.04,
                                  width: size.width*1.0,
                                  color: const Color.fromARGB(255, 216, 216, 216),
                                  child: Container(
                                    margin: EdgeInsets.only(top: size.height*0.005,left: size.height*0.013),
                                    child: Text("Tuesday,22 jul 2025",
                                    style: TextStyle(
                                      fontSize: size.height*0.018
                                    ),),
                                  ),
                                ),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),Divider(height: 1,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                Container(
                                  height: size.height*0.085,
                                  width: size.width*1.0,
                                  color: Colors.white,
                                  child: Row(
                                    children: [
                                      
                                      Container(
                                        margin: EdgeInsets.only(left: size.height*0.025,top: size.height*0.005),
                                        height: size.height*0.05,
                                        width: size.width*0.1,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9RnIxF1ebTMlPudmmB_HN-j2q7-sJFPYbPg&s"),
                                            fit: BoxFit.fill),
                                            shape: BoxShape.circle,
                                        ),
                                      ),
                                      Container(
                                        height: size.height*0.08, 
                                        width: size.width*0.52,
                                        
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            
                                            Container(
                                              margin: EdgeInsets.only(right: size.height*0.028),
                                              child: Text("UPI IN/520367199523",
                                              style: TextStyle(
                                                fontSize: size.height*0.017,
                                                fontWeight: FontWeight.w400
                                              ),),
                                            ),
                                            Container(
                                              child: Text("/syamalasatheesan002@o"),
                                            )
                                          ],
                                        ),
                                        
                                        
                                      ),
                                      Container(
                                        height: size.height*0.04,
                                        width: size.width*0.3,
                                        
                                        
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: Text("+18,000",style: TextStyle(
                                            fontSize: size.height*0.024,
                                            fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                      )
                                    ],
                                  ),
                                  
                                ),
                                Divider(height: size.height*0.001,),
                                
                                                    
                                
                               
                              ],
                            ),
                          ),
                        )
          ],
        ),
      ),
    );
  }
}