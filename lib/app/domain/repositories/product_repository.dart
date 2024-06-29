import 'package:flutter_challenge/app/domain/entities/product_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:result_dart/result_dart.dart';

abstract class ProductRepository {
  Future<Result<List<ProductEntity>, CustomException>> fetchProducts();
}
