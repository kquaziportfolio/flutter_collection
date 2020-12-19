import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "dart:async";
import "navbar.dart";
void main() => runApp(MyStopApp());
BuildContext context2;
class MyStopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context1) {
    context2=context1;
    return MaterialApp(
        home: Scaffold(
          drawer: NavBar(),
      body: Column(
        children: <Widget>[CountdownTimer(), StopWatch()],
      ),
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

class CountdownTimer extends StatefulWidget {
  @override
  State<CountdownTimer> createState() => CountdownTimerObject();
}

class CountdownTimerObject extends State<CountdownTimer> {
  int _count = 5;
  int _stop = 0;

  void countdown() {
    Duration duration = Duration(seconds: 1);
    Timer t = Timer.periodic(duration, (timer) {
      setState(() {
        _count--;
        if (_count == 0 || _stop == 1) {
          _stop = 1;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: Text("Timer!", style: TextStyle(fontSize: 20))),
          Container(
            child: Text(
              _count.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                  radius: 0,
                  onTap: countdown,
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          color: Colors.green))),
              InkWell(
                  onTap: () {
                    setState(() {
                      _stop = 1;
                    });
                  },
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "Stop",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          color: Colors.red)),
                  radius: 0),
            ],
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text("Reset",
                  style: TextStyle(fontSize: 50, color: Colors.white)),
              color: Colors.blue,
            ),
            onTap: () {
              setState(() {
                _count = 5;
                _stop = 0;
              });
            },
          )
        ],
      ),
    );
  }
}

class StopWatch extends StatefulWidget {
  @override
  State<StopWatch> createState() => StopWatchObject();
}

class StopWatchObject extends State<StopWatch> {
  int _count = 0;
  int _stop = 0;

  void countdown() {
    setState(() {
      _stop = 0;
    });
    Duration duration = Duration(seconds: 1);
    Timer t = Timer.periodic(duration, (timer) {
      setState(() {
        _count++;
        if (_stop == 1) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: Text("Stopwatch!", style: TextStyle(fontSize: 20))),
          Container(
            child: Text(
              _count.toString(),
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                  radius: 0,
                  onTap: countdown,
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "Start",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          color: Colors.green))),
              InkWell(
                  onTap: () {
                    setState(() {
                      _stop = 1;
                    });
                  },
                  child: Center(
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "Stop",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                          color: Colors.red)),
                  radius: 0),
            ],
          ),
          InkWell(
            child: Container(
              margin: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: Text("Reset",
                  style: TextStyle(fontSize: 50, color: Colors.white)),
              color: Colors.blue,
            ),
            onTap: () {
              setState(() {
                _count = 0;
                _stop = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}
