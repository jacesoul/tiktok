import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok/features/main_navigation/main_navigation_screen.dart';

import 'constants/sizes.dart';

void main() async {
  // Flutter framework를 이용해서 앱이 시작하기 전에 state를 어떤 식으로든 바꾸고 싶다면
  // engine 자체와 engine과 widget의 연결을 확실하게 초기화 시켜야한다.
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // 화면에 나오는 디버그 배너를 없애준다.
        debugShowCheckedModeBanner: false,
        title: 'TikTok',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: const Color(0xffe9435a),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: Color(0xffe9435a),
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            appBarTheme: const AppBarTheme(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: Sizes.size16 + Sizes.size2,
                  fontWeight: FontWeight.w600,
                ))),
        home: const MainNavigationScreen());
  }
}

class LayoutBuilderCodeLab extends StatelessWidget {
  const LayoutBuilderCodeLab({super.key});

// LayoutBuilder는 화면 크기가 아닌 box의 최대 크기를 알기 위해 사용한다.
// LayoutBuilder가 Container가 어느정도의 크기인지를 알려준다.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width / 2,
        child: LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: Colors.teal,
            child: Center(
              child: Text(
                "${size.width} / ${constraints.maxWidth}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 98,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
