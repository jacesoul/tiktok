import 'package:flutter/material.dart';

import 'features/authentication/sign_up_screen.dart';

void main() {
  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TikTok',
        theme: ThemeData(
          primaryColor: const Color(0xffe9435a),
        ),
        home: const SignUpScreen());
  }
}
