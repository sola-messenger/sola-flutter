import 'package:flutter/material.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/r.dart';

class BorderClickListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const BorderClickListTile(
      {Key? key, required this.onTap, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD3D3D3),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 9,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.grey_10.copyWith(
                  height: 22/10,
                ),
              ),
            ),
            Image.asset(R.assetsIconRightIcon,
            width: 8,
            height: 12,),
          ],
        ),
      ),
    );
  }
}
