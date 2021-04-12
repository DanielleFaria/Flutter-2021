import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Placar'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(
          child: Row(
              //geral
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    //bandeira
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 2.0),
                        child: Image.asset(
                          'assets/images/brazil.png',
                          height: 40,
                          width: 40,
                        ),
                      )
                    ]),
                Column(
                  //Brasil
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text('Brasil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('01',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 70)),
                              ],
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  //X
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 10, left: 3.0, right: 3.0),
                        child: Text('X',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 60)))
                  ],
                ),
                Column(
                    //Alemanha
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Alemanha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      Text('07',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70)),
                    ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.1),
                      child: Image.asset(
                        'assets/images/germany.png',
                        height: 35,
                        width: 35,
                      ),
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }
}