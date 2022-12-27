// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/r.dart';

class MyRadioListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final bool isSelect;

  const MyRadioListTile(
      {Key? key, this.onTap, required this.title, required this.isSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            Text(
              title.tr,
              style: AppTextStyles.black_bold_14
            ),
            const Spacer(),
            SizedBox(
                width: 22,
                height: 14,
                child: Image.asset(R.assetsIconSelectSwich))
          ],
        ),
      ),
    );
  }
}
