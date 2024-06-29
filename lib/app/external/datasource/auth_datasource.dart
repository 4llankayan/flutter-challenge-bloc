import 'package:dio/dio.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/infra/datasource/auth_datasource.dart';
import 'package:flutter_challenge/app/utils/base_url.dart';

class AuthDatasourceImpl implements AuthDatasource {
  final Dio dio;

  AuthDatasourceImpl(this.dio);

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> body) async {
    final response = await dio.post('${BaseUrl.BASE_URL}/auth/login', data: body);

    if (response.statusCode != 200) {
      throw CustomException(message: response.data.message);
    }

    return Map<String, dynamic>.from(response.data['results']);
  }

  @override
  Future<Map<String, dynamic>> register(Map<String, dynamic> body) async {
    final response = await dio.post('${BaseUrl.BASE_URL}/auth/register', data: body);

    if (response.statusCode != 200) {
      throw CustomException(message: response.data.message);
    }

    return Map<String, dynamic>.from(response.data);
  }
}
