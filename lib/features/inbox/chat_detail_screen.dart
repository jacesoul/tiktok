import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  static const String routeName = "chatDetail";
  static const String routeURL = ":chatId";

  final String chatId;

  const ChatDetailScreen({
    super.key,
    required this.chatId,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size10,
          leading: const CircleAvatar(
            foregroundImage: NetworkImage(
              "https://plus.unsplash.com/premium_photo-1694467832488-9bc48ff8d112?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2360&q=80",
            ),
            child: Text("제이스"),
          ),
          title: Text(
            "제이스 ${widget.chatId}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size24,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size24,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size10,
              vertical: Sizes.size10,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10,
                      vertical: Sizes.size8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.grey.shade300 : Colors.blue.shade300,
                      borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(Sizes.size20),
                          topRight: const Radius.circular(Sizes.size20),
                          bottomLeft: isMine
                              ? const Radius.circular(Sizes.size20)
                              : const Radius.circular(Sizes.size5),
                          bottomRight: isMine
                              ? const Radius.circular(Sizes.size5)
                              : const Radius.circular(Sizes.size20)),
                    ),
                    child: Text(
                      "Message $index",
                      style: TextStyle(
                        color: isMine ? Colors.black : Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 10,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey.shade50,
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(),
                  ),
                  Gaps.h20,
                  FaIcon(
                    FontAwesomeIcons.paperPlane,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
