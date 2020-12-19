import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import "dart:async";
import "navbar.dart";
void main() => runApp(TicTacToeMain());

class TicTacToeMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          drawer: NavBar(),
          body: TicTacToeBoard(),
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

class TicTacToeBoard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TicTacToeObject();
}

class TicTacToeObject extends State<TicTacToeBoard> {
  var _board = {1: "", 2: "", 3: "", 4: "", 5: "", 6: "", 7: "", 8: "", 9: ""};
  var _turn = 0;
  var _win = "";
  var _message = "";

  draw(int pos) {
    if (_board[pos] != "") {
      return;
    }
    setState(() {
      if (_turn == 0) {
        _board[pos] = "X";
      } else {
        _board[pos] = "O";
      }
      _turn = 1 - _turn;
    });
    wincheck();
    if (_win != "") {
      print(_win + " won the game");
    }
  }

  wincheck() {
    setState(() {
      var a = _board;
      if (a[1] == a[2] && a[2] == a[3] && a[1] != "") {
        _win = a[1];
      }
      if (a[4] == a[5] && a[5] == a[6] && a[5] != "") {
        _win = a[5];
      }
      if (a[7] == a[8] && a[8] == a[9] && a[7] != "") {
        _win = a[7];
      }
      if (a[1] == a[4] && a[4] == a[7] && a[1] != "") {
        _win = a[1];
      }
      if (a[2] == a[5] && a[5] == a[8] && a[5] != "") {
        _win = a[5];
      }
      if (a[3] == a[6] && a[6] == a[9] && a[3] != "") {
        _win = a[3];
      }
      if (a[1] == a[5] && a[5] == a[9] && a[5] != "") {
        _win = a[5];
      }
      if (a[7] == a[5] && a[5] == a[3] && a[3] != "") {
        _win = a[3];
      }
      if (_win != "") {
        _board = {
          1: "",
          2: "",
          3: "",
          4: "",
          5: "",
          6: "",
          7: "",
          8: "",
          9: ""
        };
        _message = _win + " won the game!";
        showDialog(
            context: context, child: AlertDialog(content: Text(_message)));
        _win = "";
      } else if (a[1] != "" &&
          a[2] != "" &&
          a[3] != "" &&
          a[4] != "" &&
          a[5] != "" &&
          a[6] != "" &&
          a[7] != "" &&
          a[8] != "" &&
          a[9] != "") {
        _board = {
          1: "",
          2: "",
          3: "",
          4: "",
          5: "",
          6: "",
          7: "",
          8: "",
          9: ""
        };
        _message = "Noone won the game! (You are all losers)";
        showDialog(
            context: context, child: AlertDialog(content: Text(_message)));
        _win = "";
      } else {
        Duration duration = Duration(seconds: 1);
        Timer t = Timer.periodic(duration, (timer) {
          _message = "";
          timer.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[1],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(1);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[2],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(2);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[3],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(3);
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[4],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(4);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[5],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(5);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[6],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(6);
                      },
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[7],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(7);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[8],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(8);
                      },
                    ),
                    InkWell(
                      child: Container(
                          width: _width / 3,
                          height: _width / 3,
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.amber, width: 5)),
                          child: Center(
                              child: Text(
                                _board[9],
                                style: TextStyle(fontSize: 30, color: Colors.amber),
                              ))),
                      onTap: () {
                        draw(9);
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
