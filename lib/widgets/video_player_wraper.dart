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
  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeVideoPlayer();
  }

  Future<void> initializeVideoPlayer() async {
    logger.d("URL: ${widget.videoUrl!}");
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl!));
    _isPlaying = false;
    _controller.addListener(_videoListener);

    await _controller.initialize();
    setState(() {});
  }

  void _videoListener() {
    // This function is called whenever the controller's value changes.
    // You can access various properties using _controller.value
    if (_controller.value.isInitialized) {
      // Check if the video has ended
      if (_controller.value.position == _controller.value.duration) {
        _isPlaying = false;
        setState(() {});

        // Perform actions here, e.g., show a 'replay' button
      }
      // You can also check for other states like isPlaying, buffering, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _controller.value.isInitialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  InkWell(child: VideoPlayer(_controller),onTap: (){
                    _isPlaying = false;
                    _controller.pause();
                    setState(() {

                    });
                  },),
                  if (!_isPlaying)
                    Align(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        shape: const CircleBorder(),
                        color: Colors.black54,
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(20),
                        onPressed: () {
                          // Handle button press
                          _controller.play();
                          _isPlaying = true;
                          setState(() {});
                        },
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          size: 50,
                        ),
                      ),
                    )
                  else
                    Container(),

                  if(_isPlaying)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: // The Linear Progress Indicator is used here
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true, // Allows the user to seek
                        colors: const VideoProgressColors(
                          playedColor: Colors.blueAccent,
                          bufferedColor: Colors.grey,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    )
                ],
              ),
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
