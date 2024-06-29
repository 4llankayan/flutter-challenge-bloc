import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenge/app/domain/entities/user_entity.dart';
import 'package:flutter_challenge/app/domain/usecases/login_usecase.dart';
import 'package:flutter_challenge/app/domain/usecases/register_usercase.dart';
import 'package:flutter_challenge/app/presenter/blocs/events/authentication_event.dart';
import 'package:flutter_challenge/app/presenter/blocs/states/authentication_state.dart';
import 'package:result_dart/result_dart.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;

  AuthenticationBloc(this.registerUsecase, this.loginUsecase) : super(AuthenticationInitialState());

  @override
  AuthenticationState get initialState => AuthenticationInitialState();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationState currentState,
    AuthenticationEvent event,
  ) async* {
    if (event is RegisterUser) {
      yield AuthenticationLoadingState(isLoading: true);

      try {
        final UserEntity userEntity =
            UserEntity(name: event.name, email: event.email, password: event.password);
        final Map<String, dynamic> userData = await registerUsecase.call(userEntity).getOrThrow();

        final UserEntity user = UserEntity.fromMap(userData);

        yield AuthenticationSuccessState(user);
      } catch (e) {
        yield AuthenticationFailureState('create user failed');

        if (kDebugMode) print(e);
      }

      yield AuthenticationLoadingState(isLoading: false);
    }
  }
}
