import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:http/http.dart" as http;
import "navbar.dart";
void main() => runApp(AppMain());

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ComicSans"
      ),
        home: Scaffold(
      drawer: NavBar(),
      body: AppBody(),
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

class AppBody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Text("Work in progress");
  }
  
}
