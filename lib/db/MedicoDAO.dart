import 'package:sqflite/sqflite.dart';
import 'package:myapp/domain/medico.dart';
import 'package:myapp/db/DBHelper.dart';

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

  Future<Medico?> buscarMedicoPorId(int id) async {
    final db = await DBHelper.instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'medicos',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Medico.fromJson(maps.first);
    }
    return null;
  }

  Future<int> updateMedico(Medico medico) async {
    final db = await DBHelper.instance.database;
    return await db.update(
      'medicos',
      medico.toJson(),
      where: 'id = ?',
      whereArgs: [medico.id],
    );
  }

  Future<int> deleteMedico(int id) async {
    final db = await DBHelper.instance.database;
    return await db.delete(
      'medicos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
