import 'package:sqflite/sqflite.dart';
import 'package:myapp/db/DBHelper.dart';
import 'package:myapp/domain/medico.dart';

class MedicoDAO {
  // Método para listar todos os médicos
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

  // Método para inserir um novo médico
  Future<void> inserirMedico(Medico medico) async {
    Database? db = await DBHelper().initDB();
    await db?.insert("MEDICOS", medico.toJson());
  }
}
