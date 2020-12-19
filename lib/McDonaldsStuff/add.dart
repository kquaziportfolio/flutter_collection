import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:http/http.dart" as http;
import "navbar.dart";
import "main.dart";
class AddNewItemBody extends StatefulWidget{
  @override
  State<AddNewItemBody> createState()=>AddNewItem();

}

class AddNewItem extends State<AddNewItemBody>{
  var name=new TextEditingController();
  var price=new TextEditingController();
  var link=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom:10),
            child: Text("Name of the item"),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20),
            child:TextFormField(
              controller: name,
            decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )),
          )
          ),
          Container(
            padding: EdgeInsets.only(bottom:10),
            child: Text("Link of the image"),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20),
            child:TextFormField(
              controller: link,
            decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )),
          )
          ),
          Container(
            padding: EdgeInsets.only(bottom:10),
            child: Text("Price of the item"),
          ),
          Container(
            padding: EdgeInsets.only(bottom:20),
            child:TextFormField(
              controller: price,
            decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )),
          )
          ),
          InkWell(
            onTap: () async {
              print("test");
              print(name.text);
              print(link.text);
              print(price.text);
              var _tempresponse=await http.post("http://10.0.0.161:80/in",
              body: {"name":name.text,"link":link.text,"price":price.text}
              );
              print(_tempresponse.body);
              Navigator.push(context, MaterialPageRoute(builder: (context) => McDonaldsMain()));
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              width: 200,
              child: Text("Submit",style: TextStyle(color:Colors.white,fontSize: 20)),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20) ,
                )
          ),)
        ],
      )
    );
  }
}

class AddNewItemMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ComicSans"
      ),
        home: Scaffold(
      drawer: NavBar(),
      body: AddNewItemBody(),
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