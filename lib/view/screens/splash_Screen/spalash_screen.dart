import 'package:flutter/material.dart';
import 'package:food_recipe_app/view/screens/home_screen/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 75),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  HomeScreen()));
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 208, 72, 63)),
                    ),
                    child: Text(
                      'Let it GO',
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
