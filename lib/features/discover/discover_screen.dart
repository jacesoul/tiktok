import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/breakpoints.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

/// 코드 챌린지
/// 1. 탭을 이동할때 키보드가 사라지도록하기
/// 2. 검색창 만들기

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  // controller를 만들때는 dispose를 잊으면 안된다.
  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  void _onSearchChanged(String value) {}

  void _onSearchSubmitted(String value) {}

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery로 screen크기, padding크기, orientation등을 알수있다.
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          title: ConstrainedBox(
            // Container를 사용해도 constraints를 받을수 있다.
            // ConstrainedBox는 단지 constraints를 받아들이는 Container일 뿐이다.
            constraints: const BoxConstraints(
              maxWidth: Breakpoints.sm,
            ),
            child: CupertinoSearchTextField(
              controller: _textEditingController,
              onChanged: _onSearchChanged,
              onSubmitted: _onSearchSubmitted,
            ),
          ),
          // bottom은 PreferredSizeWidget이라는 type을 가진다.
          // PreferredSizeWidget이란 특정한 크기를 가지려고 하지만 자식요소의 크기를 제한하지는 않는 위젯이다.
          bottom: TabBar(
            splashFactory: NoSplash.splashFactory,
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size6,
            ),
            isScrollable: true,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(children: [
          // builder를 사용하는게 더 좋은 퍼포먼스를 보여줄수 있다.
          GridView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(
              Sizes.size6,
            ),
            itemCount: 20,
            // gridDelegate는 controller와는 좀 다르고, 도우미와 같다.
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width > Breakpoints.lg ? 5 : 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
              childAspectRatio: 9 / 20,
            ),
            itemBuilder: (context, index) => LayoutBuilder(
              builder: (context, constraints) => Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Sizes.size4,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 9 / 16,
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: "assets/images/david-becker-unsplash.jpeg",
                        image:
                            "https://images.unsplash.com/photo-1695757429514-edf36f4c4e95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                      ),
                    ),
                  ),
                  Gaps.v10,
                  Text(
                    "${constraints.maxWidth} This is a very long catpion for my tiktok that I'm upload just now currently.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v5,
                  // DefaultTextStyle을 지정하면 그 안에 있는 모든 Text가 같은 스타일을 가지게된다.
                  if (constraints.maxWidth < 200 || constraints.maxWidth > 250)
                    DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1695843126800-b42849a648d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2860&q=80",
                            ),
                          ),
                          Gaps.h4,
                          // Expanded는 오직 해당 Row 내부에서 가능한 한 많은 공간을 차지한다.
                          const Expanded(
                            child: Text(
                              "My avatar is going to be very long.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gaps.h4,
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size16,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.h2,
                          const Text(
                            "2.5M",
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
