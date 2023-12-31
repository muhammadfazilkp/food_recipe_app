import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/model/recipe.dart';
import 'package:http/http.dart' as http;

class GetRecipeProvider extends ChangeNotifier {
  List<FoodRecipe> recipes = [];
  // List to store multiple FoodRecipe objects

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse(
        'https://food-maker-rcd0rv1d8-arjun2628s-projects.vercel.app'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      recipes =
          jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
      notifyListeners();
    } else {
      // Handle the error case
      throw Exception('Failed to load data');
    }
  }

  Future<void> postRecipes(Map<String, dynamic> post) async {
    final Map<String, dynamic> body = {
      "foodName": post['foodName'],
      'description': post['description'],
      'photo': "path/to/photo.jpg",
      'foodIncrediance': post['foodIngredients'],
      'steps': post['steps'],
      'level': post['level'],
      'timeRequired': post['timeRequired'],
      'calories': post['calories']
    };

    final bodyJson = jsonEncode(body);

    try {
      final response = await http.post(
        Uri.parse(
            "https://food-maker-rcd0rv1d8-arjun2628s-projects.vercel.app/addfood"),
        headers: {
          "Content-Type": "application/json",
        },
        body: bodyJson,
      );

      if (response.statusCode == 200) {
        // ...
        //decoding to the list after can see the users in ui

        final List<dynamic> jsonList = json.decode(response.body);

        recipes =
            jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
        notifyListeners();
      } else {
        print("error");
      }
    } catch (error) {}
  }

  Future<void> deleteFood(String foodId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://food-maker-psi.vercel.app/deletefood/$foodId'),
        // You can also pass any necessary headers or data here if needed
      );

      if (response.statusCode == 200) {
        print('Deletion was successful');
        final List<dynamic> jsonList = json.decode(response.body);

        recipes =
            jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
        notifyListeners();
      } else {
        // Handle the case where the server returns an error
        print('Failed to delete. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions or network issues
      print('Exception during deletion: $e');
    }
  }
}
