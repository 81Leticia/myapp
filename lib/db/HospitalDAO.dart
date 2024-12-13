import 'package:sqflite/sqflite.dart';
import 'package:untitled/Hospital/hospital.dart';
import 'package:untitled/db/DBHelper.dart';

class HospitalDAO{

  Future<List<Hospital>> listarHospitais() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM HOSPITAIS;';

    var result = await db.rawQuery(sql);

    List<Hospital> lista = [];
    for (var json in result) {
      Hospital pacote = Hospital.fromJson(json);
      lista.add(pacote);
    }

    return lista;
  }

  insertHospital(Hospital hosp) async{

    Database db = await DBHelper().initDB();
    db.insert("HOSPITAIS",hosp.toJson());
  }


  Future<List<Hospital>> listarHospital() async {
    final db = await DBHelper().initDB();

    final List<Map<String, dynamic>> maps = await db.query('HOSPITAIS');

    return List.generate(maps.length, (i) {
      return Hospital.fromJson(maps[i]);
    });
  }
}