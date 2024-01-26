import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_stripe_application/models/category.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = Category.categories;
  List<int> _ectends = [];

  final rnd = Random();

  @override
  void initState() {
    _loadCategory();
    super.initState();
  }

  _loadCategory() async {
    final extents = List<int>.generate(
      categories.length,
      (index) => rnd.nextInt(3) + 2,
    );

    setState(() {
      _ectends = extents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: MasonryGridView.count(
        padding: const EdgeInsets.only(top: 120, left: 4, right: 4),
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 5,
        itemCount: Category.categories.length,
        itemBuilder: (context, index) {
          final height = _ectends[index] * 100;
          return InkWell(
            onTap: () {
              // Navigator.pushNamed(
              //   context,
              //   '/category',
              //   arguments: categories[index],
              // );
            },
            child: Hero(
              tag: categories[index].id,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(categories[index].imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                height: height.toDouble(),
              ),
            ),
          );
        },
      ),
    );
  }
}
