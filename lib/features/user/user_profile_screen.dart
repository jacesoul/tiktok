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
    // CustomScrollView는 스크롤 가능한 구역을 가져다가 다같이 넣어서 한번에 scroll 할수 있게 만들어준다.
    // 그렇기 때문에 그냥 column을 render할수 없다.
    // column을 render하기 위해 sliver가 필요하다.
    return CustomScrollView(
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
