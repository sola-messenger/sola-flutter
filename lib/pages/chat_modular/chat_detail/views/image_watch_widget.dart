


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/extension/event_extension.dart';
import 'package:sola/common/widgets/mxc_image.dart';
import 'package:sola/r.dart';

class ImageWatchWidget extends StatelessWidget {
  final Event content;

  const ImageWatchWidget({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
                tag: content.eventId,
                child: MxcImage(
                  event: content,
                  fit: BoxFit.contain,
                  isThumbnail: false,
                  animated: false,
                ),
              ),
            ),
          ),
          Positioned(
              top: 47,
              right: 18,
              child: InkWell(
                onTap: () {
                  content.shareFile(context);
                },
                child: Image.asset(
                  R.assetsIconForwardIcon2,
                  width: 18,
                  height: 18,
                ),
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
    );
  }
}
