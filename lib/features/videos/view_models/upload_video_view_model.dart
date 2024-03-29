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
                id: "",
                title: "From Flutter!",
                description: "Hey there!",
                fileUrl: await task.ref.getDownloadURL(),
                thumbnailUrl:
                    "https://images.unsplash.com/photo-1702234893452-52302797f873?q=80&w=986&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                creatorUid: user.uid,
                creator: userProfile.name,
                likes: 0,
                comments: 0,
                createdAt: DateTime.now().millisecondsSinceEpoch),
          );
          context.pop();
          context.pop();
        }
      },
    );
  }
}

final uplaodVideoViewModelProvider =
    AsyncNotifierProvider<UploadVideoViewModel, void>(
  () => UploadVideoViewModel(),
);
