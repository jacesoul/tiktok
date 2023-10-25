import 'package:flutter/material.dart';
import 'package:tiktok/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // CustomScrollView는 스크롤 가능한 구역을 가져다가 다같이 넣어서 한번에 scroll 할수 있게 만들어준다.
    // 그렇기 때문에 그냥 column을 render할수 없다.
    // column을 render하기 위해 sliver가 필요하다.
    return CustomScrollView(
      // slivers는 스크롤 가능한 구역이라고 생각하면 된다.
      slivers: [
        SliverAppBar(
          pinned: true,
          stretch: true,
          backgroundColor: Colors.teal,
          collapsedHeight: 80,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            stretchModes: const [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
            background: Image.asset(
              "assets/images/david-becker-unsplash.jpeg",
              fit: BoxFit.cover,
            ),
            title: const Text("Hello!"),
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20,
              ),
            ],
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.primaries[index % Colors.primaries.length],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          itemExtent: 100,
        ),
        SliverPersistentHeader(
          delegate: CustomDelegate(),
          pinned: true,
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (context, index) => Container(
              color: Colors.primaries[index % Colors.primaries.length],
              child: Align(
                alignment: Alignment.center,
                child: Text("Item $index"),
              ),
            ),
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            mainAxisSpacing: Sizes.size20,
            crossAxisSpacing: Sizes.size20,
            childAspectRatio: 1,
          ),
        )
      ],
    );
  }
}

class CustomDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.indigo,
      child: const FractionallySizedBox(
        heightFactor: 1,
        child: Center(
          child: Text(
            "Title!!!!!!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 85;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
