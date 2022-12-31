// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/button/button_size_enum.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/header/personal_info_header.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'package:sola/common/widgets/sola_divider.dart';
import 'contact_info_controller.dart';

class ContactInfoPage extends GetView<ContactInfoController> {
  const ContactInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ContactInfoController(),
        id: 'contact info',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Personal Info'),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(ContactInfoController ctl) => Obx(
        () => ctl.profile.value == null
            ? Container()
            : ListView(
                children: [
                  PersonalInfoHeader(
                    image: ctl.profile.value!.avatarUrl,
                    name: '${ctl.profile.value!.displayName}',
                    desc: ctl.profile.value!.userId,
                  ),
                  const SolaDivider(),
                  const ClickListTile(
                    title: 'Organization',
                    content: 'DCC DEV',
                    contentStyle: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      height: 22 / 10,
                    ),
                    isShowLine: false,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const SolaDivider(),
                  const SizedBox(
                    height: 8,
                  ),
                  PrivacyLevelListTile(
                      isPrivate: ctl.privacyLevel.value, onChangePrivate: ctl.onChangePrivacyLevel),
                  const SizedBox(
                    height: 76,
                  ),
                  Center(
                    child: FillButton(
                        onPressed: ctl.onAddAsContact,
                        buttonSizeEnum: ButtonSizeEnum.large,
                        title: 'Add as Contact'),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
      );
}
