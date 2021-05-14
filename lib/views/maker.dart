import 'package:flutter/material.dart';

class Maker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                const Color(0xff213A50),
                const Color(0xff071930),
              ])),
              child: SingleChildScrollView(
                  child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "CravingsAnd",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Calories",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 35,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 100),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1611095973763-414019e72400?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80'))),
                    height: 250,
                    width: 250,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "This application is made by Nitin Verma",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: true,
                        textScaleFactor: 1.3,
                      ),
                      Text(
                        "For any suggestion and constructive feedback contact me at",
                        textScaleFactor: 1.3,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                      Row(children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://cdn.wccftech.com/wp-content/uploads/2020/09/Gmail.png'),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "nitinverma03241@gmail.com",
                          textScaleFactor: 1.3,
                          softWrap: true,
                          style: TextStyle(
                              color: Colors.yellow,
                              decoration: TextDecoration.underline),
                        ),
                      ]),
                      SizedBox(
                        height: 40,
                      ),
                      Icon(
                        Icons.laptop,
                        size: 150,
                      ),
                    ],
                  ),
                )
              ])))
        ],
      ),
    );
  }
}
