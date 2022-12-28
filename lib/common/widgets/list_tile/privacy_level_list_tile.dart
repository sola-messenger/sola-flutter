// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/utils/dialog_utils.dart';

// Project imports:
import 'package:sola/common/widgets/dialog/privacy_level_dialog.dart';
import 'package:sola/common/widgets/sola_radio_box.dart';
import 'package:sola/r.dart';

class PrivacyLevelListTile extends StatelessWidget {
  final bool isPrivate;
  final ValueChanged<bool> onChangePrivate;

  const PrivacyLevelListTile({
    Key? key,
    required this.isPrivate,
    required this.onChangePrivate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Privacy Level',
                style: AppTextStyles.black_bold_14,
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: () {
                  DialogUtils.showDialog(
                      child: PrivacyLevelDialog(onConfirm: () {}));
                },
                child: Image.asset(
                  R.assetsIconWarningIcon,
                  width: 14,
                  height: 12,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  onChangePrivate.call(true);
                },
                child: Row(
                  children: [
                    SolaRadioBox(isSelect: isPrivate == true, onChange: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'standard',
                      style: TextStyle(
                        fontSize: 14,
                        height: 21 / 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 56,
              ),
              InkWell(
                onTap: () {
                  onChangePrivate.call(false);
                },
                child: Row(
                  children: [
                    SolaRadioBox(isSelect: isPrivate == false, onChange: () {}),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'High'.tr,
                      style: const TextStyle(
                        fontSize: 14,
                        height: 21 / 14,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
