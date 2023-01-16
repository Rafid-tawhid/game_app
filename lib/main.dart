import 'package:flutter/material.dart';
import 'package:game_app/pages/dragons_de_page.dart';
import 'package:game_app/pages/launcher_page.dart';
import 'package:game_app/pages/minus_page.dart';
import 'package:game_app/pages/plus_page.dart';
import 'package:game_app/pages/practice_home.dart';
import 'package:game_app/pages/story_page.dart';

import 'pages/division_page.dart';
import 'pages/multiply_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angelica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: DivisionPage.routeName,
      routes: {
        LauncherPage.routeName:(context)=>const LauncherPage(),
        StoryPage.routeName:(context)=>const StoryPage(),
        DragonsDenPage.routeName:(context)=>const DragonsDenPage(),
        PracticePage.routeName:(context)=>const PracticePage(),
        PlusPage.routeName:(context)=>const PlusPage(),
        MinusPage.routeName:(context)=>const MinusPage(),
        MultiplicationPage.routeName:(context)=>const MultiplicationPage(),
        DivisionPage.routeName:(context)=>const DivisionPage(),
      },
    );
  }
}

