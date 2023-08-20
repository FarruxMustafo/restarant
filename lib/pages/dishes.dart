import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';
import 'package:restarant/pages/details.dart';

class DishesPage extends StatefulWidget {
  const DishesPage({super.key});

  @override
  State<DishesPage> createState() => _DishesPageState();
}

class _DishesPageState extends State<DishesPage> {
  bool isSlected = false;
  int selectedItemIndex=0;
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        isSlected?
        setState(() {
          isSlected=false;

        }):
        exit(0);
     return Future(() => false);

        
      },
      child: isSlected
          ? DetailsPage(selectedItemIndex)
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.builder(
                      itemCount: meals.length,
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisExtent: 350,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return card(meals[index], context, index);
                      }),
                ),
              ),
            ),
    );
  }

  Widget card(Meal meal, contex, index) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 48,
            child: Container(
              decoration: BoxDecoration(
                  color: Color(meal.bannerColor),
                  borderRadius: BorderRadius.circular(20)),
              height: 360,
              width: 230,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 48,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 25,
                          width: 2,
                          color: const Color(0xff00195C),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(meal.type),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(meal.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff1E2022))),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Narxi:",
                          style:
                              TextStyle(fontSize: 17, color: Color(0xff1E2022)),
                        ),
                        Row(
                          children: [
                            Text(
                              meal.cost.toString(),
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xff1E2022)),
                            ),
                            Text(
                              " So'm",
                              style: TextStyle(
                                  fontSize: 17, color: Color(0xff1E2022)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/travel.png")),
                            Text(
                              meal.time,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/qalampir.png")),
                            Text(
                              meal.ingCount.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/plus.png'),
                        ),
                        InkWell(
                          child: SizedBox(
                            height: 40,
                            child: Image.asset("assets/buttoncha.png"),
                          ),
                          onTap: (){
                            setState(() {
                              isSlected=true;
                              selectedItemIndex=index;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -20,
            right: -20,
            height: 140,
            width: 140,
            child: Image.asset(meal.imageUrl),
          ),
        ],
      ),
    );
  }
}
