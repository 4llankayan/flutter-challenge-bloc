import 'package:flutter_challenge/app/domain/entities/user_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/auth_repository.dart';
import 'package:flutter_challenge/app/infra/datasource/auth_datasource.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource authDatasource;

  AuthRepositoryImpl({
    required this.authDatasource,
  });

  @override
  Future<Result<UserEntity, CustomException>> login(String email, String password) async {
    try {
      final body = {
        'email': email,
        'password': password,
      };

      final result = await authDatasource.login(body);

      return Result.success(UserEntity.fromMap(result));
    } on CustomException catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<Map<String, dynamic>, CustomException>> register(UserEntity user) async {
    try {
      final body = user.toMap();
      final result = await authDatasource.register(body);

      return Result.success(result);
    } on CustomException catch (e) {
      return Result.failure(e);
    }
  }
}
