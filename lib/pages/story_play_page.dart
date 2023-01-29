import 'dart:async';

import 'package:animated_widgets/widgets/rotation_animated.dart';
import 'package:animated_widgets/widgets/shake_animated_widget.dart';
import 'package:flutter/material.dart';
import 'package:game_app/pages/dashboard_page.dart';
import 'package:video_player/video_player.dart';

class VideoplayerPage extends StatefulWidget {
  static const String routeName='/video';
  const VideoplayerPage({Key? key}) : super(key: key);

  @override
  State<VideoplayerPage> createState() => _VideoplayerPageState();
}

class _VideoplayerPageState extends State<VideoplayerPage> {

  late VideoPlayerController _controller;
  bool _isPlaying = false;
  Duration? _duration;
  Duration? _position;
  bool _isEnd = false;
  @override
  void initState() {
    super.initState();
    super.initState();
    _controller = VideoPlayerController.asset(
        'svg/story.mp4', )
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
    print('${_controller.dataSource.length}');

  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: _controller.value.isInitialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                        : Container(),
                  ),
                  _isPlaying?Text(''):Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 0),
                      child: ShakeAnimatedWidget(
                        enabled: true,
                        duration: Duration(milliseconds: 1000),
                        shakeAngle: Rotation.deg(x: 25,),
                        curve: Curves.decelerate,
                        //update this boolean to forward/reverse the animation
                        child: Center(
                          child: Align(
                            alignment: Alignment.center,
                            child: MaterialButton(

                              textColor: Colors.white,
                              splashColor: Colors.greenAccent,
                              elevation: 8.0,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/btn_video.png',),
                                      fit: BoxFit.contain,filterQuality: FilterQuality.high),
                                ),

                              ),
                              // ),
                              onPressed: () {


                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) => HomePage(),
                                //     ));
                                Navigator.pushNamed(context, DashboardPage.routeName);
                                // print(_registerProvider.nameList[0].toString());
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      );


  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
