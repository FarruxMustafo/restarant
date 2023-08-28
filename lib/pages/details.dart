import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';

class DetailsPage extends StatelessWidget {
  final int selectedItemIndex;
  const DetailsPage(this.selectedItemIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Color(0xff2A5270),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage("assets/detailfon.png"))),
      child: myBody(),
    );
  }

  Widget myBody() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 70, right: 30),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          details(mealsUz[selectedItemIndex]),
          Positioned(
            top: -80,
            right: -40,
            child: Image.asset(
              mealsUz[selectedItemIndex].imageUrl,
              width: 220,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget details(Meal meal) {
    return  Padding(
      padding: const  EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(height: 120,),
         Text(
            meal.name.tr(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          
          ),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            
            children: [
              Row(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/travel.png")),
                           const  Text(
                                " 12 k",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                         Row(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/travel.png")),
                          const   Text(
                                " 12 kal",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                         Row(
                          children: [
                            SizedBox(
                                height: 24,
                                width: 24,
                                child: Image.asset("assets/travel.png")),
                           const  Text(
                              " 12 kal",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
          ],),
          const SizedBox(height: 10,),
          Text(
            textAlign:TextAlign.left ,
            mealsUz[selectedItemIndex].details,
            style: TextStyle(height: 1.4),
            
            )
        ],
      ),
    );
  }
}
