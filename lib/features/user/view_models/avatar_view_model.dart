import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:tiktok/features/user/repos/user_repository.dart';
import 'package:tiktok/features/user/view_models/users_view_model.dart';

class AvatarViewModel extends AsyncNotifier<void> {
  late final UserRepository _usersRepository;

  @override
  FutureOr<void> build() {
    _usersRepository = ref.read(userRepo);
  }

  Future<void> updateAvatar(File file) async {
    state = const AsyncValue.loading();
    final fileName = ref.read(authRepo).user!.uid;
    _usersRepository.uploadAvatar(file, fileName);
    state = await AsyncValue.guard(() async {
      await _usersRepository.uploadAvatar(file, fileName);
      ref.read(usersProvider.notifier).onAvatarUpload();
    });
  }
}

final avatarProvider = AsyncNotifierProvider<AvatarViewModel, void>(
  () => AvatarViewModel(),
);
