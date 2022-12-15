// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/widgets/index.dart';
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'create_group_controller.dart';

class CreateGroupPage extends GetView<CreateGroupController> {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: CreateGroupController(),
        id: 'Create group',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Set Group Info'.tr),
            ),
            body: _buildView(ctl),
          );
        });
  }

  Widget _buildView(CreateGroupController ctl) => ReactiveForm(
        formGroup: ctl.fromGroup,
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 4,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 60,
                        color: Colors.black,
                      ),
                    ),
                    const InputColumnField(
                        title: 'Group Name',
                        formKey: 'groupName',
                        hint: 'Please set your group name'),
                    const SizedBox(
                      height: 12,
                    ),
                    const InputColumnField(
                        title: 'Description (Optional)',
                        formKey: 'desc',
                        hint: 'Please enter  description of group'),
                    Obx(() => PrivacyLevelListTile(
                          isPrivate: ctl.privacyLevel.value,
                          onChangePrivate: ctl.onSelectPrivacyLevel,
                        )),
                    Obx(
                      () => MyRadioListTile(
                        title: 'Allow group members to invite',
                        onTap: ctl.onChangeAllowInvite,
                        isSelect: ctl.allowInvite.value,
                      ),
                    ),
                    Obx(() => MyRadioListTile(
                        title: 'Invitation Approval',
                        isSelect: ctl.invitationApproval.value,
                        onTap: ctl.onChangeInvitationApproval)),
                    Obx(() => MyRadioListTile(
                        title: 'Allow members to add friends',
                        isSelect: ctl.allowAddFriend.value,
                        onTap: ctl.onChangeAllowAddFriends)),
                    ReactiveFormConsumer(builder: (BuildContext context,
                        FormGroup formGroup, Widget? child) {
                      return Center(
                        child: ElevatedButton(
                            onPressed: formGroup.valid ? ctl.onFinish : null,
                            child: Text('Finish'.tr)),
                      );
                    }),
                  ]),
            ),
          ],
        ),
      );
}
