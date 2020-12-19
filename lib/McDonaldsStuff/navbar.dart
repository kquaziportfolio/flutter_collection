import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "main.dart";
import "add.dart";
import "../main.dart";
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
                      context, MaterialPageRoute(builder: (context) => McDonaldsMain()));
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Add New Item",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => AddNewItemMain()));
                },
              ),
              InkWell(
                child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text("Exit",
                        style: TextStyle(
                          fontSize: 20,
                        ))),
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => AppMain()));
                },
              ),
            ],
          ),
          color: Colors.amber,
        ));
  }
}