import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarant/consts/consts.dart';
import 'package:restarant/consts/provider.dart';

import 'package:restarant/pages/details.dart';
import 'package:restarant/widgets/product_items.dart';



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
  final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: (){
        mainProvider.getItemSelected()?
        setState(() {
        mainProvider.isItemSelected(false); 

        }):
        exit(0);
     return Future(() => false);

        
      },
      child: Consumer<MainProvider>(builder: (context, data, child){
        return   SafeArea(
        child: (mainProvider.getItemSelected())
            ? DetailsPage(mainProvider.getItemIndex())
            : LayoutBuilder(builder: (BuildContext context, BoxConstraints constrants){
              return mainUI(constrants);
            },),
      );
      } 
      )
      
      
    
    );
  }
 Widget mainUI(BoxConstraints constraints ){
  print("MaxWight: ${constraints.minWidth}");
 var axis=1;
 var maxWith=constraints.maxWidth;
 if(maxWith<500){
   axis=1;
 }else if((500<maxWith)&&(maxWith<720)){
  axis=2;
 }else if((maxWith>720&& maxWith<1000)){
  axis=3;
 }else{
  axis=4;
 }
  

return Column(
                  children: [
                   Text("title".tr()),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: GridView.builder(
                            itemCount: getMeal().length,
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  
                                    crossAxisCount: axis,
                                    mainAxisExtent: 350,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1),
                            itemBuilder: (BuildContext context, int index) {
                              return ProductItemPage(getMeal()[index],  index);
                            }),
                      ),
                    ),
                  ],
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
