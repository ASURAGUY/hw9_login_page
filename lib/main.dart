import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  var _num = 0;
  var _empty = 6;
  var _password = '';

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
              child: Text(
                'NEXT',
                style: TextStyle(color: Colors.indigo),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16.0),
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
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Icon(
                            Icons.https,
                            size: 80.0,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text('????????????????????????????????????????????????',
                              style: TextStyle(
                                  fontSize: 22.0, color: Colors.white)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Collection for
                              for (var i = 0; i < _num; i++) //??????????????????
                                Container(
                                  width: 10.0,
                                  height: 10.0,
                                  margin: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              for (var i = 0; i < _empty ; i++) //????????????????????????????????????
                                Container(
                                  width: 20.0,
                                  height: 20.0,
                                  margin: EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 1; i <= 3; i++) buildButton(i),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 4; i <= 6; i++) buildButton(i),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 7; i <= 9; i++) buildButton(i),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 30,),
                                child: Container(
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25, right: 25,),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: buildButton(0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Icon(
                                    Icons.backspace,
                                    size: 30.0,
                                    color: Colors.white
                                ),
                              ),
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: TextButton(
                            child: Text(
                              '?????????????????????????????????',
                              style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                            ),
                            onPressed: () {
                              _showOkDialog(context, '?????????????????????????????????',
                                  '????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
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
            setState ((){
              if(_num<=5) {
                _empty--;
                _num++;
                _password+='$num';
              }
            });
          },

      )
     );
  }
}