import 'package:sqflite/sqflite.dart';
import 'package:myapp/domain/medico.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedicoDAO {

  Future<List<Medico>> listarMedicos() async {
    Database db = await DBHelper.instance.database;
    String sql = 'SELECT * FROM medicos;';
    var result = await db.rawQuery(sql);

    List<Medico> lista = [];
    for (var json in result) {
      Medico medico = Medico.fromJson(json);
      lista.add(medico);
    }

    return lista;
  }

  Future<void> insertMedico(Medico medico) async {
    Database db = await DBHelper.instance.database;
    await db.insert("medicos", medico.toJson());
  }

  Future<List<Medico>> listarMedico() async {
    final db = await DBHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query('medicos');
    return List.generate(maps.length, (i) {
      return Medico.fromJson(maps[i]);
    });
  }

}
