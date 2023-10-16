import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/view/screens/home_screen/widget/categori.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
   final List<String> categories = ["Breakfast", "Lunch", "Dinner", "Snacks", "Dessert", "Drinks", "Vegetarian"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Search Recipe...'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories',
                    style: text,
                  )),
            ),
             CategoriWidget( categories: categories,)
          ],
        ),
      ),
    );
  }
}

