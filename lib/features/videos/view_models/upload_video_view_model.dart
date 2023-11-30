import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok/features/user/view_models/users_view_model.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:tiktok/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _videoRepository;

  @override
  FutureOr<void> build() {
    _videoRepository = ref.watch(videosRepositoryProvider);
  }

  Future<void> uploadVideo(File video, BuildContext context) async {
    final user = ref.read(authRepo).user;
    final userProfile = ref.read(usersProvider).value;

    if (userProfile == null) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () async {
        final task = await _videoRepository.uploadVideoFile(
          video,
          user!.uid,
        );
        if (task.metadata != null) {
          await _videoRepository.saveVideo(
            VideoModel(
                title: "From Flutter!",
                description: "Hey there!",
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl: "thumbnailUrl",
                creatorUid: user.uid,
                creator: userProfile.name,
                likes: 0,
                comments: 0,
                createdAt: DateTime.now().millisecondsSinceEpoch),
          );
          context.pushReplacement("/home");
        }
      },
    );
  }
}

final uplaodVideoViewModelProvider =
    AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
