import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String name, email, password;
  final String? token;

  const UserEntity({
    required this.name,
    required this.email,
    required this.password,
    this.token,
  });

  @override
  List<Object?> get props => [name, email, token];

  UserEntity copyWith({
    String? name,
    String? email,
    String? password,
    String? token,
  }) {
    return UserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password,
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() => 'UserEntity(name: $name, email: $email, password: $password)';
}
