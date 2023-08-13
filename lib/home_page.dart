

import 'package:flutter/material.dart';
import 'package:restarant/consts/consts.dart';


class  HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Row(
              children: [
          NavigationRail(
            
            labelType: NavigationRailLabelType.all,
            selectedIndex: 0,
            selectedLabelTextStyle: const TextStyle(color: Colors.white, fontSize:20),
            unselectedLabelTextStyle: TextStyle(color: Colors.white30, fontSize: 15),
            backgroundColor: color,
            destinations: const [
              NavigationRailDestination(
                
                icon:SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                  icon:SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                 icon:SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
            ],
          )
              ],
            ),
        ));
  }
}
