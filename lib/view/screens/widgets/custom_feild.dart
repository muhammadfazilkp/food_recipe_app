import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/custome_provider/custom.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  CustomFieldProvider feild = CustomFieldProvider();

  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 60,
        width: 400,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              labelText: hintText, border: const OutlineInputBorder()),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $hintText';
            } else if (value == "") {
              return 'Please enter $hintText';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
