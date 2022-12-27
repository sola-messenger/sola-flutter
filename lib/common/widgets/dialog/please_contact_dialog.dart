import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/dialog/dialog_header_widget.dart';
import 'package:sola/common/widgets/icon/s_blue_icon_widget.dart';

class PleaseContactDialog extends StatelessWidget {
  const PleaseContactDialog({Key? key}) : super(key: key);

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
              horizontal: 65,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DialogHeaderWidget(),
                SizedBox(
                  height: 44,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 38.0),
                  child: Text(
                    'Please contact your organization owner or administrator',
                    style: AppTextStyles.black_14,
                  ),
                ),
                SizedBox(
                  height: 143,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
