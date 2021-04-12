import 'package:flutter_application_teste/PlacarLista/ResultadoJogo.dart';
import 'Repository/PlacarRepository.dart';
import 'package:flutter/material.dart';

class PlacarJogo extends StatelessWidget {
  final ResultadoJogo resultado;

  PlacarJogo(this.resultado);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Center(
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
                        'brazil.png',
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
                      Text(this.resultado.adversario1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(this.resultado.resultado1,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40)),
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
                      padding: EdgeInsets.only(top: 10, left: 3.0, right: 3.0),
                      child: Text('X',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 40)))
                ],
              ),
              Column(
                  //Alemanha
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(this.resultado.adversario2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(this.resultado.resultado2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 40)),
                  ]),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 3.1),
                    child: Image.asset(
                      'germany.png',
                      height: 35,
                      width: 35,
                    ),
                  )
                ],
              )
            ]),
      ),
    );
  }
}
