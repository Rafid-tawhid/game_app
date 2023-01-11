import 'dart:async';

import 'package:animated_widgets/widgets/opacity_animated.dart';
import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';

class DragonsDenPage extends StatefulWidget {
  static const String routeName='/den';
  const DragonsDenPage({Key? key}) : super(key: key);

  @override
  State<DragonsDenPage> createState() => _DragonsDenPageState();
}

class _DragonsDenPageState extends State<DragonsDenPage> {
  bool animation = false;
  bool show = true;
  @override
  void initState() {
    Future.delayed(Duration(microseconds: 2000),(){
      setState(() {
        animation=true;
      });
    });
    callLater();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              if(show)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/dragons_den.png",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if(show)Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: width/1.4,
                  padding: EdgeInsets.only(bottom: 30),
                  child: TranslationAnimatedWidget.tween(
                    enabled: animation,
                    duration: const Duration(milliseconds: 1000),
                    translationDisabled: Offset(-300, -100),
                    translationEnabled: Offset(0, 0),
                    child: OpacityAnimatedWidget.tween(
                      enabled: animation,
                      duration: Duration(milliseconds: 3000),
                      opacityDisabled: 0,
                      opacityEnabled: 1,
                      child: Image.asset('images/dens_text.png'),
                    ),
                  ),
                ),
              ),
              if(show==false)Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/level.png",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void callLater() {
    Timer(Duration(seconds: 4), () {
      setState(() {
        show=false;
      });
    });
  }
}
