import 'package:sqflite/sqflite.dart';
import 'package:myapp/db/DB_Helper.dart';
import 'package:myapp/domain/medico.dart';

class MedicoDAO {

  Future<List<Medico>> listarMedicos() async {
    Database? db = await DBHelper().initDB();
    String sql = 'SELECT * FROM MEDICOS;';

    var result = await db?.rawQuery(sql);

    List<Medico> lista = [];
    for (var json in result!) {
      Medico medico = Medico.fromJson(json);
      lista.add(medico);
    }

    return lista;
  }

  Future<void> inserirMedico(Medico medico) async {
    Database? db = await DBHelper().initDB();
    await db?.insert("MEDICOS", medico.toJson());
  }
}
