import 'dart:math';

import 'package:flutter/material.dart';

import 'game.dart';

class MainPage extends StatefulWidget {
  late Game _game;

  MainPage({Key? key}) : super(key: key) {
    _game = Game(maxRandom: 100);
  }

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  String _input = '';
  String _status = 'ทายเลข 1 ถึง 100';

  int? answerNum;

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var showSeven = true;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/img.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.white)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text('$_input', style: TextStyle(fontSize: 35.0,color: Colors.amberAccent),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('$_status', style: TextStyle(fontSize: 20.0,color: Colors.white),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 1; i <= 3; i++) buildButton(i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 4; i <= 6; i++) buildButton(i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 7; i <= 9; i++) buildButton(i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          print('X');
                        },
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: Icon(Icons.close, color:  Colors.teal.shade600,),
                        ),
                      ),
                    ),*/
                    buildButton(-2),
                    buildButton(0),
                    buildButton(-1),
                    /*Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          print('BackSpace');
                        },
                        borderRadius: BorderRadius.circular(30.0),
                        child: Container(
                          width: 60,
                          height: 60,
                          child: buildButton(-1),
                        ),
                      ),
                    ),*/

                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {
                    var input = _input;
                    var guess = int.tryParse(input);

                    if (guess == null) {
                      _showOkDialog(context, 'ERROR',
                          'กรุณากรอกตัวเลข');
                      return;
                    }
                    var guessResult = widget._game.doGuess(guess);
                    if (guessResult > 0) {
                      setState(() {
                        _status = '$guess : มากเกินไป ';
                        _input = '';
                      });

                    } else if (guessResult < 0) {
                      setState(() {
                        _status = '$guess : น้อยเกินไป';
                        _input = '';
                      });
                    } else {
                      setState(() {
                        _status = '$guess ถูกต้อง 🎉 (ทาย ${widget._game.guessCount} ครั้ง)';
                        _input = '';
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(int? num) {

    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 1.0),
      child: OutlinedButton(
          onPressed: () {

            if(num==-1){
              setState(() {
                _input = _input.substring(0,_input.length-1);
              });
              print('You pressed Backspace button');
            }else if(num==-2){
              setState(() {
                _input = '';
              });
              print('You pressed close button');
            }else{
              if(_input.length<3)
                setState(() {
                  _input = _input+'$num';
                });
              print('You pressed $num');
            }
          },
          child: (num==-1)?Icon(Icons.backspace, color:  Colors.amber,) : (num==-2) ? Icon(Icons.close, color:  Colors.amber,) : Text('$num')),
    );
  }
}