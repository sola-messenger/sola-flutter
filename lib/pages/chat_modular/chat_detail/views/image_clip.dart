import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/widgets/index.dart';

class ImageClip extends StatelessWidget {
  final String avatar;
  final String content;
  final bool isOwen;
  final VoidCallback onTapAvatar;

  const ImageClip(
      {super.key,
      required this.avatar,
      required this.content,
      required this.isOwen, required this.onTapAvatar});

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
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8)
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
            Get.dialog(Material(
              type: MaterialType.transparency,
              child: Center(
                child: Hero(
                  tag: content,
                  child: ExtendedImage(
                    image: NetworkImageX(content, scale: 1.0),
                  ),
                ),
              ),
            ));
          },
          child: Hero(
            tag: content,
            child: ExtendedImage(
              image: NetworkImageX(content, scale: 1.0),
            ),
          ),
        ),
      )
    ];

    if(isOwen){
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
        mainAxisAlignment: isOwen?MainAxisAlignment.end: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}
