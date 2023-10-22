import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/model/recipe.dart';
import 'package:http/http.dart' as http;

class GetRecipeProvider extends ChangeNotifier {
  List<FoodRecipe> recipes = []; // List to store multiple FoodRecipe objects

  Future<void> fetchRecipes() async {
    final response = await http.get(Uri.parse(
        'https://food-maker-rcd0rv1d8-arjun2628s-projects.vercel.app'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      // Convert the list of JSON objects to a list of FoodRecipe objects
      recipes =
          jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
      notifyListeners();
    } else {
      // Handle the error case
      throw Exception('Failed to load data');
    }
  }

  postRecipes(Map<String, dynamic> post) async {
    final body = jsonEncode({
      "foodName": post['foodName'],
      'description': post['description'],
      'photo': post['photo'],
      'foodIngredients': post['foodIngredients'],
      'steps': post['steps'],
      'level': post['level'],
      'timeRequired': post['level'],
      'calories': post['calories']
    });
    final response = await http.post(
        Uri.parse(
            'https://food-maker-rcd0rv1d8-arjun2628s-projects.vercel.app/addfood'),
        body: body);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);

      // Convert the list of JSON objects to a list of FoodRecipe objects
      recipes =
          jsonList.map((jsonMap) => FoodRecipe.fromJson(jsonMap)).toList();
      notifyListeners();
    } else {
      // Handle the error case
      throw Exception('Failed to load data');
    }
  }
}
