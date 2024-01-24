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
