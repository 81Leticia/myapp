import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();


  static Database? _database;


  DatabaseHelper._init();


  Future<Database> get database async {
    if (_database != null) return _database!;


    _database = await _initDB('hospital.db');
    return _database!;
  }


  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);


    return await openDatabase(path, version: 1, onCreate: _createDB);
  }


  Future _createDB(Database db, int version) async {
    await db.execute('''
     CREATE TABLE medicos (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       nome TEXT NOT NULL,
       especialidade TEXT NOT NULL
     )
   ''');
  }


  Future<void> inserirMedico(Map<String, dynamic> medico) async {
    final db = await instance.database;
    await db.insert('medicos', medico);
  }


  Future<List<Map<String, dynamic>>> listarMedicos() async {
    final db = await instance.database;
    return await db.query('medicos');
  }
}