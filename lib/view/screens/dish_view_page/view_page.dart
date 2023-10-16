import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/text_style.dart';

class DishViewPage extends StatelessWidget {
  const DishViewPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final paddingGap = (width - 150) / 2;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [ 
            Stack(
              children: [
                Container(
                  height: 350,
                  color: Colors.white,
                ),
                Container(
                  height: 300,
                  color: Colors.red,
                ),
                Positioned(
                  bottom: 0,
                  left: paddingGap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    height: 150,
                    width: 150,
                  ),
                )
              ],
            ),
          ],
        ),
        box,
        Text(
          'Hot Dog |4.6',
          style: text,
        ),
        Text(
          'A classic American favorite,HotDogalasndlfkasjdflkjasldkasjlkajdksjfkasjf;asfjasj',
          style: detail,
        ),
        box,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: const  Color.fromARGB(255, 206, 138, 153),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  box,
                  Icon( CupertinoIcons.time ),
                  Text('40 Mins')
                ],
              ),
            ),
            boxw,
            Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                  color: const  Color.fromARGB(255, 128, 137, 201),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  box,
                  Icon(   CupertinoIcons.delete ),
                  Text('Medium')
                ],
              ),
            ),
            boxw,
             Container(
              height: 80,
              width: 90,
              decoration: BoxDecoration(
                  color: const  Color.fromARGB(255, 224, 223, 162),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  box,
                  Icon(  CupertinoIcons.flame    ),
                  Text('420 cal')
                ],
              ),
            ),
            
          ],
          
        )
        ,
        box,
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
            child: Text('Ingredients',style: categori,),
          )),
          box,
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('. Hot Dog Buns',style: detail,)),
          ),
          box,
           Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('. Hot Dog Buns',style: detail,)),
          ),
          box,
             
              Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('. Hot Dog Buns',style: detail,)),
          ),
            box,
              Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('. Hot Dog Buns',style: detail,)),
          ),
          box,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Steps',style: text,),
            )),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: [
                  Text('1) akasjdfkasjdfkasjdfkdsjfdjkfhdsjfhdhfjdhkjhjkvkjvbksjdvkjdkjfjkdkjfkjdshfkjdsh/nsdfhihisuhfdishishf',style: detail,),
                   Text('2) akasjdfkasjdfkasjdfkdsjfdjkfhdsjfhdhfjdhkjhjkvkjvbksjdvkjdkjfjkdkjfkjdshfkjdsh/nsdfhihisuhfdishishf',style: detail,),
                    Text('3) akasjdfkasjdfkasjdfkdsjfdjkfhdsjfhdhfjdhkjhjkvkjvbksjdvkjdkjfjkdkjfkjdshfkjdsh/nsdfhihisuhfdishishf',style: detail,),
                ],
              ),
            )
             
              
          
          
      ],
    
    )
    );
  }
}
