import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/model/recipe.dart';
import 'package:food_recipe_app/view/screens/adding_screen/food_details.dart';
import 'package:food_recipe_app/view/screens/dish_view_page/view_page.dart';
import 'package:food_recipe_app/view/screens/home_screen/home_page.dart';

class BottomNavigatonPage extends StatefulWidget {
  const BottomNavigatonPage({Key? key, }) : super(key: key);

  // final FoodRecipe recipe;

  @override
  State<BottomNavigatonPage> createState() => _BottomNavigatonPageState();
}

class _BottomNavigatonPageState extends State<BottomNavigatonPage> {
  int currentIndex = 0;

  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      HomeScreen(),
      // DishViewPage(recipe: widget.recipe),
      FoodDitailsAddingScreen(),
      // DishViewPage(recipe: widget.recipe)
       // Pass the recipe to DishViewPage
      // Add other pages if needed
    ];
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        child: BottomNavigationBar(
          selectedIconTheme: const IconThemeData(color: Colors.black),
          unselectedItemColor: Colors.white,
          elevation: 30.8,
          mouseCursor: MaterialStateMouseCursor.clickable,
          backgroundColor: Colors.grey[400],
          fixedColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news),
              label: 'Foodies',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'profile',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
