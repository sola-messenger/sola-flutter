// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/button/fill_button.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/r.dart';
import 'set_personal_info_controller.dart';

class SetPersonalInfoPage extends GetView<SetPersonalInfoController> {
  const SetPersonalInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SetPersonalInfoController(),
      id: 'set personal info',
      builder: (ctl) {
        return Scaffold(
          body: _buildView(ctl),
        );
      },
    );
  }

  Widget _buildView(SetPersonalInfoController ctl) {
    return ReactiveForm(
      formGroup: ctl.fromGroup,
      child: ListView(
        padding: EdgeInsets.only(
          left: 37,
          right: 14,
          top: Get.mediaQuery.padding.top + 24,
        ),
        children: [
          Text(
            'Set your avatar'.tr,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              onTap: ctl.onSelectAvatar,
              child: Ink(
                width: 85,
                height: 80,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: AppColors.mainBlueColor,
                )),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        R.assetsIconAddIcon,
                        width: 27,
                        height: 27,
                      ),
                    ),
                    Positioned(
                        right: 7,
                        bottom: 7,
                        child: Image.asset(
                          R.assetsIconCameraIcon,
                          width: 20,
                          height: 20,
                        )),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          const InputColumnField(
              title: 'Set your display name',
              formKey: 'displayName',
              textColor: AppColors.textBlackColor,
              hint: 'Please set your display name'),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: FillButton(
                onPressed: ctl.onSaveAndContinue,
                title: 'Save and Continue'.tr),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: GestureDetector(
              onTap: ctl.onSkip,
              child: Text(
                'Skip for now'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.mainBlueColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
