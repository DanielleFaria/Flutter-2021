import 'package:flutter_application_teste/PlacarLista/ResultadoJogo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_teste/PlacarLista/PlacarJogo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  List<ResultadoJogo> _resultados = [
    new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
    new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
    new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
    new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
    new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
    new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
    new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
    new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
    new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
    new ResultadoJogo("Brasil", "Alemanha", "1", "7"),
    new ResultadoJogo("Palmeiras", "Corinthias", "0", "10"),
    new ResultadoJogo("Noroeste", "Palmeiras", "10", "0"),
  ];

  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: _resultados.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SegundaRota(_resultados[index])),
                  );
                },
                child: new Card(
                  child: PlacarJogo(new ResultadoJogo(
                      _resultados[index].adversario1,
                      _resultados[index].adversario2,
                      _resultados[index].resultado1,
                      _resultados[index].resultado2)),
                ));
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class SegundaRota extends StatelessWidget {
  ResultadoJogo _resultadoJogo;

  SegundaRota(this._resultadoJogo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resultado"),
      ),
      body: Center(
          child: Column(children: <Widget>[
        PlacarJogo(this._resultadoJogo),
        Expanded(
            child: Container(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Text(
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
      ])),
    );
  }
}
