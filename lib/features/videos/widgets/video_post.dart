import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayController =
      VideoPlayerController.asset("assets/videos/house.mp4");

  void _onVideoChange() {
    if (_videoPlayController.value.isInitialized) {
      if (_videoPlayController.value.duration ==
          _videoPlayController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    await _videoPlayController.initialize();
    _videoPlayController.play();
    setState(() {});

    _videoPlayController.addListener(_onVideoChange);
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayController.dispose();
    super.dispose();

    widget.onVideoFinished();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: _videoPlayController.value.isInitialized
              ? VideoPlayer(_videoPlayController)
              : Container(
                  color: Colors.black,
                ),
        ),
      ],
    );
  }
}
