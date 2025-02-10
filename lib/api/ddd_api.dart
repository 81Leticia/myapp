import 'package:myapp/domain/ddd.dart';
import 'package:dio/dio.dart';

class DddApi {
  final domain = 'https://brasilapi.com.br/api';
  final dio = Dio();

  Future<DDD> findDddByDdd(String ddd) async {
    final response = await dio.get('$domain/ddd/v1/$ddd');
    DDD result = DDD.fromJson(response.data);

    print(response);
    return result;
  }
}

