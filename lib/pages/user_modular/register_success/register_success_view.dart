// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/r.dart';

// Project imports:
import 'register_success_controller.dart';

class RegisterSuccessPage extends GetView<RegisterSuccessController> {
  const RegisterSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: RegisterSuccessController(),
      builder: (ctl) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 100,
                  height: 112,
                  child: Image.asset(R.assetsIconSuccessBlueIcon),
                ),
                const SizedBox(
                  height: 27,
                ),
                const Center(
                  child: Text(
                    'Congratulations!',
                    style: TextStyle(
                      fontSize: 20,
                      height: 30 / 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 49,
                ),
                if (ctl.isCreateOrg == 'true')
                  const Text(
                    'You have successfully created the space\n ericfang\'s Space',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                else
                  const Text(
                    'You have successfully joined the organization\n ericfang\'s Space',
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(
                  height: 46,
                ),
                FillButton(
                    buttonSizeEnum: ButtonSizeEnum.large,
                    onPressed: ctl.onConfirm, title: 'Continue'.tr),
              ],
            ),
          ),
        );
      },
    );
  }
}
