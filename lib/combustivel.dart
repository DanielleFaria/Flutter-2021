import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(_MyAppState());

class _MyAppState extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String resultado = "";
  final gasolinaControler = TextEditingController();
  final alcoolControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
            child: Container(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          children: [
            Image.asset(
              'assets/combustivel.png',
              height: 50,
              width: 50,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Valor Gasolina"),
            TextField(
              controller: gasolinaControler,
              obscureText: false,
              style: style,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "0.00",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Valor Alcool", textAlign: TextAlign.left),
            TextField(
              controller: alcoolControler,
              obscureText: false,
              style: style,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  hintText: "0.00",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32.0))),
            ),
            SizedBox(
              height: 10.0,
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(30.0),
              color: Color(0xff01A0C7),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                onPressed: () {
                  resultado = calculo(double.parse(gasolinaControler.text), double.parse(alcoolControler.text));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SegundaRota(resultado)),
                  );
                },
                child: Text("Calcular",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    )));
  }
}

String calculo(double vlrGasolina, double vlrAlcool) {

    if(vlrAlcool / vlrGasolina < 0.7 ){ 
      return "Alcool";
    } else { 
      return "Gasolina"; 
    }  
}

// ignore: must_be_immutable
class SegundaRota extends StatelessWidget {
  String resultado; 

  SegundaRota(this.resultado);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
        child: Text(" O que combustivel que mais compensa é " + resultado , 
                    textAlign: TextAlign.center ),
        ),
      ),
    );
  }
}