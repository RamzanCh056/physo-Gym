import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class VideoPlay extends StatefulWidget {
  String? pathh;

  @override
  _VideoPlayState createState() => _VideoPlayState();

  VideoPlay({
    Key? key,
    this.pathh, // Video from assets folder
  }) : super(key: key);
}

class _VideoPlayState extends State<VideoPlay> {
  ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  VideoPlayerController? controller;
  late Future<void> futureController;
  ChewieController? chewieController;

  initVideo() {
    controller = VideoPlayerController.network(widget.pathh!);

    futureController = controller!.initialize();
  }
  @override
  void initState() {
    initVideo();
    chewieController = ChewieController(
      videoPlayerController: controller!,

      //  aspectRatio: controller!.value.size.aspectRatio,
      aspectRatio: controller!.value.aspectRatio,
      autoPlay: false,
      looping: true,
      materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          bufferedColor: Colors.blue,
          //  backgroundColor: Colors.green,
          handleColor: Colors.red
      ),);
    controller!.addListener(() {
      if (controller!.value.isInitialized) {
        currentPosition.value = controller!.value;
      }
      //setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    chewieController!.dispose();
    super.dispose();
  }
  void soundToggle() {
    setState(() {
      isMusicOn == true
          ? controller!.setVolume(0.0)
          : controller!.setVolume(1.0);
      isMusicOn = !isMusicOn;
    });}
  bool isMusicOn = true;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: const CircularProgressIndicator());
        } else {
          return Container(

              height:
              //350,
              controller!.value.size.height
                  >400? 300:controller!.value.size.height,
              width:   controller!.value.size.width,
              //double.infinity,
              child: Chewie( controller: chewieController!,

              )

          );
        }
      },
    );
  }
}