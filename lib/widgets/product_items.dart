import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarant/consts/provider.dart';

// ignore: must_be_immutable
class ProductItemPage extends StatefulWidget {
  final meal;
  int index;
   ProductItemPage(this.meal, this.index, {super.key});

  @override
  State<ProductItemPage> createState() => _ProductItemPageState();
}

class _ProductItemPageState extends State<ProductItemPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
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
                  color: Color(widget.meal.bannerColor),
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
                        Text(widget.meal.type),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(widget.meal.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Color(0xff1E2022))),
                     const  Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          "cost".tr(),
                          style:
                             const  TextStyle(fontSize: 17, color: Color(0xff1E2022)),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.meal.cost.toString(),
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
                              widget.meal.time,
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
                             widget. meal.ingCount.toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                  
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ 
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Image.asset('assets/plus.png'),
                        ),
                        FloatingActionButton.extended(
                        backgroundColor:Color(0xff175B8F),


                          label: Text("more".tr(), style: TextStyle(color: Colors.white, ),),
                          
                          
                          onPressed: (){
                            setState(() {
                             final mainProvider = Provider.of<MainProvider>(context, listen: false);
                             mainProvider.isItemSelected(true);
                              mainProvider.selectedItemIndex(widget.index);
                            });
                          },)
                        // InkWell(
                        //   child: SizedBox(
                        //     height: 40,
                        //     child: Image.asset("assets/buttoncha.png"),
                        //   ),
                        //   onTap: (){
                        //     setState(() {
                        //       isSlected=true;
                        //       selectedItemIndex=index;
                        //     });
                        //   },
                        // )
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
            width: 136,
            child: Image.asset(widget.meal.imageUrl),
          ),
        ],
      ),
    );
}}