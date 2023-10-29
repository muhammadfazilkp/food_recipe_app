import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:provider/provider.dart';

class DeleteDialogPage extends StatelessWidget {
  final String foodId;

  const DeleteDialogPage( this.foodId);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Delete Recipe"),
      content:   Text("Are you sure you want to delete this recipe?",style: categori,),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<GetRecipeProvider>(context, listen: false).deleteFood(foodId);
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const  Text('Delete'),
        ),
      ],
    );
  }
}
