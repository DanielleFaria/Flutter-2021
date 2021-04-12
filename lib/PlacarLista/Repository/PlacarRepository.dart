import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../ResultadoJogo.dart';
import 'package:flutter_application_teste/PlacarLista/ResultadoJogo.dart';
import 'package:flutter/rendering.dart';

class PlacarRepository {
  static final PlacarRepository _singleton = new PlacarRepository();

  factory PlacarRepository() {
    return _singleton;
  }

  static _dataBaseManager() async {
    final int versiondb = 1;
    final pathDatabase = await getDatabasesPath();
    final localDatabase = join(pathDatabase, "partidas.db");
    var bd = await openDatabase(localDatabase, version: versiondb,
        onCreate: (db, versiondb) {
      String sql =
          "create table partidas(id integer primary key, pais1 varchar, pais2 varchar, resultado1 varchar, resultado2 varchar)";
      db.execute(sql);
    });
    return bd;
  }

  static save(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "pais1": resultado.adversario1,
      "pais2": resultado.adversario2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    int id = await bd.insert("partidas", dadosResultado);
    print("salvou $id");
  }

  static Future list() async {
    Database bd = await _dataBaseManager();
    List listaTesultados = await bd.rawQuery("select * from partidas");

    var _jogos = new List();
    for (var item in listaTesultados) {
      var result = new ResultadoJogo(
          item['pais1'], item['pais2'], item['resultado1'], item['resultado2']);
      result.id = item['id'];
      _jogos.add(result);
    }

    return _jogos;
  }

  static update(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

    Map<String, dynamic> dadosResultado = {
      "pais1": resultado.adversario1,
      "pais2": resultado.adversario2,
      "resultado1": resultado.resultado1,
      "resultado2": resultado.resultado2
    };

    bd.update("partidas", dadosResultado,
        where: "id = ?", whereArgs: [resultado.id]);
  }

  static delete(ResultadoJogo resultado) async {
    Database bd = await _dataBaseManager();

     bd.delete("partidas", where: "id = ?", whereArgs: [resultado.id]);
  }
}
