import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';
import 'package:sola/common/widgets/icon/s_blue_icon_widget.dart';
import 'package:sola/common/widgets/sola_check_box.dart';
import 'package:sola/r.dart';

class DeleteHistoryDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const DeleteHistoryDialog(
      {Key? key, required this.onCancel, required this.onConfirm})
      : super(key: key);

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
              horizontal: 45,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DialogHeaderWidget(
                  title: 'Delete Message History',
                ),
                const SizedBox(
                  height: 27,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: Text(
                    'Are you sure you want to delete all message history with Alan?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      height: 18 / 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, right: 18),
                  child: Text(
                    'This action can not be undone',
                    style: TextStyle(
                      color: AppColors.mainRedColor,
                      fontSize: 10,
                      height: 18 / 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Row(
                    children: [
                      SolaCheckBox(isSelect: true, onChange: () {}),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        'Also delete for Alan',
                        style: TextStyle(
                          color: AppColors.textBlackColor,
                          fontSize: 10,
                          height: 18 / 10,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 39,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BorderButton(
                        onPressed: () {
                          Get.back();
                          onCancel.call();
                        },
                        title: 'Cancel'.tr),
                    const SizedBox(
                      width: 12,
                    ),
                    FillButton(
                        onPressed: () {
                          Get.back();
                          onConfirm.call();
                        },
                        title: 'Confirm'.tr),
                  ],
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
