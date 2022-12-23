// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:extended_image/extended_image.dart';
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';
import 'package:sola/r.dart';

class ImageClip extends StatelessWidget {
  final String avatar;
  final String content;
  final bool isOwen;
  final VoidCallback onTapAvatar;

  const ImageClip(
      {super.key,
      required this.avatar,
      required this.content,
      required this.isOwen,
      required this.onTapAvatar});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      const SizedBox(
        width: 6,
      ),
      InkWell(
        onTap: onTapAvatar,
        child: Ink(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
      ),
      const SizedBox(
        width: 6,
      ),
      Container(
        constraints: const BoxConstraints(
          maxWidth: 160,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: () {
            Get.dialog(
                Material(
                  type: MaterialType.transparency,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: Get.mediaQuery.size.width,
                          height: Get.mediaQuery.size.height,
                          color: Colors.white,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 17.0),
                          child: Hero(
                            tag: content,
                            child: ExtendedImage(
                              image: NetworkImageX(content, scale: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 47,
                          right: 18,
                          child: Image.asset(
                            R.assetsIconForwardIcon2,
                            width: 18,
                            height: 18,
                          )),
                      Positioned(
                          bottom: 39,
                          right: 18,
                          child: Image.asset(
                            R.assetsIconDownloadIcon,
                            width: 18,
                            height: 18,
                          )),
                    ],
                  ),
                ),
                useSafeArea: false);
          },
          child: Hero(
            tag: content,
            child: ExtendedImage(
              image: NetworkImageX(content, scale: 1.0),
            ),
          ),
        ),
      ),
      if (isOwen) MessageStateInherited.of(context).buildIcon(),
    ];

    if (isOwen) {
      // 右边
      children = children.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isOwen ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: MessageStateInherited.of(context).buildSelectIcon()),
          ...children,
        ],
      ),
    );
  }
}
