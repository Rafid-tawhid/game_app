import 'package:flutter/material.dart';
import 'package:game_app/pages/dragons_de_page.dart';
import 'package:game_app/pages/launcher_page.dart';
import 'package:game_app/pages/story_page.dart';

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
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName:(context)=>LauncherPage(),
        StoryPage.routeName:(context)=>StoryPage(),
        DragonsDenPage.routeName:(context)=>DragonsDenPage(),
      },
    );
  }
}

