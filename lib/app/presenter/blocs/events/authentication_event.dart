abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class RegisterUser extends AuthenticationEvent {
  final String name;
  final String email;
  final String password;

  const RegisterUser(this.name, this.email, this.password);

  @override
  List<Object> get props => [name, email, password];
}

class LogoffUser extends AuthenticationEvent {}
