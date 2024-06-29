import 'package:flutter_challenge/app/domain/entities/user_entity.dart';
import 'package:flutter_challenge/app/domain/error/errors.dart';
import 'package:flutter_challenge/app/domain/repositories/auth_repository.dart';
import 'package:result_dart/result_dart.dart';

abstract class RegisterUsecase {
  Future<Result<Map<String, dynamic>, CustomException>> call(UserEntity user);
}

@override
class RegisterUsecaseImpl implements RegisterUsecase {
  final AuthRepository authRepository;

  RegisterUsecaseImpl({
    required this.authRepository,
  });

  @override
  Future<Result<Map<String, dynamic>, CustomException>> call(UserEntity user) {
    return authRepository.register(user);
  }
}
