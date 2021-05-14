import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'home.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Expanded(
              child: Image.network(
                'https://images.unsplash.com/photo-1531594652722-292a43e752b4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHRhc3R5JTIwZm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                fit: BoxFit.fitWidth,
              ),
            ),
            backgroundColor: Colors.black45),
        body: Container(
          child: Stack(
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 35),
                          Text(
                            "CravingsAnd",
                            style: TextStyle(
                              fontSize: 33,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Calories",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 33,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGNk8r3qc5qPBG7oP2KdJwI3O9ph-P6Zyhkw&usqp=CAU'),
                      ),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                            ),
                            child: Text("CAN'T DECIDE WHAT TO COOK TODAY??",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.lightGreen[100],
                                ),
                            child: Text(
                                "ARE YOU BORED WITH YOUR REGULAR MEALS??",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                            ),
                            child: Text("DO YOU NEED FOOD RECOMMENDATIONS??",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                //color: Colors.lightGreen[100],
                                ),
                            child: Text("CANNOT THINK OF ANY TASTY FOOD??",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.lightGreen[100],
                            ),
                            child: Text("THEN GET STARTED BY CLICKING BELOW",
                                textScaleFactor: 1.1,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  (MaterialPageRoute(
                                      builder: (context) => Home())));
                            },
                            child: CircleAvatar(
                              child: Text("START",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500)),
                              radius: 40,
                              backgroundImage: NetworkImage(
                                  'https://images.unsplash.com/photo-1488477181946-6428a0291777?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fGZvb2R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
