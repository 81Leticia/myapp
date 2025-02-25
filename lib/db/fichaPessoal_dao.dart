import 'package:myapp/db/db_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:myapp/domain/paciente.dart';

class FichaPessoalDao {

  salvarFichaPessoal(Paciente fichaPessoal) async {
    Database database = await DBHelper().initDB();
    database.insert('FICHA_PESSOAL', fichaPessoal.toJson());
  }

  Future<List<Paciente>> listarFichaPessoal() async {
    Database db = await DBHelper().initDB();
    String sql = 'SELECT * FROM FICHA_PESSOAL;';

    var result = await db.rawQuery(sql);

    List<Paciente> lista = [];
    for (var json in result) {
      Paciente fichaPessoal = Paciente.fromJson(json);
      lista.add(fichaPessoal);
    }

    return lista;
  }
}