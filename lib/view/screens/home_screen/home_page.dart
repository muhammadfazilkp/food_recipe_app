import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/text_style.dart';
import 'package:food_recipe_app/view/screens/dish_view_page/view_page.dart';
import 'package:food_recipe_app/view/screens/home_screen/widget/categori.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 20),
                  scrollDirection: Axis.vertical,
                  children: [
                    InkWell(
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
                                    'Tuna Tarate',
                                    style: categori,
                                  ),
                                  Text(
                                    '40 mins|4.2',
                                    style: detail,
                                  ),
                                  Text(
                                    'Medium',
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
                    ),
                    Card(
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
                                  'Tuna Tarate',
                                  style: categori,
                                ),
                                Text(
                                  '40 mins|4.2',
                                  style: detail,
                                ),
                                Text(
                                  'Medium',
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
                    Card(
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
                                'Tuna Tarate',
                                style: categori,
                              ),
                              Text(
                                '40 mins|4.2',
                                style: detail,
                              ),
                              Text(
                                'Medium',
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
                    // Add more Card widgets
                    // Add more Card widgets similarly
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
