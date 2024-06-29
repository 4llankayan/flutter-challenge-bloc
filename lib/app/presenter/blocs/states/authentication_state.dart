import 'package:equatable/equatable.dart';
import 'package:flutter_challenge/app/domain/entities/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {
  final bool isLoading;

  AuthenticationLoadingState({required this.isLoading});
}

class AuthenticationSuccessState extends AuthenticationState {
  final UserEntity user;

  AuthenticationSuccessState(this.user);
  @override
  List<Object> get props => [user];
}

class AuthenticationFailureState extends AuthenticationState {
  final String errorMessage;

  AuthenticationFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
