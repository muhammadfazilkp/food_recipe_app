import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/view/screens/adding_screen/food_details.dart';
import 'package:food_recipe_app/view/screens/dish_view_page/view_page.dart';
import 'package:food_recipe_app/view/screens/home_screen/widget/alertdylog.dart';
import 'package:food_recipe_app/view/screens/home_screen/widget/categori.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Snacks",
    "Dessert",
    "Drinks",
    "Vegetarian"
  ];

  HomeScreen({Key? key}) : super(key: key);

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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade600,
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 0),
                    ]),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Recipe...',
                    ),
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
                  style: detail,
                ),
              ),
            ),
            CategoriWidget(
              categories: categories,
            ),
            Consumer<GetRecipeProvider>(
              builder: (context, value, child) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: value.recipes.length,
                    itemBuilder: (context, index) {
                      final data = value.recipes[index];

                      return InkWell(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return DeleteDialogPage(data.id);
                            },
                          );
                        },
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>   DishViewPage( recipe: data),
                          ),
                        ),
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 110,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(data.photo),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.foodName,
                                        style: categori,
                                      ),
                                      Text(
                                        data.description,
                                        style: detail,
                                      ),
                                      Text(
                                        data.level,
                                        style: detail,
                                      ),
                                      Text(
                                        data.timeRequired,
                                        style: detail,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
