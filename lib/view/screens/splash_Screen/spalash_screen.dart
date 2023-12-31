import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/view/screens/bottom_nav/bottom_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigator(context);
    Provider.of<GetRecipeProvider>(context,listen: false).fetchRecipes();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/pizza-toppings-pile-composition_1284-26412.jpg'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '4K + Premium Food Recipes',
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.pink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Cook Like A Chef',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> navigator(BuildContext context) async {
    // Delay for 3 seconds
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => const BottomNavigatonPage()),
            (route) => false));
  }
}
