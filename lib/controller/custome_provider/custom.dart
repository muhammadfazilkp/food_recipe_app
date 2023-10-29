import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomFieldProvider extends ChangeNotifier {
  TextEditingController foodnameControler = TextEditingController();
  TextEditingController discriptionCntrler = TextEditingController();
  TextEditingController foodIngrediants = TextEditingController();
  TextEditingController steps = TextEditingController();
  TextEditingController levelContrler = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController calories = TextEditingController();

  //picking the food images
  File? profileImage;

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

  Future<void> getphoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      File file = File(photo.path);

      profileImage = file;
      notifyListeners();
    }
  }
}
