import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/settings/settings_screen.dart';
import 'package:tiktok/features/user/widgets/persistent_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;

  const UserProfileScreen({
    super.key,
    required this.username,
  });

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

// CustomScrollView는 스크롤 가능한 구역을 가져다가 다같이 넣어서 한번에 scroll 할수 있게 만들어준다.
// 그렇기 때문에 그냥 column을 render할수 없다.
// column을 render하기 위해 sliver가 필요하다.
class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          // NestedScrollView는 여러개의 스크롤 가능한 View들을 넣을 수 있게 해준다.
          // 또한 그 안의 모든 scroll position들을 연결해준다.
          // 이 Widget이 가장 흔하게 쓰이는 경우는 SliverAppBar와 TabBar를 사용하는 경우이다.
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: Text(widget.username),
                  actions: [
                    IconButton(
                        onPressed: _onGearPressed,
                        icon: const FaIcon(
                          FontAwesomeIcons.gear,
                          size: Sizes.size20,
                        ))
                  ],
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gaps.v20,
                      CircleAvatar(
                        radius: 50,
                        foregroundImage: const NetworkImage(
                          "https://images.unsplash.com/photo-1695843126800-b42849a648d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2860&q=80",
                        ),
                        child: Text(
                          widget.username,
                        ),
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "@${widget.username}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
                            ),
                          ),
                          Gaps.h5,
                          const FaIcon(
                            FontAwesomeIcons.solidCircleCheck,
                            size: Sizes.size16,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      Gaps.v24,
                      SizedBox(
                        height: Sizes.size52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "37",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v5,
                                Text(
                                  "Following",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            // VerticalDivider는 특정 높이를 가진 father를 필요로한다.
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              indent: Sizes.size12,
                              endIndent: Sizes.size12,
                              color: Colors.grey.shade400,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "10.5M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v5,
                                Text(
                                  "Follwers",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            VerticalDivider(
                              width: Sizes.size32,
                              thickness: Sizes.size1,
                              indent: Sizes.size12,
                              endIndent: Sizes.size12,
                              color: Colors.grey.shade400,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "149.3M",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: Sizes.size16,
                                  ),
                                ),
                                Gaps.v5,
                                Text(
                                  "Likes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.size14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Gaps.v14,
                      // FractionallySizedBox는 father의 너비와 높이에 의존해서 너비와 높이를 가진다.
                      FractionallySizedBox(
                        widthFactor: 0.33,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.size12,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(
                              Sizes.size4,
                            )),
                          ),
                          child: const Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Gaps.v14,
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size24,
                        ),
                        child: Text(
                          "All highlights and where to watch live matches on FIFA+ I wonder how it would look",
                          style: TextStyle(
                            fontSize: Sizes.size16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Gaps.v14,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.link,
                            size: Sizes.size14,
                          ),
                          Gaps.h8,
                          Text(
                            "https://www.fifa.com/fifapuls/en/home",
                            style: TextStyle(
                              fontSize: Sizes.size16,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistentTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 20,
                  padding: EdgeInsets.zero,
                  // gridDelegate는 controller와는 좀 다르고, 도우미와 같다.
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 9 / 14,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder:
                              "assets/images/david-becker-unsplash.jpeg",
                          image:
                              "https://images.unsplash.com/photo-1695757429514-edf36f4c4e95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                        ),
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text("Page 2"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
