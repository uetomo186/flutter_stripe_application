import 'package:flutter/foundation.dart';

class Category extends Equarable {
  final String id;
  final String name;
  final String? description;
  final String imageUrl;

  const Category({
    required this.id,
    required this.name,
    this.description,
    required this.imageUrl,
  });
}

factory Category.fromJson(Map<String, dynamic> json) {
  return Category(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    imageUrl: json['imageUrl'] ?? '',
  );
}

@override
List<Object?> get props => [id, name, description, imageUrl];
static const categories = [];
