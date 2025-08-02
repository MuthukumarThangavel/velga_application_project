import 'package:flutter/material.dart';

class Msg2 extends StatelessWidget {
  const Msg2({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width*1.0,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffff99cc),
            Color(0xff33ccff),
            
            
          ],)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height*0.2),
                bottomRight: Radius.circular(size.height*0.2))
              ),
              elevation: size.height*0.03,
              child: Container(
                height: size.height*0.57,
                width: size.width*0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(size.height*0.14),
                  bottomRight: Radius.circular(size.height*0.14)),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text("Muthukumar",
                          style: TextStyle(fontSize: size.height*0.022,
                          fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    SizedBox(height: size.height*0.035,),
                    Container(
                      height: size.height*0.385,
                      width: size.width*0.75,
                      
                      
                      
                      child: Text("Velga was co-founded by Muthukumar and Ajaykumar, two passionate entrepreneurs dedicated to bridging the gap between creativity and technology. With 4+ years of experience serving an international clientele, our mission is to deliver exceptional results with a fresh, dynamic approach.At our core, we are developers, designers, and strategists who believe in the power of collaboration and innovation.Velga was co-founded by Muthukumar and Ajaykumar, two passionate entrepreneurs dedicated to bridging the gap between creativity and technology. With 4+ years of experience serving an international clientele",
                      textAlign: TextAlign.justify,),
                    )
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