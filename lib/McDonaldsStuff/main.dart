import 'dart:convert';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:http/http.dart" as http;
import "navbar.dart";
import "edit.dart";


class McDonaldsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ComicSans"
      ),
        home: Scaffold(
      drawer: NavBar(),
      body: ApiTestsBody(),
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

class ApiTestsBody extends StatefulWidget{
  @override
  State<ApiTestsBody> createState()=>ApiTests();
}

class ApiTests extends State<ApiTestsBody>{
  var response;
  void pullData() async{
    print("Test");
    var _newvar=await http.get("http://10.0.0.161:80");
    print(_newvar);
    setState(() {
      response=json.decode(_newvar.body.toString());
      print(response.length);
    });
  }
  @override
  void initState() {
    super.initState();
    pullData();
  }
  String indexToID(int input){
    if(input==0){return "id";}
    else if(input==1){return "secret";}
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: response==null?0:response[0].length,
        itemBuilder: (BuildContext context, int index){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:<Widget>[
            InkWell(
            child: Container(height:200,width:200,child:Image.network(response[1][index])),
            onTap: (){
              showDialog(context: context,child:AlertDialog(
                content: Container(
                  child: Column(
                    children: <Widget>[
                      Container(height:100,width:100,
                      child:Image.network(response[1][index])),
                      Container(child:Text(response[0][index])),
                      Container(child:Text(response[2][index])),
                    ],
                  )
                ),
              ));
            },
          
        ),
        InkWell(
          child: Icon(Icons.edit,size: 50,color: Colors.limeAccent,),
          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditItemMain(response[0][index],response[1][index],response[2][index])));},
        ),
        InkWell(
          child: Icon(Icons.delete,size: 50,color: Colors.redAccent),
          onTap: (){http.post("http://10.0.0.161:80/delete",
          body:{
            "name":response[0][index],
            "link":response[1][index],
            "price":response[2][index]
          }
          );Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => McDonaldsMain()));},
        ),
        ]);
        }
      ),
    );
  }
}