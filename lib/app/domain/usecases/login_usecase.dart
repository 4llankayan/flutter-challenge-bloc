import 'package:flutter_challenge/app/domain/entities/user_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/auth_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class LoginUsecase {
  Future<Result<UserEntity, CustomException>> call(String email, String password);
}

@override
class LoginUsecaseImpl implements LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecaseImpl({
    required this.authRepository,
  });

  @override
  Future<Result<UserEntity, CustomException>> call(String email, String password) {
    return authRepository.login(email, password).map((success) => success);
  }
}
