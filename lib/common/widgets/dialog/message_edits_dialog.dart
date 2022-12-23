import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

class MessageEditsDialog extends StatelessWidget {
  const MessageEditsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFEAEAEA),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
              )),
          padding: const EdgeInsets.only(
            left: 20,
            top: 13,
            bottom: 56,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: Get.mediaQuery.size.width,
              ),
              Center(
                child: Text(
                  'Message Edits'.tr,
                  style: const TextStyle(
                    color: AppColors.textBlackColor,
                    fontSize: 16,
                    height: 24 / 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _buildMessageEditItem(
                '12-09 2022 12:02',
                'You are ',
                'right',
              ),
              _buildMessageEditItem(
                '12-08 2022 16:09',
                'You are ',
                'awesome',
              ),
              _buildMessageEditItem(
                '12-04 2022 19:02',
                'Good ',
                'day',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageEditItem(String time,String content,String highlightContent) => Padding(
    padding: const EdgeInsets.only(
        bottom: 18.0),
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '12-09 2022 12:02',
              style: TextStyle(
                fontSize: 12,
                height: 18 / 12,
                color: Color(0x99353434),
              ),
            ),
            RichText(
                text:  TextSpan(
                    children: [
                  TextSpan(text: content),
                  TextSpan(
                      text: highlightContent,
                      style: const TextStyle(
                        color: AppColors.mainBlueColor,
                      )),
                ],
                    style: const TextStyle(
                      color: AppColors.textBlackColor,
                      fontSize: 16,
                      height: 24 / 16,
                    ))),
          ],
        ),
  );
}
