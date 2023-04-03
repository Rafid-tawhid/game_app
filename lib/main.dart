import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_app/pages/dashboard_page.dart';
import 'package:game_app/pages/division_page.dart';
import 'package:game_app/pages/dragons_de_page.dart';
import 'package:game_app/pages/launcher_page.dart';
import 'package:game_app/pages/multiplication_page.dart';
import 'package:game_app/pages/plus_page.dart';
import 'package:game_app/pages/signup_page.dart';
import 'package:game_app/pages/story_game_page.dart';
import 'package:game_app/pages/story_page.dart';
import 'package:game_app/pages/story_play_page.dart';

import 'pages/minus_page.dart';


Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
        LauncherPage.routeName:(context)=>const LauncherPage(),
        DragonsDenPage.routeName:(context)=>const DragonsDenPage(),
        StoryPage.routeName:(context)=>const StoryPage(),
        DashboardPage.routeName:(context)=>const DashboardPage(),
        PlusPage.routeName:(context)=>const PlusPage(),
        MinusPage.routeName:(context)=>const MinusPage(),
        MultiplicationPage.routeName:(context)=>const MultiplicationPage(),
        DivisionPage.routeName:(context)=>const DivisionPage(),
        VideoplayerPage.routeName:(context)=>const VideoplayerPage(),
        SignUpPage.routeName:(context)=>const SignUpPage(),
        StoryGameMode.routeName:(context)=>const StoryGameMode(),

      },
    );
  }
}

