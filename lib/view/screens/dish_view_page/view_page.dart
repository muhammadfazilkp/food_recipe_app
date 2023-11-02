import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/model/recipe.dart';

class DishViewPage extends StatelessWidget {
  final FoodRecipe recipe;
  // ignore: use_key_in_widget_constructors

  const DishViewPage({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final paddingGap = (width - 150) / 2;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  color: Colors.white,
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                Positioned(
                  bottom: 0,
                  left: paddingGap,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(recipe.photo),
                            fit: BoxFit.cover)),
                    height: 150,
                    width: 150,
                  ),
                )
              ],
            ),
          ],
        ),
        box,
        Text(
          recipe.foodName,
          style: text,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recipe.description,
            style: detail,
          ),
        ),
        box,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 206, 138, 153),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  box,
                  const Icon(CupertinoIcons.time),
                  Text(recipe.timeRequired)
                ],
              ),
            ),
            boxw,
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 128, 137, 201),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  box,
                  const Icon(CupertinoIcons.pano),
                  Text(recipe.level)
                ],
              ),
            ),
            boxw,
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 223, 162),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  box,
                  const Icon(CupertinoIcons.flame),
                  Text('calories${recipe.calories}')
                ],
              ),
            ),
          ],
        ),
        box,
        Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
              child: Text(
                'Ingredients',
                style: categori,
              ),
            )),
        box,
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipe.foodIngredients.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      recipe.foodIngredients[index],
                      style: detail,
                    )),
              );
            }),
        box,
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'Steps',
              style: text,
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipe.steps.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(7.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Text(
                        '.)${recipe.steps[index]}',
                        style: detail,
                      ),
                    ],
                  ),
                ),
              );
            })
      ],
    ));
  }
}
