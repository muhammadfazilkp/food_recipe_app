import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/custome_provider/custom.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/view/screens/widgets/custom_feild.dart';
import 'package:provider/provider.dart';

class FoodDitailsAddingScreen extends StatelessWidget {
  FoodDitailsAddingScreen({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<CustomFieldProvider>(
          builder: (context, value, child) => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 68,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'select image',
                        style: text,
                      )),
                  Column(
                    children: List.generate(
                      value.hintText.length,
                      (index) => CustomTextFormField(
                          hintText: value.hintText[index],
                          controller: index == 0
                              ? value.foodnameControler
                              : index == 1
                                  ? value.discriptionCntrler
                                  : index == 2
                                      ? value.levelContrler
                                      : index == 3
                                          ? value.timeController
                                          : value.calories),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 30,
                          width: 120,
                          child: TextFormField(
                            controller: value.foodIngrediants,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              value.addingreadience(value.foodIngrediants.text);
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          color: Colors.grey,
                          height: 30,
                          width: 120,
                          child: TextFormField(
                            controller: value.steps,
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            value.cookingStep(value.steps.text);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black45),
                      ),
                    ),
                  ),
                  Consumer<GetRecipeProvider>(
                    builder: (context, get, child) => ElevatedButton(
                        onPressed: () async {
                          if (formkey.currentState!.validate()) {
                            Map<String, dynamic> gett = {
                              "photo": " value.foodnameControler.text",
                              "foodName": value.foodnameControler.text,
                              "description": value.discriptionCntrler.text,
                              "level": value.levelContrler.text,
                              "timeRequired": value.timeController.text,
                              "calories": value.calories.text,
                              "foodIngredients": value.ingreadience,
                              "steps": value.step,
                            };
                            await get.postRecipes(gett);
                            Navigator.pop(context);
                          }
                        },
                        style:  ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.pinkAccent[200])),
                        child: SizedBox(
                            width: double.infinity,
                            height: 30,
                            child: Center(
                                child: Text(
                              'Submit',
                              style: text,
                            )))),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
