

import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';
import 'package:restarant/pages/dishes.dart';


class  HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
  int _selectedINdex =0;
  List <Widget> pages=[
    DishesPage(),
    DishesPage(),
    DishesPage(),
    DishesPage(),

  ];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Row(
              children: [
          NavigationRail(
            minWidth: 50,
            onDestinationSelected: (int index){
              setState(() {
                _selectedINdex=index;
              });
            },
            groupAlignment: 0.5,
            
            labelType: NavigationRailLabelType.all,
            selectedIndex: _selectedINdex,
            selectedLabelTextStyle: const TextStyle(color: Colors.white, fontSize:25),
            unselectedLabelTextStyle: const TextStyle(color: Colors.white70, fontSize: 15),
            backgroundColor: Color(0xff2A5270),
            destinations: const [
              NavigationRailDestination(
                
                icon:Icon(Icons.earbuds_rounded),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                icon:Icon(Icons.earbuds_rounded),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                icon:Icon(Icons.earbuds_rounded),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
                     NavigationRailDestination(
                
              icon:Icon(Icons.earbuds_rounded),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
            ],
          ),
          Expanded(child: pages[_selectedINdex]),
              ],
            )),
    );
  }
}
