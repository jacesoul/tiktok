import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/sizes.dart';

import '../../../constants/gaps.dart';

class VideoComments extends StatefulWidget {
  const VideoComments({super.key});

  @override
  State<VideoComments> createState() => _VideoCommentsState();
}

class _VideoCommentsState extends State<VideoComments> {
  bool _isWriting = false;

  final ScrollController _scrollController = ScrollController();

  void _onClosePressed() {
    Navigator.of(context).pop();
  }

  void _stopWriting() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.8,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Sizes.size14,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Text("22796 comments"),
          actions: [
            IconButton(
              onPressed: _onClosePressed,
              icon: const FaIcon(FontAwesomeIcons.xmark),
            ),
          ],
        ),
        body: GestureDetector(
          onTap: _stopWriting,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: Sizes.size10,
                    bottom: Sizes.size96 + Sizes.size20,
                    right: Sizes.size16,
                    left: Sizes.size16,
                  ),
                  separatorBuilder: (context, index) => Gaps.v20,
                  itemCount: 10,
                  itemBuilder: (context, index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        child: Text("Jace"),
                      ),
                      Gaps.h10,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "제이스",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Sizes.size14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Gaps.v3,
                            const Text(
                              "The greatest glory in living lies not in never falling, but in rising every time we fall. – Nelson Mandela",
                            )
                          ],
                        ),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: Sizes.size20,
                            color: Colors.grey.shade500,
                          ),
                          Gaps.v10,
                          Text(
                            "52.2K",
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  width: size.width,
                  child: BottomAppBar(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size16,
                        vertical: Sizes.size10,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade500,
                            foregroundColor: Colors.white,
                            radius: 18,
                            child: const Text(
                              "Jace",
                            ),
                          ),
                          Gaps.h10,
                          Expanded(
                            child: SizedBox(
                              height: Sizes.size44,
                              child: TextField(
                                onTap: _onStartWriting,
                                expands: true,
                                minLines: null,
                                maxLines: null,
                                textInputAction: TextInputAction.newline,
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  hintText: "Write a comment...",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      Sizes.size12,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: Sizes.size12,
                                    horizontal: Sizes.size12,
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                      right: Sizes.size12,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.at,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h10,
                                        FaIcon(
                                          FontAwesomeIcons.gift,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h10,
                                        FaIcon(
                                          FontAwesomeIcons.faceSmile,
                                          color: Colors.grey.shade900,
                                        ),
                                        Gaps.h10,
                                        if (_isWriting)
                                          GestureDetector(
                                            onTap: _stopWriting,
                                            child: FaIcon(
                                              FontAwesomeIcons.circleArrowRight,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
