import 'package:sqflite/sqflite.dart';
import 'package:myapp/domain/hospital.dart';
import 'package:myapp/db/DB_Helper.dart';

class HospitalDAO {

  // Listar hospitais
  Future<List<Hospital>> listarHospitais() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM HOSPITAIS;';

    var result = await db.rawQuery(sql);

    List<Hospital> lista = [];
    for (var json in result) {
      Hospital hospital = Hospital.fromJson(json);
      lista.add(hospital);
    }

    return lista;
  }

  Future<void> insertHospital(Hospital hosp) async {
    Database db = await DBHelper().initDB();
    try {
      // Tentando inserir no banco de dados
      await db.insert(
        "HOSPITAIS",
        hosp.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace, // Em caso de conflito, substitui
      );
      print("Hospital inserido com sucesso!");
    } catch (e) {
      // Tratamento de erro caso a inserção falhe
      print("Erro ao inserir hospital: $e");
      throw Exception("Erro ao inserir hospital");
    }
  }
  Future<List<Hospital>> listarHospital() async {
    final db = await DBHelper().initDB();

    final List<Map<String, dynamic>> maps = await db.query('HOSPITAIS');

    return List.generate(maps.length, (i) {
      return Hospital.fromJson(maps[i]);
    });
  }
}
