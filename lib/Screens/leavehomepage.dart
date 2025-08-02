import 'package:flutter/material.dart';
class Leave1 extends StatefulWidget {
  const Leave1({super.key});

  @override
  State<Leave1> createState() => _Leave1State();
}

class _Leave1State extends State<Leave1> {
  double timevalue = 0;
  double time1value =0;
  
  bool isvisible =false;
  bool visible = false;
  bool full=false;
  bool text =false;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    
    return Scaffold(
      extendBodyBehindAppBar: true,
    
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        
      ) ,
      body: SingleChildScrollView(
        child: Container(
          height: size.height*1.09,
          decoration: BoxDecoration(
             gradient: LinearGradient(
                                  colors: [
                                       Color(0xffff99cc),
            Color(0xff33ccff),
                                  ],
                                  begin: Alignment.topLeft,
                                  end:  Alignment.topRight),
          ),
          child: Column(
            children: [
              SizedBox(height: size.height*0.11,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(isvisible){
                          isvisible=false;
                        }else{
                          isvisible=true;
                        }
                      });
                    },
                    child: Card(
                      elevation: size.height*0.018,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.025)
                      ),
                      child: Container(
                        height: size.height*0.095,
                        width: size.width*0.91,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                          child: Text("SHORT LEAVE",
                          style: TextStyle(
                            fontSize: size.height*0.021,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                        SizedBox(width: size.width*0.3,),
                        Container(
                          child: Icon(Icons.circle_outlined),
                        )
                          ],
                        )
                        
                      ),
                    
                    ),
                  )
                ],
              ),
        
             
              SizedBox(height: size.height*0.045,),
              Visibility(
                visible: isvisible,
                child: Container(
                  width: size.width*0.8,
                  child: Slider(
                  
                    divisions: 5,
                    value: timevalue , onChanged: (double value){
                    setState(() {
                      timevalue=value;
                      

                      
                      
                    });
                  }),
                ),
              ),
              SizedBox(height: size.height*0.03,),
        
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(visible){
                          visible=false;
                        }else{
                          visible=true;
                        }
                        setState(() {
                          if(text){
                            text=false;
                          }else{
                            text=true;
                          }
                        });
                       
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.025)
                      ),
                      child: Container(
                        height: size.height*0.095,
                        width: size.width*0.91,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Container(
                            child: Text("HALF DAY LEAVE",
                            style: TextStyle(
                              fontSize: size.height*0.021,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(width: size.width*0.235,),
                          Container(
                            child: Icon(Icons.circle_outlined),
                          )
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                  
                ],
              ),
              SizedBox(
                height: size.height*0.025,
              ),
              Visibility(
                visible: visible,
                child:Container(
                  
                  height: size.height*0.05,
                 width: size.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      Container(
                        child: Text("1 st Half",
                        style: TextStyle(
                          fontSize: size.height*0.018,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                      SizedBox(width: size.width*0.15,),
                       Container(
                        child: Text("2 st Half",
                        style: TextStyle(
                          fontSize: size.height*0.018,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      )
                    ],
                  ),
                ),
                 ),
              SizedBox(height: size.height*0.008,),
              Visibility(
                visible: visible,
                child: Container(
                  width: size.width*0.8,
                  child: Slider(
                    divisions: 2,
                    value:time1value , onChanged: (double value){
                    setState(() {
                      time1value=value;
                      
                    });
                  }),
                ),
              ),
              SizedBox(height: size.height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        if(full){
                          full = false;
                        }else{
                          full=true;
                        }
                        
                      });
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(size.height*0.025)
                      ),
                      child: Container(
                        height: size.height*0.095,
                        width: size.width*0.91,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Container(
                            child: Text("FULL DAY LEAVE",
                            style: TextStyle(
                               fontSize: size.height*0.021,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          SizedBox(width: size.width*0.235,),
                          Container(
                            child: Icon(Icons.circle_outlined),
                          )
                    
                          ],
                        ),
                      ),
                    ),
                  ),
                 
                  
                ],
              ),
               SizedBox(height: size.height*0.035,),
              Visibility(
                visible: full,
                child: Container(
                  width: size.width*0.9,
                  child: Container(
                    height: size.height*0.17,
                    width: size.width*0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,width: size.width*0.002),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size.height*0.005)
                    ),
                    child: Container(
                      child: TextField(
                        enabled: true,
                        maxLines: 7,
                        decoration: InputDecoration(
                          hintText: "Description",
                          border: InputBorder.none
                          
                        ),
                        
                      ),
                    ),
                  )
                ),
              ),
              SizedBox(height: size.height*0.05,),
        
        
              Row(
                
                children: [
                  GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Message Send"),duration: Duration(milliseconds: 500),));
                    },
                    child: InkWell(
                     
                      
                      child: Card(
                        elevation: size.height*0.008,
                        
                        clipBehavior: Clip.antiAlias,
                        
                        margin: EdgeInsets.only(left: size.width*0.76),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(size.height*0.5)
                        ),
                        child: Container(
                          
                          height: size.height*0.08,
                            
                          width: size.width*0.18,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff558AE2),
                                Color(0xffFCD5F1)
                                
                              ])
                          ),
                          child: Container(
                            child: Icon(Icons.arrow_forward_outlined),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
        
              
              
            ],
          ),
        ),
      ),
  
    );
  }
}