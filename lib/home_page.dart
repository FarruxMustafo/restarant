import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarant/consts/provider.dart';

import 'package:restarant/pages/dishes.dart';

import 'consts/consts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedINdex = 0;
List<Widget> pages = [
  const DishesPage(),
  const DishesPage(),
  const DishesPage(),
  const DishesPage(),
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
            leading: langBuild(),
            minWidth: 60,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedINdex = index;
              });
            },
            groupAlignment: 0.3,
            labelType: NavigationRailLabelType.all,
            selectedIndex: _selectedINdex,
            useIndicator: false,
            selectedLabelTextStyle:
                const TextStyle(color: Colors.white, fontSize: 28),
            unselectedLabelTextStyle:
                const TextStyle(color: Colors.white70, fontSize: 20),
            backgroundColor: const Color(0xff193B55),
            destinations: [
              NavigationRailDestination(
                  indicatorColor: Colors.transparent,
                  icon: const SizedBox(),
                  label:
                      RotatedBox(quarterTurns: -1, child: Text("dishes".tr()))),
              NavigationRailDestination(
                  icon: const SizedBox(),
                  label:
                      RotatedBox(quarterTurns: -1, child: Text("drinks").tr())),
              NavigationRailDestination(
                  icon: const SizedBox(),
                  label:
                      RotatedBox(quarterTurns: -1, child: Text("salads".tr()))),
              NavigationRailDestination(
                  icon: const SizedBox(),
                  label: RotatedBox(
                      quarterTurns: -1, child: Text("fast_food".tr()))),
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

  Widget langBuild() {
    final langProvider = Provider.of<LangProvider>(context, listen: false);

    return Column(
      children: [
        const SizedBox(
          height: 160,
        ),
        ToggleButtons(
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          borderColor: Colors.transparent,
          fillColor: Colors.transparent,
          direction: Axis.vertical,
          renderBorder: false,
          onPressed: (int index) {
            setState(() {
              setState(() {
                for (var element in langs) {
                  element.isActive = false;
                }
                switch (index) {
                  case 0:
                    {
                      var newLocale = Locale("uz", "UZ");
                      context.setLocale(newLocale);
                      langProvider.langChanged();
                      print("UZUZUZ");
                    }
                    break;
                  case 1:
                    {
                      var newLocale = Locale("ru", "RU");
                      context.setLocale(newLocale);
                      langProvider.langChanged();
                    }
                    break;
                  case 2:
                    {
                      context.setLocale(Locale("en", "US"));
                      langProvider.langChanged();
                    }
                    break;
                }
                langs[index].isActive = true;
              });
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
    );
  }
}
