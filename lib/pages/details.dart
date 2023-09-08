import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarant/consts/consts.dart';
import 'package:restarant/consts/provider.dart';

class DetailsPage extends StatefulWidget {
  final int selectedItemIndex;
  const DetailsPage(this.selectedItemIndex, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
     final langProvider = Provider.of<MainProvider>(context, listen: false);
    return Consumer<MainProvider>(builder: (context, data, child) {
      return Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0xff2A5270),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/detailfon.png"))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: 12, top: 12),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,

                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                   langProvider.isItemSelected(false);

                  },
                )),
            Expanded(child: myBody()),
          ],
        ),
      );
    });
  }

  Widget myBody() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 70, right: 30),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          details(getMeal()[widget.selectedItemIndex]),
          Positioned(
            top: -80,
            right: -40,
            child: Image.asset(
              mealsUz[widget.selectedItemIndex].imageUrl,
              width: 220,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget details(Meal meal) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          const SizedBox(
            height: 120,
          ),
          Text(
            meal.name.tr(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/travel.png")),
                  const Text(
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
                  const Text(
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
                  const Text(
                    " 12 kal",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.left,
            getMeal()[widget.selectedItemIndex].details,
            style: TextStyle(height: 1.4),
          )
        ],
      ),
    );
  }
   List<Meal> getMeal(){
     switch(context.locale.toString()){
   case "uz_UZ":
  
   { print("asadasdasdasd");
      return  mealsUz;
   } 
case "ru_RU":
   {
      return   mealsRu;
   }
   case "en_US":
   {
       return  mealsEn;
   }
   
   default:
  return  mealsRu;
  
    }

    
  }

}
