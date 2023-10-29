import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/custome_provider/custom.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:provider/provider.dart';

import 'view/screens/splash_Screen/spalash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GetRecipeProvider()),
        ChangeNotifierProvider(create: (context)=> CustomFieldProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
