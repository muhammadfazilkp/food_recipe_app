import 'package:flutter/material.dart';

class CustomFieldProvider extends ChangeNotifier {
  TextEditingController foodnameControler = TextEditingController();
  TextEditingController discriptionCntrler = TextEditingController();
  TextEditingController foodIngrediants = TextEditingController();
  TextEditingController steps = TextEditingController();
  TextEditingController levelContrler = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController calories = TextEditingController();

  List<String> hintText = [
    "Foodname",
    "Discription",
    "level",
    "timeRequired",
    "calories"
  ];

  List<String> ingreadience = [];

  addingreadience(String value) {
    ingreadience.add(value);
    foodIngrediants.text = '';
    notifyListeners();
  }

  List<String> step = [];
  cookingStep(String valu) {
    step.add(valu);
    steps.text = '';
    notifyListeners();
  }
}
