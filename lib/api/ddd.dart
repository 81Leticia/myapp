import 'dart:convert';
import 'package:http/http.dart' as http;

class DddApiService {
  static Future<Map<String, dynamic>?> buscarLocalizacaoPorDDD(String ddd) async {
    try {
      final response = await http.get(Uri.parse('https://brasilapi.com.br/api/ddd/v1/$ddd'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'estado': data['state'],
          'cidade': (data['cities'] as List).isNotEmpty ? data['cities'][0] : 'Cidade não encontrada'
        };
      } else {
        print("Erro ao buscar DDD: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Erro ao conectar com a API: $e");
      return null;
    }
  }
}