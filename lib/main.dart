import 'dart:async';


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restarant/consts/consts.dart';
import 'package:restarant/consts/provider.dart';

import 'home_page.dart';

void main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

runApp(EasyLocalization(
    supportedLocales: [
      Locale('en', 'US'),
  
      Locale('uz', 'UZ'),
      Locale('ru', 'RU')
    ],
    path: 'assets/translation',
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LangProvider())
      ],
      
      child: MyApp()),
    
  ));}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      fontFamily: "Manrope",
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true, 
      ),
      home:const  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<MyHomePage> {  
  @override  
  void initState() {  
    super.initState();  
    Timer(const Duration(seconds: 3),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) => const HomeScreen()  
            )  
         )  
    );  
  }  
  @override  
  Widget build(BuildContext context) {  
    return Container(
      
      color:color,
      child: Expanded(
        child: Stack(children: [
          Image.asset("assets/splaw1.png", fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(child: Image.asset("assets/frame.png"),),
          )
          
        ],),
      ),
    );  
  }  }  
