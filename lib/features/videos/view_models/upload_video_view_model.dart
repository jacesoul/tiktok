import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _videoRepository;

  @override
  FutureOr<void> build() {
    _videoRepository = ref.watch(videosRepositoryProvider);
  }

  Future<void> uploadVideo(File video) async {
    final user = ref.read(authRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final task = await _videoRepository.uploadVideoFile(
        video,
        user!.uid,
      );
      if (task.metadata != null) {
        // await _videoRepository.saveVideo();
      }
    });
  }
}
