import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marquee/marquee.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok/features/videos/widgets/video_button.dart';
import 'package:tiktok/features/videos/widgets/video_comments.dart';
import 'package:tiktok/generated/l10n.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../constants/gaps.dart';
import '../../../constants/sizes.dart';

const keywords = [
  "tag1",
  "tag2",
  "tag3",
  "tag4",
  "tag5",
  "tag6",
  "tag7",
  "tag8",
  "tag9",
];

class VideoPost extends ConsumerStatefulWidget {
  final Function onVideoFinished;
  final VideoModel videoData;
  final int index;

  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
    required this.videoData,
  });

  @override
  VideoPostState createState() => VideoPostState();
}

class VideoPostState extends ConsumerState<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _videoPlayController;

  final Duration _animationDuration = const Duration(milliseconds: 300);

  late final AnimationController _animationController;

  bool _isPaused = false;
  bool _isMoreTagsShowed = false;

  final Iterable<String> _tags = keywords.map((tag) => "#$tag");

  late final String _tagString;

  void _onVideoChange() {
    if (_videoPlayController.value.isInitialized) {
      if (_videoPlayController.value.duration ==
          _videoPlayController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayController = VideoPlayerController.asset(
        "assets/videos/pexels-matthias-groeneveld.mp4");

    await _videoPlayController.initialize();
    await _videoPlayController.setLooping(true);
    // kIsWeb은 이 앱이 웹에서 작동하도록 compile 되어있는지를 나타내는 constant이다
    if (kIsWeb) {
      await _videoPlayController.setVolume(0);
    }
    _videoPlayController.addListener(_onVideoChange);
    setState(() {});
  }

  void _onSeeMoreClick() {
    setState(() {
      _isMoreTagsShowed = !_isMoreTagsShowed;
    });
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _tagString = _tags.reduce((value, element) => "$value $element");

    _animationController = AnimationController(
      // vsync는 offscreen 애니메이션의 불필요한 리소스 사용을 막는다
      // 위젯이 보지 않을 때는 애니메이션이 작동하지 않음
      // vsync는 애니메이션 재생을 도와주고 위젯이 위젯 tree에 있을 때만 Ticker를 유지해준다
      // 만약 애니메이션 controller가 여러개 있다면 TickerProviderStateMixin를 사용하면 된다
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayController.dispose();
    _animationController.dispose();

    super.dispose();
  }

  void _onPlaybackConfigChanged() {
    if (!mounted) return;

    if (ref.watch(playbackConfigProvider).muted) {
      _videoPlayController.setVolume(0);
    } else {
      _videoPlayController.setVolume(1);
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    // 모든 Statefull Widget에는 mounted라는 프로퍼티가 있다.
    // mounted 프로퍼티는 Widget이 mount 되었는지 아닌지 알려준다.
    // 만약 mounted되지 않았다면, 사용자들에게 더 이상 보이지 않는다.
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayController.value.isPlaying) {
      if (ref.watch(playbackConfigProvider).autoplay) {
        _videoPlayController.play();
      }
    }

    if (_videoPlayController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (_videoPlayController.value.isPlaying) {
      _videoPlayController.pause();
      _animationController.reverse();
    } else {
      _videoPlayController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentsTap(BuildContext context) async {
    if (_videoPlayController.value.isPlaying) {
      _onTogglePause();
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const VideoComments(),
    );
    _onTogglePause();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          // Positioned 위젯은 stack안에서 원하는 위치에 위젯을 넣을수 있다
          Positioned.fill(
            child: !_videoPlayController.value.isInitialized
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
          Positioned.fill(
            child: IgnorePointer(
              child: Center(
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationController.value,
                      child: child,
                    );
                  },
                  child: AnimatedOpacity(
                    duration: _animationDuration,
                    opacity: _isPaused ? 1 : 0,
                    child: const FaIcon(
                      FontAwesomeIcons.play,
                      color: Colors.white,
                      size: Sizes.size56,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 40,
            child: IconButton(
              icon: FaIcon(
                ref.watch(playbackConfigProvider).muted
                    ? FontAwesomeIcons.volumeOff
                    : FontAwesomeIcons.volumeHigh,
                color: Colors.blue.shade600,
              ),
              onPressed: _onPlaybackConfigChanged,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "@${widget.videoData.creator}",
                  style: const TextStyle(
                    fontSize: Sizes.size20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v10,
                Text(
                  widget.videoData.description,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Gaps.v10,
                SizedBox(
                  width: 300,
                  child: _isMoreTagsShowed
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              _tagString,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: _onSeeMoreClick,
                              child: const Text(
                                "Folded",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Flexible(
                              child: Text(
                                _tagString,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: _onSeeMoreClick,
                              child: const Text(
                                "See more",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: Sizes.size16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                ),
                Gaps.v10,
                Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.music,
                      size: 16,
                      color: Colors.white,
                    ),
                    Gaps.h8,
                    SizedBox(
                      width: 200,
                      height: 16,
                      child: Marquee(
                        text:
                            "This text is to long to be shown in just on line",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size16,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                // CircleAvatar는 이미지가 들어있는 원을 제공한다
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  foregroundImage: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/tiktok-cool-project-abc.appspot.com/o/avatars%2F${widget.videoData.creatorUid}?alt=media",
                  ),
                  child: Text(widget.videoData.creator),
                ),
                Gaps.v20,
                VideoButton(
                  icon: FontAwesomeIcons.solidHeart,
                  text: S.of(context).likeCount(widget.videoData.likes),
                ),
                Gaps.v20,
                GestureDetector(
                  onTap: () => _onCommentsTap(context),
                  child: VideoButton(
                    icon: FontAwesomeIcons.solidComment,
                    text: S.of(context).commentCount(widget.videoData.comments),
                  ),
                ),
                Gaps.v20,
                const VideoButton(
                  icon: FontAwesomeIcons.share,
                  text: "Share",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
