import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/sizes.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost> {
  final VideoPlayerController _videoPlayController =
      VideoPlayerController.asset("assets/videos/mute-house.mp4");

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
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayController.value.isPlaying) {
      _videoPlayController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayController.value.isPlaying) {
      _videoPlayController.pause();
    } else {
      _videoPlayController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
            child: _videoPlayController.value.isInitialized
                ? VideoPlayer(_videoPlayController)
                : Container(
                    color: Colors.black,
                  ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: _onTogglePause,
            ),
          ),
          const Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: FaIcon(
                  FontAwesomeIcons.play,
                  color: Colors.white,
                  size: Sizes.size56,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
