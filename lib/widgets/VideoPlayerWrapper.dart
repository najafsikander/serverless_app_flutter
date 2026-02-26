import 'package:flutter/material.dart';
import 'package:serverless_app/utils/log.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWrapper extends StatefulWidget {
  final String? videoUrl;
  const VideoPlayerWrapper({super.key, required this.videoUrl});

  @override
  State<VideoPlayerWrapper> createState() => _VideoPlayerWrapperState();
}

class _VideoPlayerWrapperState extends State<VideoPlayerWrapper> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    logger.d("URL: ${widget.videoUrl!}");
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
      // ..initialize().then((_) {
      //   setState(() {});
      // });

    await _controller.initialize();

    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }
}
