import 'package:flutter_challenge/app/domain/entities/user_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthRepository {
  Future<Result<UserEntity, CustomException>> login(String email, String password);
  Future<Result<Map<String, dynamic>, CustomException>> register(UserEntity user);
}
