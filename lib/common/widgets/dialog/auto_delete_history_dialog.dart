import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/border_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';
import 'package:sola/common/widgets/icon/s_blue_icon_widget.dart';
import 'package:sola/common/widgets/sola_check_box.dart';

class AutoDeleteHistoryDialog extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const AutoDeleteHistoryDialog(
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
                const DialogHeaderWidget(title: 'Auto Delete Message'),
                const SizedBox(
                  height: 7,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15),
                  child: Text(
                    'Automatically delete new messages for you and after a certiain period of time.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      height: 18 / 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15),
                  child: Text(
                    'You can also set your default for all chats in Settings',
                    style: TextStyle(
                      color: AppColors.mainBlueColor,
                      fontSize: 12,
                      height: 18 / 12,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: SizedBox(
                    height: 114,
                    child: CupertinoPicker(
                      itemExtent: 28,
                      useMagnifier: true,
                      selectionOverlay: Container(
                        height: 28,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom:
                              BorderSide(color: Color(0x33353434), width: 1),
                          top: BorderSide(color: Color(0x33353434), width: 1),
                        )),
                      ),
                      onSelectedItemChanged: (int value) {},
                      children: [1, 2, 3, 4]
                          .map((e) => Center(
                                child: Text(
                                  '$e day',
                                  style: const TextStyle(
                                    fontSize: 10,
                                    height: 18 / 10,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
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
