import 'package:flutter/material.dart';
import 'package:food_recipe_app/controller/recipe/recipe_provider.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/view/screens/dish_view_page/view_page.dart';
import 'package:food_recipe_app/view/screens/home_screen/widget/categori.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "Breakfast",
    "Lunch",
    "Dinner",
    "Snacks",
    "Dessert",
    "Drinks",
    "Vegetarian"
  ];

  @override
  void initState() {
    Provider.of< GetRecipeProvider>(context,listen: false).fetchRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: 'Search Recipe...'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Categories',
                    style: detail,
                  )),
            ),
            CategoriWidget(
              categories: categories,
            ),
            // const SizedBox(
            //   height: 30,
            // ),
            Consumer<GetRecipeProvider>(
              builder:(context, value, child) =>  Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2),
                    itemCount:value.recipes.length ,
                     itemBuilder:(context, index) {
                      final data=value.recipes[index];
                       return  InkWell(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DishViewPage())),
                        child: Card(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 110,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      data.foodName,
                                      style: categori,
                                    ),
                                    Text(
                                      data.timeRequired,
                                      style: detail,
                                    ),
                                    Text(
                                      data.level,
                                      style: detail,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                     
                     },)
                  //  GridView(
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //       crossAxisCount: 2,
                  //       mainAxisSpacing: 10,
                  //       crossAxisSpacing: 20),
                  //   scrollDirection: Axis.vertical,
                  //   children: [
                  //     InkWell(
                  //       onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DishViewPage())),
                  //       child: Card(
                  //         child: SingleChildScrollView(
                  //           child: Column(
                  //             children: [
                  //               Container(
                  //                 height: 110,
                  //                 width: double.infinity,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.amber,
                  //                   borderRadius: BorderRadius.circular(10),
                  //                 ),
                  //               ),
                  //               Column(
                  //                 children: [
                  //                   Text(
                  //                     'Tuna Tarate',
                  //                     style: categori,
                  //                   ),
                  //                   Text(
                  //                     '40 mins|4.2',
                  //                     style: detail,
                  //                   ),
                  //                   Text(
                  //                     'Medium',
                  //                     style: detail,
                  //                   ),
                  //                   const SizedBox(
                  //                     height: 5,
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Card(
                  //       child: SingleChildScrollView(
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               height: 110,
                  //               width: double.infinity,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.amber,
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Text(
                  //                   'Tuna Tarate',
                  //                   style: categori,
                  //                 ),
                  //                 Text(
                  //                   '40 mins|4.2',
                  //                   style: detail,
                  //                 ),
                  //                 Text(
                  //                   'Medium',
                  //                   style: detail,
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 5,
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Consumer<GetRecipeProvider>(
                  //       builder:(context, value, child) => Card(
                  //         child: Column(
                  //           children: [
                  //             Container(
                  //               height: 110,
                  //               width: double.infinity,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.amber,
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //             ),
                  //             Column(
                  //               children: [
                  //                 Text(
                  //                   value.recipes[i],
                  //                   style: categori,
                  //                 ),
                  //                 Text(
                  //                   '40 mins|4.2',
                  //                   style: detail,
                  //                 ),
                  //                 Text(
                  //                   'Medium',
                  //                   style: detail,
                  //                 ),
                  //                 const SizedBox(
                  //                   height: 5,
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     // Add more Card widgets
                  //     // Add more Card widgets similarly
                  //   ],
                  // ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
