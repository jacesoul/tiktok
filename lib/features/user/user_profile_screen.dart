import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      // CustomScrollView는 스크롤 가능한 구역을 가져다가 다같이 넣어서 한번에 scroll 할수 있게 만들어준다.
      // 그렇기 때문에 그냥 column을 render할수 없다.
      // column을 render하기 위해 sliver가 필요하다.
      child: CustomScrollView(
        // slivers는 스크롤 가능한 구역이라고 생각하면 된다.
        slivers: [
          SliverAppBar(
            title: const Text("jace"),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.gear,
                    size: Sizes.size20,
                  ))
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1695843126800-b42849a648d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2860&q=80",
                  ),
                  child: Text(
                    "jace",
                  ),
                ),
                Gaps.v20,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "@jace",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.h5,
                    FaIcon(
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
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.v5,
                          Text(
                            "Following",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
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
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.v5,
                          Text(
                            "Follwers",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
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
                              fontSize: Sizes.size18,
                            ),
                          ),
                          Gaps.v5,
                          Text(
                            "Likes",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.size16,
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
                      borderRadius: const BorderRadius.all(Radius.circular(
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: const TabBar(
                    indicatorColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size10,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    labelColor: Colors.black,
                    tabs: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: Icon(
                          Icons.grid_4x4_rounded,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.size20,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.heart,
                        ),
                      ),
                    ],
                  ),
                ),
                // 다른 sliver안에서는 SliverGrid를 사용할수 없다.
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.all(
                        Sizes.size6,
                      ),
                      itemCount: 20,
                      // gridDelegate는 controller와는 좀 다르고, 도우미와 같다.
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: Sizes.size10,
                        mainAxisSpacing: Sizes.size10,
                        childAspectRatio: 9 / 20,
                      ),
                      itemBuilder: (context, index) => Column(
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
                                placeholder:
                                    "assets/images/david-becker-unsplash.jpeg",
                                image:
                                    "https://images.unsplash.com/photo-1695757429514-edf36f4c4e95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80",
                              ),
                            ),
                          ),
                          Gaps.v10,
                          const Text(
                            "This is a very long catpion for my tiktok that I'm upload just now currently.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: Sizes.size16 + Sizes.size2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Gaps.v5,
                          // DefaultTextStyle을 지정하면 그 안에 있는 모든 Text가 같은 스타일을 가지게된다.
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
                    const Center(
                      child: Text("Page 2"),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
