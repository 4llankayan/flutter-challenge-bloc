import 'package:dio/dio.dart';
import 'package:flutter_challenge/app/domain/usecases/login_usecase.dart';
import 'package:flutter_challenge/app/domain/usecases/register_usercase.dart';
import 'package:flutter_challenge/app/external/datasource/auth_datasource.dart';
import 'package:flutter_challenge/app/home/home_page.dart';
import 'package:flutter_challenge/app/infra/repositories/auth_repository.dart';
import 'package:flutter_challenge/app/presenter/blocs/authentication_bloc.dart';
import 'package:flutter_challenge/app/presenter/pages/login/login_page.dart';
import 'package:flutter_challenge/app/presenter/pages/register/register_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(Dio.new);
    i.add(AuthDatasourceImpl.new);
    i.add(AuthRepositoryImpl.new);
    i.add(LoginUsecaseImpl.new);
    i.add(RegisterUsecaseImpl.new);
    i.add(AuthenticationBloc.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.child('/login', child: (context) => const LoginPage());
    r.child('/register', child: (context) => const RegisterPage());
  }
}
