import 'dart:convert';

import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  @override
  List<Object> get props => [id, name];

  // after this can be another file (adapter)

  CategoryEntity copyWith({
    int? id,
    String? name,
  }) {
    return CategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory CategoryEntity.fromMap(Map<String, dynamic> map) {
    return CategoryEntity(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryEntity.fromJson(String source) => CategoryEntity.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryEntity(id: $id, name: $name)';
}
