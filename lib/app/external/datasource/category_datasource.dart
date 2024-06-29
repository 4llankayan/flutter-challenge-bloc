import 'package:dio/dio.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/infra/datasource/category_datasource.dart';
import 'package:flutter_challenge/app/utils/base_url.dart';

class CategoryDatasourceImpl implements CategoryDatasource {
  final Dio dio;

  CategoryDatasourceImpl(this.dio);

  @override
  Future<List<Map<String, dynamic>>> getAllCategories() async {
    final response = await dio.get('${BaseUrl.BASE_URL}/categories');

    if (response.statusCode != 200) {
      throw CustomException(message: response.data.message);
    }

    return List<Map<String, dynamic>>.from(response.data);
  }
}
