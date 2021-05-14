import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/models/recipe_model.dart';
import 'package:recipe_app/views/maker.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController textEditingController = new TextEditingController();

  // ignore: deprecated_member_use
  List<RecipeModel> recipes = new List<RecipeModel>();
  // ignore: deprecated_member_use
  List<String> method = new List<String>();

  getRecipes(String query) async {
    String url =
        "https://api.edamam.com/search?q={$query}&app_id=a22fc4be&app_key=41f351cb54364a4d0fa1f67960e16449";
    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element) {
      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
    });

    Map<String, dynamic> jsonrecipeData = jsonDecode(response.body);
    jsonrecipeData["hits"].forEach((element) {
      String str = element["ingredientLines"];
      method.add(str);
    });
  }

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black45),
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 55),
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Card(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                        'https://images.unsplash.com/photo-1565895405227-31cffbe0cf86?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzV8fHRhc3R5JTIwZm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                      ))),
                      height: 200,
                      width: 300,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "What Will You Cook Today?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellowAccent,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Text(
                    "Just enter you main ingredient have and we will",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  Text(
                    "give you the best suggestions ",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(color: Colors.white, fontSize: 10),
                            decoration: InputDecoration(
                                hintText: "Enter Ingredients",
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (textEditingController.text.isNotEmpty) {
                              print("just do it");
                              getRecipes(textEditingController.text);
                            } else {
                              print("dont do that");
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: GridView(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 20.0, maxCrossAxisExtent: 200.0),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        children: List.generate(recipes.length, (index) {
                          var recipeDetail = recipes[index];

                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.yellow[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Text(
                                  recipeDetail.label,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                  maxLines: 1,
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Card(
                                child: InkWell(
                                  child: Image.network(
                                    recipeDetail.image,
                                    width: 150,
                                    height: 150,
                                  ),
                                ),
                              ),
                            ],
                          );
                        })),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.details_rounded,
          color: Colors.yellow,
        ),
        mini: true,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Maker()));
        },
      ),
    );
  }
}
