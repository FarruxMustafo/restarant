import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';



class DetailsPage extends StatelessWidget {
  final int selectedItemIndex;
  const DetailsPage( this.selectedItemIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
height: double.infinity,
      decoration:
         const  BoxDecoration(
           color: color, 
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/detailfon.png"))),
              child: myBody(),
    );
  }







Widget myBody(){
  return Container(
    color: Colors.white,
    margin: EdgeInsets.only(top: 70, right: 40),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(meals[selectedItemIndex].name)],),
        Positioned(
            top: -80,
            right: -40,
           
            
            child: Image.asset(meals[selectedItemIndex].imageUrl,
            width: 240,
            fit: BoxFit.cover,
            
            
            ),
            
          ),
    ],),
  );
}
}