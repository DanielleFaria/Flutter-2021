import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../ResultadoJogo.dart';
import 'package:flutter_application_teste/AppAgenda/Contato.dart';
import 'package:flutter/rendering.dart';

class AgendaRepository {
  static final AgendaRepository _singleton = new AgendaRepository();

  factory AgendaRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "contato.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table contato(id integer primary key, nome varchar, email varchar, telfone varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(Contato contato) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "nome": contato.nome,
      "email": contato.email,
      "telfone": contato.telfone
    };

    int id = await bd.insert("contato", dadosResultado);
    print("salvou $id");
  }

  static Future list() async {
    Database bd = await _dataBaseManager();
    List listaContatos = await bd.rawQuery("select * from contato");

    var _contatos = new List();
    for (var item in listaContatos) {
      var result = new Contato(
          item['nome'], item['email'], item['telfone']);
      result.id = item['id'];
      _contatos.add(result);
    }

    return _contatos;
  }

  static update(Contato resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "nome": resultado.nome,
      "email": resultado.email,
      "telfone": resultado.telfone
    };

    bd.update("contato", dadosResultado,
        where: "id = ?", whereArgs: [resultado.id]);
  }

  static delete(Contato contato) async {
    Database bd = await _dataBaseManager();

     bd.delete("contato", where: "id = ?", whereArgs: [contato.id]);
  }
}
