import 'package:equatable/equatable.dart';

class Category extends Equatable {
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

  factory Category.fromJson(
    Map<String, dynamic> json, {
    String? id,
  }) {
    return Category(
      id: id ?? json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl:
          json['imageUrl'] ?? 'https://source.unsplash.com/random/?fashion',
    );
  }

  @override
  List<Object?> get props => [id, name, description, imageUrl];
}
