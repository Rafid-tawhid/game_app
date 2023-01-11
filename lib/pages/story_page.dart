import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ezanimation/ezanimation.dart';

import 'dragons_de_page.dart';

class StoryPage extends StatefulWidget {
  static const String routeName='/story';
  const StoryPage({Key? key}) : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  bool _visible=false;
  bool _showText=true;
  bool _showDrag=false;
  EzAnimation ezAnimation = EzAnimation(10.0, 400.0, Duration(seconds: 3));

  @override
  void initState() {

    Future.delayed(Duration(microseconds: 200),(){
      setState(() {
        _visible=!_visible;
      });
      calllater();
    });
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
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/story_intro.png",),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if(_showText)Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                // If the widget is visible, animate to 0.0 (invisible).
                // If the widget is hidden, animate to 1.0 (fully visible).
                opacity: _visible ? 1.0 : 0.0,
                duration:  const Duration(milliseconds: 2000,),
                // The green box must be a child of the AnimatedOpacity widget.
                child:  Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: width/1.1,
                    child: Image.asset('images/story_narration1.png',fit: BoxFit.cover,),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.topCenter,
                child: AnimatedBuilder(
                    animation: ezAnimation,
                    builder: (context, snapshot) {
                      return Container(
                        height: ezAnimation.value,
                        width: width/1.2,
                        child: Image.asset(
                          'images/dragon.png',
                          fit: BoxFit.contain,
                        ),
                      );
                    }
                ),
              ),
            ),
            // TranslationAnimatedWidget.tween(
            //   enabled: animation,
            //   duration: Duration(milliseconds: 1000),
            //   translationDisabled: Offset(300, -300),
            //   translationEnabled: Offset(0, 0),
            //   child: OpacityAnimatedWidget.tween(
            //     enabled: animation,
            //     duration: Duration(milliseconds: 1000),
            //     opacityDisabled: 0,
            //     opacityEnabled: 1,
            //     child: SvgPicture.asset('svg/glo2.svg'),
            //   ),
            // ),




          ],
        ),
      ),
    );
  }

  void calllater() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        _showText=false;
        ezAnimation.start();
      });
    });
    Timer(Duration(seconds: 10),(){
      Navigator.pushNamed(context, DragonsDenPage.routeName);
    });
  }
}
