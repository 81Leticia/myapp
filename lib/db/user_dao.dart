
import 'package:sqflite/sqflite.dart';
import 'package:myapp/domain/cadastro.dart';
import '../domain/user.dart';
import 'db_helper.dart';

class UserDao {
  autenticar(String username, String password) async {
    Database db = await DBHelper().initDB();

    String sql = 'SELECT * FROM USER '
        'WHERE USERNAME = ? AND '
        'PASSWORD = ?;';

    var result = await db.rawQuery(sql, [username, password]);
    return result.isNotEmpty;
  }



  saveUser(User user) async {
    Database db = await DBHelper().initDB();
    db.insert('USER', user.toJson());
  }
}
