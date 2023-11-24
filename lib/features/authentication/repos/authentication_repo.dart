import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool get isLoggedIn => _firebaseAuth.currentUser != null;
  User? get user => _firebaseAuth.currentUser;
}

final authRepo = Provider((ref) => AuthenticationRepository());
