import 'package:flutter/material.dart';
class Dashboard3 extends StatelessWidget {
  const Dashboard3({super.key});

  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height*0.075,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.height*0.035),
                  child: Text(
          'Jay\nMajors',
          style: TextStyle(
            fontSize: size.height*0.03,
            fontWeight: FontWeight.bold,
            height: size.height*0.0015,
          ),
        ),
                ),
                SizedBox(width: size.width*0.50,),
                Container(
                  child: Container(
                    height: size.height*0.06,
                    width: size.width*0.14,
                    
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: size.height*0.04,),

            Card(
        color: Colors.blueGrey,     
      elevation: size.height*0.005, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size.height*0.02)),
      child:Container(
        height: size.height*0.235,
        width: size.width*0.93,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
              margin: EdgeInsets.only(right: size.height*0.21,top: size.height*0.025),
               child: Text(
                "Today's schedule",
                style: TextStyle(fontSize: size.height*0.02, color: Colors.white),
                           ),
             ),
             SizedBox(height: size.height*0.02),
            Row(
              
              children: [
                Container(
                  margin: EdgeInsets.only(left: size.height*0.03),
                  child: Text(
                    '13',
                    style: TextStyle(
                      fontSize: size.height*0.055,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: size.width*0.5,),
                Column(
                  children: [
                   Text(
                      '78%',
                      style: TextStyle(
                        fontSize: size.height*0.02,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                     SizedBox(height: size.height*0.01),
                    // Vertical progress bar placeholder
                    Container(
                      width: size.width*0.023,
                      height: size.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.height*0.02),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50 * 0.78, // 78% of the height
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(size.height*0.02),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
             SizedBox(height:size.height*0.01 ),
             Container(
               margin: EdgeInsets.only(right: size.height*0.23,),
               child: Text(
                'appointments',
                style: TextStyle(fontSize: size.height*0.02, color: Colors.white),
                           ),
             ),
          ],
        ),
      ),
    ),
    SizedBox(height: size.height*0.025,),
    Row(
      children: [
        Card(
          elevation: size.height*0.005,
          color: Colors.blueGrey,
          margin: EdgeInsets.only(left: size.height*0.018),
    child: Container(
      height: size.height*0.2,
      width: size.width*0.43,
      child: Column(
        children: [
          SizedBox(height: size.height*0.03,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.05),
          child: Text("Retention",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.02
          ),),
        ),
        SizedBox(height: size.height*0.005,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.0525),
          child: Text("past 90 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.014
          ),),
        ),
        SizedBox(height: size.height*0.015,),
         Container(
          margin: EdgeInsets.only(right: size.height*0.062),
          child: Text("13%",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.04,
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: size.height*0.01,),
        Container(
          margin: EdgeInsets.only(left: size.height*0.01),
          height: size.height*0.008,
          width: size.width*0.31,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height*0.02)
          ),
          child: Container(
             height: size.height*0.008,
             width: size.width*0.1,
             child: Row(
              children: [
                Container(
                 height: size.height*0.008,
                 width: size.width*0.1,
                 decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size.height*0.02)
                 ),
                )
              ],
             ),
          ),
        )
        ],
      ),
    ),
   ),
   SizedBox(width: size.width*0.05,),
   Card(
    elevation: size.height*0.005,
          color: Colors.blueGrey,
    child: Container(
      height: size.height*0.2,
      width: size.width*0.43,
      child: Column(
        children: [
          SizedBox(height: size.height*0.03,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.025),
          child: Text("Productivity",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.02
          ),),
        ),
        SizedBox(height: size.height*0.005,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.05),
          child: Text("past 90 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.014
          ),),
        ),
        SizedBox(height: size.height*0.015,),
         Container(
          margin: EdgeInsets.only(right: size.height*0.062),
          child: Text("45%",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.04,
            fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: size.height*0.01,),
        Container(
          margin: EdgeInsets.only(left: size.height*0.01),
          height: size.height*0.008,
          width: size.width*0.31,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size.height*0.02)
          ),
          child: Container(
             height: size.height*0.008,
             width: size.width*0.1,
             child: Row(
              children: [
                Container(
                 height: size.height*0.008,
                 width: size.width*0.2,
                 decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(size.height*0.02)
                 ),
                )
              ],
             ),
          ),
        )  
        ],
      ),
    ),
   ),
      ],
    ),
    SizedBox(height: size.height*0.02,),
    Card(
      elevation: size.height*0.005,
      color: Colors.blueGrey,
      child: Container(
          height: size.height*0.14,
        width: size.width*0.9,
        child: Row(
          children: [
            Container(
              // color: Colors.red,
          height: size.height*0.14,
          width: size.width*0.5,
          child: Column(
            children: [
                SizedBox(height: size.height*0.02,),
               Container(
          margin: EdgeInsets.only(right: size.height*0.06),
          child: Text("New Client",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.02
          ),),
        ),
        SizedBox(height: size.height*0.005,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.072),
          child: Text("past 90 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.014
          ),),
        ),
          SizedBox(height: size.height*0.02,),
          Row(
            children: [
            Container(
              margin: EdgeInsets.only(left: size.width*0.075),
              height: size.height*0.013,
              width: size.width*0.03,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(size.height*0.003)
              ),
                              ),
                SizedBox(width: size.width*0.015,),
                Container(
                  child: Text('SQUIRE',
                  style: TextStyle(
                    fontSize: size.height*0.012,
                    color: Colors.white
                  ),),
                ),
                 Container(
              margin: EdgeInsets.only(left: size.width*0.03),
              height: size.height*0.013,
              width: size.width*0.03,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(size.height*0.003)
              ),
                              ),
                SizedBox(width: size.width*0.01,),
                Container(
                  child: Text('Other',
                  style: TextStyle(
                    fontSize: size.height*0.012,
                    color: Colors.white
                  ),),
                )      
            ],
                      ),
            ],
          ),
        ),
        Row(        
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width*0.15),
              child: Text('4',
              style: TextStyle(
                fontSize: size.height*0.065,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Icon(Icons.arrow_upward,
              color: Colors.greenAccent,),
            )
          ],
        )
          ],
        )
      ),
    ),
  SizedBox(height: size.height*0.02,),
  Card(
      elevation: size.height*0.005,
      color: Colors.blueGrey,
      child: Container(
        height: size.height*0.14,
        width: size.width*0.9,
        child: Row(
          children: [
            Container(
              // color: Colors.red,
          height: size.height*0.14,
          width: size.width*0.5,
          child: Column(
            children: [
                SizedBox(height: size.height*0.02,),
               Container(
          margin: EdgeInsets.only(right: size.height*0.06),
          child: Text("New Client",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.02
          ),),
        ),
        SizedBox(height: size.height*0.005,),
        Container(
          margin: EdgeInsets.only(right: size.height*0.072),
          child: Text("past 90 days",
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.014
          ),),
        ),
          SizedBox(height: size.height*0.02,),
          Row(
            children: [
            Container(
              margin: EdgeInsets.only(left: size.width*0.075),
              height: size.height*0.013,
              width: size.width*0.03,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(size.height*0.003)
              ),
                              ),
                SizedBox(width: size.width*0.015,),
                Container(
                  child: Text('SQUIRE',
                  style: TextStyle(
                    fontSize: size.height*0.012,
                    color: Colors.white
                  ),),
                ),
                 Container(
              margin: EdgeInsets.only(left: size.width*0.03),
              height: size.height*0.013,
              width: size.width*0.03,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(size.height*0.003)
              ),
                              ),
                SizedBox(width: size.width*0.01,),
                Container(
                  child: Text('Other',
                  style: TextStyle(
                    fontSize: size.height*0.012,
                    color: Colors.white
                  ),),
                )
            ],
                      ),
            ],
          ),
        ),
        Row(        
          children: [
            Container(
              margin: EdgeInsets.only(left: size.width*0.15),
              child: Text('4',
              style: TextStyle(
                fontSize: size.height*0.065,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),
            ),
            Container(
              child: Icon(Icons.arrow_upward,
              color: Colors.greenAccent,),
            )
          ],
        )       
          ],
        )
      ),
    ),  
           ],
        ),
      ),
    );
  }
}