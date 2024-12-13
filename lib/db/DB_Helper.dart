
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Hospital/hospital.dart';

class DBHelper {

  late Database _db;

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'hospitais.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String sql =
          'CREATE TABLE HOSPITAIS (id INTEGER PRIMARY KEY AUTOINCREMENT, nome varchar(100),  endereco varchar(100),  cidade varchar(100), cep  varchar(100), email varchar(100), telefone varchar(100));';
      await db.execute(sql);

      sql =
      " INSERT INTO HOSPITAIS (nome, endereco, cidade, cep, email, telefone) VALUES ('Hospital São José', 'Rua Principal 123', 'São Paulo', '12345-678', 'contato@hospitalsaojose.com', '(11) 98765-4321');";
      ;
      await db.execute(sql);
    });
    return _db;
    print(path);

  }


}

