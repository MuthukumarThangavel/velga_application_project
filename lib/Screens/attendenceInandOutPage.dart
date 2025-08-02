import 'package:flutter/material.dart';

class AttendenceInandOutPage extends StatelessWidget {
  const AttendenceInandOutPage({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: size.height * 0.4,
              width: size.width * 0.999,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://tse1.mm.bing.net/th/id/OIP.v22u2J4R8cbWYX1O_ebJmAHaE8?pid=Api&P=0&h=180",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.035),
              height: size.height * 0.115,
              width: size.width * 0.93,

              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(size.height * 0.018),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.025,
                          left: size.width * 0.047,
                        ),
                        child: Text(
                          "You are in the clock-in area!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.020,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: size.height * 0.005,
                          left: size.width * 0.05,
                        ),
                        child: Text(
                          "Now you can press clock in this area",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.025),
            Container(
              margin: EdgeInsets.only(left: size.height * 0.02),
              height: size.height * 0.04,
              width: size.width * 0.99,
              color: Colors.transparent,

              child: Text(
                "MY PROFILE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Container(
              height: size.height * 0.11,
              width: size.width * 0.93,

              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: size.height * 0.0005,
                ),
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(size.height * 0.018),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.03),
                    height: size.height * 0.09,
                    width: size.width * 0.195,

                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://preview.redd.it/created-random-people-using-chatgpt-midjourney-do-you-know-v0-q1aa450i5dqb1.png?width=1024&format=png&auto=webp&s=c4e9abc47d193474a2fa1a7e337d9d9340dce947",
                        ),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(size.height * 0.010),
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.015,
                                right: size.width * 0.28,
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Tonald Drump",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: size.width * 0.025,
                                    ),
                                    child: Icon(
                                      Icons.person,
                                      size: size.height * 0.022,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: size.height * 0.0045,
                                right: size.width * 0.26,
                              ),
                              child: Text("29 september 2024"),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.0035),
                        Row(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(child: Icon(Icons.person)),
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: size.height * 0.025,
                                    ),
                                    child: Text(
                                      "last 45.4334 Long 97897.576",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.018),

            Container(
              margin: EdgeInsets.only(left: size.height * 0.02),
              height: size.height * 0.035,
              width: size.width * 0.99,
              color: Colors.transparent,

              child: Text(
                "SCHEDULE",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: size.height * 0.092,
                  width: size.width * 0.42,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: size.height * 0.0005,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(size.height * 0.018),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "CLOCK IN",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "09:00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.030,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.092,
                  width: size.width * 0.42,

                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: size.height * 0.0005,
                    ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(size.height * 0.018),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "CLOCK OUT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "05:00",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.030,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03),

            Container(
              height: size.height * 0.065,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(size.height * 0.05),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Clock In",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
