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
      telefone TEXT NOT NULL,
      cidade TEXT,
      estado TEXT
    )
    ''';
    await db.execute(tableSQL);
  }

  Future<int> insertMedico(Map<String, dynamic> medicoData) async {
    final db = await instance.database;
    return await db.insert('medicos', medicoData);
  }

  Future<List<Medico>> getMedicos() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query('medicos');
    return result.map((json) => Medico.fromJson(json)).toList();
  }

  Future<List<Medico>> listarMedicos() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('medicos');
    return result.map((json) => Medico.fromJson(json)).toList();
  }

}
