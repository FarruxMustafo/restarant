import 'package:flutter/material.dart';

import 'package:restarant/pages/dishes.dart';

import 'consts/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedINdex = 0;
List<Widget> pages = [
  DishesPage(),
  DishesPage(),
  DishesPage(),
  DishesPage(),
];
List<Lang> langs = [
  Lang("uz", true),
  Lang("ru", false),
  Lang("eng", false),
];
int isActiveIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Row(
        children: [
          NavigationRail(
            leading: Column(
              children: [
                const SizedBox(
                  height: 164,
                ),
                ToggleButtons(
                  direction: Axis.vertical,
                  renderBorder: false,
                  onPressed: (int index) {
                    setState(() {
                      langs[index].isActive = true;
                    });
                  },
                  isSelected: langs.map((e) => e.isActive).toList(),
                  children: [
                    langButton(langs[0]),
                    langButton(langs[1]),
                    langButton(langs[2])
                  ],
                ),
              ],
            ),
            minWidth: 40,
            onDestinationSelected: (int index) {
              setState(() {
                langs.forEach((element) {
                  element.isActive = false;
                });

                langs[index].isActive=true;
              });
            },
            groupAlignment: 0.7,
            labelType: NavigationRailLabelType.all,
            selectedIndex: _selectedINdex,
            selectedLabelTextStyle:
                const TextStyle(color: Colors.white, fontSize: 20),
            unselectedLabelTextStyle:
                const TextStyle(color: Colors.white70, fontSize: 15),
            backgroundColor: const Color(0xff193B55),
            destinations: const [
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
              NavigationRailDestination(
                  icon: SizedBox(),
                  label: RotatedBox(quarterTurns: -1, child: Text("Блюда"))),
            ],
          ),
          Expanded(child: pages[_selectedINdex]),
        ],
      )),
    );
  }

  Widget langButton(Lang lang) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color:
              lang.isActive ? const Color(0xff206498) : const Color(0xff2A5270),
          borderRadius: const BorderRadius.all(Radius.circular(200))),
      child: Center(
        child: Text(
          lang.name,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
