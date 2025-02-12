import 'package:myapp/domain/cnpj.dart';
import 'package:dio/dio.dart';

class CnpjApi {
  final domain = 'https://brasilapi.com.br/api';
  final dio = Dio();

  Future<Cnpj?> findCnpj(String cnpj) async {
    try {
      final response = await dio.get('$domain/cnpj/v2/$cnpj');
      print(response.data);

      Cnpj cnpjData = Cnpj.fromJson(response.data);

      return cnpjData;
    } catch (e) {
      print("Erro ao buscar CNPJ: $e");
      return null;
    }
  }
}
