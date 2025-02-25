import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, "fichaPessoal.db");
    Database database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );

    print(dbPath);
    return database;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE FICHA_PESSOAL (id INTEGER PRIMARY KEY AUTOINCREMENT, nomeCompleto varchar(100), cpf varchar(50), dataNascimento varchar(50), sexoSelecionado varchar(50), cartaoSus INTEGER, peso INTEGER, telefone varchar(50), endereco varchar(100) );';
    await db.execute(sql);

    sql =
    "INSERT INTO FICHA_PESSOAL (nomeCompleto, cpf, dataNascimento, sexoSelecionado, cartaoSus, peso, telefone, endereco ) VALUES ('Deivid Souza Silva', '123.456.789-12', '12/03/2004', 'Masculino', 000231456789125, 45, 82994348831, 'Feira - Pequena');";
    await db.execute(sql);
  }
}