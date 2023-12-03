import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/repos/videos_repo.dart';

class TimelineViewModel extends AsyncNotifier<List<VideoModel>> {
  late final VideosRepository _videoRepository;
  List<VideoModel> _list = [];

  @override
  FutureOr<List<VideoModel>> build() async {
    _videoRepository = ref.read(videosRepositoryProvider);
    final result = await _videoRepository.fetchVideos();

    final newList = result.docs.map(
      (doc) => VideoModel.fromJson(doc.data()),
    );

    _list = newList.toList();
    return _list;
  }
}

final timelineViewModelProvider =
    AsyncNotifierProvider<TimelineViewModel, List<VideoModel>>(
  () => TimelineViewModel(),
);
