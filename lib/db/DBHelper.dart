import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:myapp/domain/medico.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('medicos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const String tableSQL = '''
    CREATE TABLE medicos(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nome TEXT NOT NULL,
      especialidade TEXT NOT NULL,
      crm TEXT NOT NULL,
      email TEXT NOT NULL,
      telefone TEXT NOT NULL
    )
    ''';
    await db.execute(tableSQL);
  }

  Future<int> insertMedico(Medico medico, String crm, String email, String telefone) async {
    final db = await instance.database;
    Map<String, dynamic> medicoMap = medico.toJson();
    medicoMap['crm'] = crm;
    medicoMap['email'] = email;
    medicoMap['telefone'] = telefone;
    return await db.insert('medicos', medicoMap);
  }

  Future<List<Medico>> getMedicos() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query('medicos');

    return result.map((json) => Medico.fromJson(json)).toList();
  }

  Future<int> updateMedico(Medico medico) async {
    final db = await instance.database;
    return await db.update(
      'medicos',
      medico.toJson(),
      where: 'id = ?',
      whereArgs: [medico.id],
    );
  }

  Future<int> deleteMedico(int id) async {
    final db = await instance.database;
    return await db.delete(
      'medicos',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
  Future<List<Medico>> listarMedicos() async {
    final db = await database;  
    final List<Map<String, dynamic>> result = await db.query('medicos'); 
    return result.map((json) => Medico.fromJson(json)).toList(); 
  }
}
