import 'package:flutter_challenge/app/domain/entities/category_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/category_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class CategoryUsecase {
  Future<Result<List<CategoryEntity>, CustomException>> call();
}

class CategoryUseCaseImpl implements CategoryUsecase {
  final CategoryRepository categoryRepository;

  CategoryUseCaseImpl({
    required this.categoryRepository,
  });

  @override
  Future<Result<List<CategoryEntity>, CustomException>> call() {
    return categoryRepository.fetchCategories().map((success) => success);
  }
}
