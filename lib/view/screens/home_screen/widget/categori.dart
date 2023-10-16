import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/text_style.dart';

class CategoriWidget extends StatelessWidget {
  final List<String> categories;

  CategoriWidget({required this.categories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return CategoryItem(name: category);
        }).toList(),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;

  CategoryItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 100,
      // Adjust the width as needed
      margin: const EdgeInsets.all(8.0),
      // Add some spacing between categories
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          name,
          style: text,
        ),
      ),
    );
  }
}
