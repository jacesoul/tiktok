import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/videos/models/video_model.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  List<VideoModel> _list = [];

  void uploadVideo() async {
    state = const AsyncValue.loading();

    await Future.delayed(
      const Duration(seconds: 2),
    );

    _list = [
      ..._list,
    ];

    state = AsyncValue.data(_list);
  }

  @override
  FutureOr<List<VideoModel>> build() async {
    await Future.delayed(
      const Duration(seconds: 5),
    );

    return _list;
  }
}

final timelineViewModelProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
