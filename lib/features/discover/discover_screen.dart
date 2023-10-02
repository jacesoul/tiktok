import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("Discover"),
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
            padding: const EdgeInsets.all(
              Sizes.size6,
            ),
            itemCount: 20,
            // gridDelegate는 controller와는 좀 다르고, 도우미와 같다.
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
              childAspectRatio: 9 / 16,
            ),
            itemBuilder: (context, index) => Container(
              color: Colors.green,
              child: Center(
                child: Text("$index"),
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
