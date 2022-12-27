// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/r.dart';

class InviteBottomSheet extends StatelessWidget {
  final VoidCallback onInviteNow;

  const InviteBottomSheet({Key? key, required this.onInviteNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 48,
                  ),
                  child: Text(
                    'Invite people to your organization'.tr,
                    style: AppTextStyles.black_bold_14,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 11.0,
                        right: 13,
                      ),
                      child: Image.asset(
                        R.assetsIconGreyCloseIcon,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 48.0),
                child: Text(
                  'You can invite organization members by \neclusive Invite Code'
                      .tr,
                  style: const TextStyle(
                    fontSize: 11,
                    height: 16 / 11,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            FillButton(onPressed: onInviteNow, title: 'Invite Now'.tr),
            const SizedBox(
              height: 27,
            ),
          ],
        ),
      ),
    );
  }
}
