import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/user/models/user_profile_model.dart';
import 'package:tiktok/features/user/repos/user_repository.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  late final UserRepository _repository;

  @override
  FutureOr<UserProfileModel> build() {
    _repository = ref.read(userRepo);
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) throw Exception("Account not created");

    state = const AsyncValue.loading();

    final profile = UserProfileModel(
      bio: 'undefined',
      link: 'undefined',
      uid: credential.user!.uid,
      email: credential.user!.email ?? "Anonymous@anonymous.com",
      name: credential.user!.displayName ?? "Anonymous",
    );
    await _repository.createProfile(profile);
    state = AsyncValue.data(profile);
  }
}

final usersProvider = AsyncNotifierProvider<UsersViewModel, UserProfileModel>(
  () => UsersViewModel(),
);
