

import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';

class HomeScreen extends StatefulWidget {  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      backgroundColor: color,
      appBar: AppBar(title:Text("Splash Screen Example")),  
      body: Center(  
          child:Stack(
            children: [
              Image.asset("assets/splaw1.png"),
           const    Text("Welcome to Home Page",  
                style: TextStyle( color: Colors.white, fontSize: 30)  
            ),
            ]
          )  
      ),  
    );  
  }  
}   