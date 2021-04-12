import 'package:flutter/material.dart';
import 'package:flutter_application_teste/AppAgenda/Contato.dart';

class ItemContato extends StatelessWidget {
  final Contato contato;

  ItemContato(this.contato);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Column(children: [
        Row(
            //geral
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                //Brasil
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(this.contato.nome,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  )
                ],
              )
            ]),
      ]),
    );
  }
}
