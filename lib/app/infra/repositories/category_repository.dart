import 'package:flutter_challenge/app/domain/entities/category_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/category_repository.dart';
import 'package:flutter_challenge/app/infra/datasource/category_datasource.dart';
import 'package:result_dart/result_dart.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource categoryDatasource;

  CategoryRepositoryImpl({
    required this.categoryDatasource,
  });

  @override
  Future<Result<List<CategoryEntity>, CustomException>> fetchCategories() async {
    try {
      final response = await categoryDatasource.getAllCategories();
      final result = response.map(CategoryEntity.fromMap).toList();

      return Result.success(result);
    } on CustomException catch (e) {
      return Result.failure(e);
    }
  }
}
