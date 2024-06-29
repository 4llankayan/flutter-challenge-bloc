import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ProductEntity extends Equatable {
  final String name;
  final String? description;
  final int id, price, categoryId;

  const ProductEntity({
    required this.name,
    this.description,
    required this.id,
    required this.price,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [name, description, id, price, categoryId];

  ProductEntity copyWith({
    String? name,
    ValueGetter<String?>? description,
    int? id,
    int? price,
    int? categoryId,
  }) {
    return ProductEntity(
      name: name ?? this.name,
      description: description != null ? description() : this.description,
      id: id ?? this.id,
      price: price ?? this.price,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'id': id,
      'price': price,
      'category_id': categoryId,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      price: map['price'] ?? '',
      categoryId: map['category_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductEntity.fromJson(String source) => ProductEntity.fromMap(json.decode(source));

  @override
  String toString() =>
      'ProductEntity(name: $name, description: $description, id: $id, price: $price, categoryId: $categoryId)';
}
