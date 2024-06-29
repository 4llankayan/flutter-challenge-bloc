import 'package:flutter_challenge/app/domain/entities/category_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:result_dart/result_dart.dart';

abstract class CategoryRepository {
  Future<Result<List<CategoryEntity>, CustomException>> fetchCategories();
}
