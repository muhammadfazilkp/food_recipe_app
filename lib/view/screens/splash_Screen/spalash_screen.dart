import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/view/screens/home_screen/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<GetRecipeProvider>(context, listen: false).fetchRecipes();
    navigator(context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/pizza-toppings-pile-composition_1284-26412.jpg'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '4K + Premeum food Recipes',
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Text(
                'Cook Like A Chef',
                style: GoogleFonts.poppins(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(5, 0, 5, 75),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 50,
            //     child: ElevatedButton(
            //         onPressed: () {
            //           Navigator.of(context).push(MaterialPageRoute(
            //               builder: (context) => HomeScreen()));
            //         },
            //         style: const ButtonStyle(
            //           backgroundColor: MaterialStatePropertyAll(
            //               Color.fromARGB(255, 208, 72, 63)),
            //         ),
            //         child: Text(
            //           'Let it GO',
            //           style: GoogleFonts.poppins(color: Colors.white),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Future<void> navigator(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen())));
  }
}
