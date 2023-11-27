import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok/features/user/models/user_profile_model.dart';

class UsersViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  Future<void> createProfile(UserCredential credential) async {
    if (credential.user == null) throw Exception("Account not created");

    state = AsyncValue.data(
      UserProfileModel(
        bio: 'undefined',
        link: 'undefined',
        uid: credential.user!.uid,
        email: credential.user!.email ?? "Anonymous@anonymous.com",
        name: credential.user!.displayName ?? "Anonymous",
      ),
    );
  }
}

final usersProvider = AsyncNotifierProvider(
  () => UsersViewModel(),
);
