import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;


  Future<Database?> initDB() async {

    String path = join(await getDatabasesPath(), 'medicos.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, version) async {
      String sql = '''
        CREATE TABLE MEDICOS (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT NOT NULL,
          especialidade TEXT NOT NULL,
          crm TEXT NOT NULL UNIQUE,
          email TEXT NOT NULL,
          telefone TEXT NOT NULL
        );
      ''';
      await db.execute(sql);

      sql = '''
        INSERT INTO MEDICOS (nome, especialidade, crm, email, telefone) VALUES 
        ('Dr. João Silva', 'Cardiologista', '12345-SP', 'joao.silva@hospital.com', '(11) 98765-4321'),
        ('Dra. Maria Fernanda', 'Ginecologista', '67890-RJ', 'maria.fernanda@hospital.com', '(21) 91234-5678'),
        ('Dr. Pedro Costa', 'Pediatra', '54321-MG', 'pedro.costa@hospital.com', '(31) 99876-5432'),
        ('Dra. Ana Souza', 'Endocrinologista', '98765-PR', 'ana.souza@hospital.com', '(41) 96543-2109');
      ''';
      await db.execute(sql);
    });

    return _db;
  }
}
