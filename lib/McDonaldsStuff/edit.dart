import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "package:http/http.dart" as http;
import "navbar.dart";
import "main.dart";
class EditItemBody extends StatefulWidget{
  var name,link,price;
  EditItemBody(this.name,this.link,this.price);
  @override
  State<EditItemBody> createState() => EditItem(this.name,this.link,this.price);
}

class EditItem extends State<EditItemBody>{
  var name,link,price;
  EditItem(this.name,this.link,this.price);
  @override
  Widget build(BuildContext context) {
    var nameControl=new TextEditingController(text: this.name);
    var priceControl=new TextEditingController(text: this.price);
    var linkControl=new TextEditingController(text: this.link);
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
              controller: nameControl,
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
              controller: linkControl,
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
              controller: priceControl,
            decoration: InputDecoration(border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )),
          )
          ),
          InkWell(
            onTap: () async {
              print("test");
              print(nameControl.text);
              print(linkControl.text);
              print(priceControl.text);
              var _tempresponse=await http.post("http://10.0.0.161:80/edit",
              body: {"new_name":nameControl.text,"new_link":linkControl.text,"new_price":priceControl.text,"old_name":this.name,"old_link":this.link,"old_price":this.price}
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

class EditItemMain extends StatelessWidget{
  var link,price,name;
  EditItemMain(this.name,this.link,this.price);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "ComicSans"
      ),
        home: Scaffold(
      drawer: NavBar(),
      body: EditItemBody(this.name,this.link,this.price),
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