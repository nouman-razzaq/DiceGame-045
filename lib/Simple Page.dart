import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'homepage.dart';
import 'mainDrawer.dart';

import 'package:flutter/services.dart';

void main() {
  runApp(simplemode());
}

class simplemode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red[700],
          appBar: AppBar(
            shadowColor: Colors.pink,
            backgroundColor: Colors.redAccent[700],
            centerTitle: true,
            title: Text(
              'Dice Role',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          body: Dicepage(),
        ),
      ),
    );
  }
}

class Dicepage extends StatefulWidget {
  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  // var leftdice = 4;
  // var rightdice = 5;
  // int counter = 0;
  // var highscore = 0;
  // highscor() {
  //   highscore = counter;
  // }
  //
  // resetcounter() {
  //   counter = 0;
  //   print('res');
  //   print(counter);
  // }
  //
  // void incrementCounter() {
  //   counter=counter+;
  //   print('inc');
  //   print(counter);
  //   if (counter > highscore) {
  //     highscor();
  //   }
  // }
  //
  // showAlertDialog(BuildContext context) {
  //   // set up the buttons
  //   // Widget cancelButton = FlatButton(
  //   //   child: Text("Cancel"),
  //   //   onPressed: () {
  //   //     // SystemChannels.navigation.;
  //   //     exit(0);
  //   //   },
  //   // );
  //   Widget continueButton = FlatButton(
  //     child: Text("Continue"),
  //     onPressed: () {
  //       Navigator.pop(context, true);
  //     },
  //   );
  //
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text("Game Over"),
  //     content: Text("Would you like to continue Playing"),
  //     actions: [
  //       //cancelButton,
  //       continueButton,
  //     ],
  //   );
  //
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  // void Diceface() {
  //   setState(() {
  //     leftdice = Random().nextInt(6) + 1;
  //     print(rightdice);
  //     print(leftdice);
  //     if (rightdice == leftdice) {
  //       resetcounter();
  //       showAlertDialog(context);
  //     }
  //   });
  // }

  // void Dicefaceright() {
  //   setState(() {
  //     rightdice = Random().nextInt(6) + 1;
  //     print(rightdice);
  //     print(leftdice);
  //     if (rightdice == leftdice) {
  //       resetcounter();
  //       showAlertDialog(context);
  //     }
  //   });
  // }

  //we have to decl veriale in side state<Disecpage> to work
  var imageArray = [
    'dice1.png',
    'dice2.png',
    'dice3.png',
    'dice4.png',
    'dice5.png',
    'dice6.png'
  ];
//var random = new Random();
  int randomIntForDiceOne = Random().nextInt(6);
  int randomIntForDiceTwo = Random().nextInt(6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent[700],
        appBar: AppBar(
          backgroundColor: Colors.pink,
          centerTitle: true,
          title: Text(
            'Simple Level',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
        ),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(21, 50, 21, 50),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: Text(
                  'Sum of Dice = ' +
                      (randomIntForDiceOne + randomIntForDiceTwo + 2)
                          .toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceOne],
                    height: 150,
                    width: 150,
                  ),
                  Image.asset(
                    'images/' + imageArray[randomIntForDiceTwo],
                    height: 150,
                    width: 150,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: RaisedButton(
                  elevation: 15.0,
                  color: Colors.pink,
                  child: Text(
                    '      Check Winner Dice     ',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  elevation: 15.0,
                  color: Colors.pink,
                  onPressed: changeImage,
                  child: Text('           Roll Dice         ',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.pink,
                  elevation: 15.0,
                  onPressed: () {
                    exit(0);
                  },
                  child: Text('          Exit Game         ',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.pink,
                  elevation: 15.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
                    );
                  },
                  child: Text(
                    '          Go Home          ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void changeImage() {
    setState(() {
      randomIntForDiceOne = Random().nextInt(6);
      randomIntForDiceTwo = Random().nextInt(6);
    });
  }

  showAlertDialog(BuildContext context) {
    if (randomIntForDiceOne >= randomIntForDiceTwo) {
      AlertDialog alert = AlertDialog(
        title: Text(
          "Winner Dice :",
          style: TextStyle(
              fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        content: Text(
          "Dice One is Greater ",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.pink),
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    if (randomIntForDiceOne < randomIntForDiceTwo) {
      AlertDialog alert = AlertDialog(
        title: Text(
          "Winner Dice :",
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        content: Text(
          "Dice Two is Greater ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.0,
              color: Colors.white70),
        ),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }
}