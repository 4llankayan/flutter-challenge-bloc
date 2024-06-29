import 'package:flutter_challenge/app/domain/entities/product_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/product_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductUsecase {
  Future<Result<List<ProductEntity>, CustomException>> call();
}

class ProductUseCaseImpl implements ProductUsecase {
  final ProductRepository categoryRepository;

  ProductUseCaseImpl({
    required this.categoryRepository,
  });

  @override
  Future<Result<List<ProductEntity>, CustomException>> call() {
    return categoryRepository.fetchProducts().map((success) => success);
  }
}
