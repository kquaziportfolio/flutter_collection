import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "McDonalds.dart";
import "stopwatch.dart";
import "tictactoe.dart";
import "McDonaldsStuff/main.dart";
import "main.dart";

class NavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Home",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => AppMain()));
                },
              ),
              InkWell(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "TicTactoe",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => TicTacToeMain()));
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Stopwatch",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => MyStopApp()));
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("McDonalds",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => ImageTestsMain()));
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Actual McDonalds",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => McDonaldsMain()));
                },
              ),
            ],
          ),
          color: Colors.amber,
        ));
  }
}