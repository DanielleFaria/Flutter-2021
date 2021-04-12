import 'package:flutter/material.dart';
import 'package:flutter_application_teste/AppAgenda/Contato.dart';
import 'package:flutter_application_teste/AppAgenda/ItemContato.dart';
import 'package:flutter_application_teste/PlacarLista/Repository/AgendaRepository.dart';

List<Contato> _contatos = [
  new Contato("Danielle", "danifaria.jau@hotmail.com", ")14)996596158"),
  new Contato("João", "joao@gmail.com", "(11)89962257")
];
 
void main() => runApp(MyList());

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista contatos',
      home: _Lista(),
    );
  }
}

class _Lista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<_Lista> {
  final title = 'Basic List';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                       
                        builder: (context) => CadastroView(null)));
                print(_contatos.length);
                setState(() {});
              },
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
              future: AgendaRepository.list(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                      onLongPress: () async {
                        AgendaRepository.delete(snapshot.data[index]);
                        setState(() {});
                      },                      
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CadastroView(snapshot.data[index])),
                        );                        
                        setState(() {});
                      },
                     child: new Card(
                        child: ItemContato(snapshot.data[index]),
                      ));
                    });
              }),
        ),
      ),
    );
  }
}

class CadastroView extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final Contato _contato;

  CadastroView(this._contato);

  final nomeControler = TextEditingController();
  final emailControler = TextEditingController();
  final foneControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (_contato != null) {
      nomeControler.text = _contato.nome;
      emailControler.text = _contato.email;
      foneControler.text = _contato.telfone;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Resultado"),
        ),
        body: Center(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/apple.png',
                          height: 50,
                          width: 50,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: nomeControler,
                          obscureText: false,
                          style: style,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                              hintText: "Nome",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: emailControler,
                          style: style,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: foneControler,
                          style: style,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                              hintText: "Telefone",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(32.0))),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Color(0xff01A0C7),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                            onPressed: () {
                               if (_contato != null) {
                                _contato.nome= nomeControler.text;
                                _contato.email = emailControler.text;
                                _contato.telfone = foneControler.text;
                              
                                AgendaRepository.update(_contato);
                              
                              }
                              else{
                                var novoResultado = new Contato(
                                  nomeControler.text, emailControler.text, foneControler.text);                              
                              AgendaRepository.save(novoResultado);
                    
                              }

                              Navigator.of(context).pop();
                            },
                            child: Text(
                                 _contato == null ? "Novo contato": 'Atualizar contato',
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        )
                      ],
                    )))));
  }
}
