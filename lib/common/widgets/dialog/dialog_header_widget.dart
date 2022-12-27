import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/r.dart';

class DialogHeaderWidget extends StatelessWidget {
  final String? title;

  const DialogHeaderWidget({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 95,
          decoration: const BoxDecoration(
              color: Color(0x17353434),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              )),
          padding: EdgeInsets.only(
            top: title != null ? 26 : 38,
          ),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset(
                R.assetsIconLogoIcon,
                width: 100,
                height: 21,
              ),
              const SizedBox(
                height: 18,
              ),
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    color: AppColors.textBlackColor,
                    fontSize: 14,
                    height: 18 / 14,
                  ),
                )
            ],
          ),
        ),
        Positioned(
          top: 11,
          right: 12,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Ink.image(
                image: AssetImage(R.assetsIconGreyCloseIcon),
                width: 16,
                height: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
