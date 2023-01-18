import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoplayerPage extends StatefulWidget {
  static const String routeName='/video';
  const VideoplayerPage({Key? key}) : super(key: key);

  @override
  State<VideoplayerPage> createState() => _VideoplayerPageState();
}

class _VideoplayerPageState extends State<VideoplayerPage> {

  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    super.initState();
    _controller = VideoPlayerController.asset(
        'svg/story.mp4', )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
    print('${_controller.dataSource.length}');

  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Video Demo',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(

                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     setState(() {
          //       _controller.value.isPlaying
          //           ? _controller.pause()
          //           : _controller.play();
          //     });
          //   },
          //   child: Icon(
          //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          //   ),
          // ),
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
