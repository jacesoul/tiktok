// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDp1DbVb3S5oW9rTb58oD250O2etQRsmh8',
    appId: '1:297702670124:web:fb4448746d38dd0121b689',
    messagingSenderId: '297702670124',
    projectId: 'tiktok-cool-project-abc',
    authDomain: 'tiktok-cool-project-abc.firebaseapp.com',
    storageBucket: 'tiktok-cool-project-abc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABOPknDLqJdhoL9wZxWGmv6sO5FhFF6eo',
    appId: '1:297702670124:android:9a9c1d1d43068af521b689',
    messagingSenderId: '297702670124',
    projectId: 'tiktok-cool-project-abc',
    storageBucket: 'tiktok-cool-project-abc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAANGNskDGrOxLgtfl-GVs15_5bS1mmPSg',
    appId: '1:297702670124:ios:69518cc51955985821b689',
    messagingSenderId: '297702670124',
    projectId: 'tiktok-cool-project-abc',
    storageBucket: 'tiktok-cool-project-abc.appspot.com',
    iosBundleId: 'co.jace.tiktok',
  );
}
