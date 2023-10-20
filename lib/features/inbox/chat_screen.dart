import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<int> _items = [];

  void addItem() {
    if (_listKey.currentState != null) {
      _listKey.currentState!.insertItem(
        _items.length,
        duration: const Duration(
          milliseconds: 500,
        ),
      );
      _items.add(_items.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Direct messages"),
        actions: [
          IconButton(
              onPressed: addItem,
              icon: const FaIcon(
                FontAwesomeIcons.plus,
              ))
        ],
      ),
      /**
       * AnimatedList는 리스트를 animate해준다.
       * 리스트 그 자체가 아니라 리스트의 아이템들을 animate해준다.
       * 아이템이 리스트에 추가되거나 리스트에서 제거될때 애니메이션을 줄수 있다.
       * 아이템이 실시간으로 반영될 때 아주 유용하다.
       */
      body: AnimatedList(
        key: _listKey,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
        ),
        itemBuilder: (
          context,
          index,
          animation,
        ) {
          return FadeTransition(
            key: UniqueKey(),
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: SizeTransition(
                sizeFactor: animation,
                child: ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    foregroundImage: NetworkImage(
                      "https://plus.unsplash.com/premium_photo-1694467832488-9bc48ff8d112?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2360&q=80",
                    ),
                    child: Text("제이스"),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Jiwoo ($index)",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "2:16 PM",
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: Sizes.size12,
                        ),
                      ),
                    ],
                  ),
                  subtitle: const Text(
                    "Say hi to your friends",
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}