import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';
import 'package:sola/common/widgets/icon/s_blue_icon_widget.dart';
import 'package:sola/common/widgets/ignore_box_decoration.dart';

class ContactServiceDialog extends StatelessWidget {
  const ContactServiceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.bgWhiteColor,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(2, 5),
                    blurRadius: 2,
                  ),
                ]),
            margin: const EdgeInsets.symmetric(
              horizontal: 64,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DialogHeaderWidget(),
                const SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 34.0),
                  child: Text(
                    'Contact Us:'.tr,
                    style: const TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 18 / 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.0),
                  child: Text(
                    'Phone : +65 65710128 (Office Hour)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 34.0),
                  child: Text(
                    'Email:\n sola@xxx.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      height: 18 / 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 116,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
