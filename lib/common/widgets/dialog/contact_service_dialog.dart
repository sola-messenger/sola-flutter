import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';

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
              horizontal: 45,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 64,
                      decoration: const BoxDecoration(
                          color: AppColors.mainBlueColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(11),
                            topRight: Radius.circular(11),
                          )),
                    ),
                    Center(
                      child: Container(
                        width: 50,
                        height: 50,
                        margin: const EdgeInsets.only(
                          top: 39,
                        ),
                        decoration: BoxDecoration(
                            color: AppColors.mainBlueColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Contact Us:'.tr,
                  style: const TextStyle(
                    color: AppColors.mainBlueColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 18 / 12,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Text(
                  'Phone : +65 65710128 (Office Hour)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    height: 18 / 10,
                  ),
                ),
                const Text(
                  'Email : sola@xxx.com',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    height: 18 / 10,
                  ),
                ),
                const SizedBox(
                  height: 158,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
