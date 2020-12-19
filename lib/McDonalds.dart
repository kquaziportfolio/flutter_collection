import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "dart:async";
import "navbar.dart";

void main() => runApp(ImageTestsMain());

class ImageTestsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: NavBar(),
          body: ImageTests(),
          appBar: AppBar(
            title: Text("Title"),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    print("Yeet");
                  },
                  icon: Icon(Icons.cloud_off)),
              IconButton(
                onPressed: () {
                  print("The party button was clicked");
                },
                icon: Icon(Icons.party_mode),
              )
            ],
          ),
          backgroundColor: Colors.amberAccent,
        ));
  }
}

class ImageTests extends StatelessWidget {
  var _foods = [
    "Chocalate Shake",
    "Vanilla Shake",
    "Strawberry Shake",
    "Vanilla Cone",
    "Hot Fudge Sundae",
    "McFlurry with M&M'S",
    "Kiddie Cone",
    "Hot Caramel Sundae"
  ];
  var _images = [
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Chocolate-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Vanilla-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Strawberry-McCafe-Shake-Medium.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Vanilla-Reduced-Fat-Ice-Cream-Cone.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Hot-Fudge-Sundae.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-McFlurry-with-MMS-Chocolate-Candies-12floz-cup.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Kiddie-Cone.jpg",
    "https://www.mcdonalds.com/is/image/content/dam/usa/nfl/nutrition/items/iconic/desktop/t-mcdonalds-Hot-Caramel-Sundae.jpg?"
  ];
  var _price=[
    "\$3.40",
    "\$3.40",
    "\$3.40",
    "\$3.40",
    "\$3.40",
    "\$3.40",
    "\$3.40",
    "\$3.40",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            child: Image.network(_images[index]),
                            height: 100,
                            width: 130),
                        Container(child: Text(_foods[index]))
                      ])),
              onTap: (){
                showDialog(context: context,child:AlertDialog(
                  content: Container(
                    child: Column(
                      children: <Widget>[
                        Container(child:Image.network(_images[index]),height:100,width:130),
                        Text(_price[index],
                          style: TextStyle(
                              fontSize: 30
                          ),
                        )
                      ],
                    ),
                  ),
                ));
              },
            );
          },
        ));
  }
}
