import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static Future<bool> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('userStatus') ?? false;  // Retorna o status do usuário, ou false caso não encontrado
  }

  static Future<void> setUser(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('userStatus', status);
  }
}
