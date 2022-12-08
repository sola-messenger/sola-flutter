import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/widgets/input_column_field.dart';
import 'package:sola/widgets/radio_column_field.dart';
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
    formGroup:ctl.fromGroup,
    child: ListView(
      children: [
        Container(
          height: 40,
          width: 30,
        ),
        const InputColumnField(title: 'Group Name', formKey: 'groupName', hint: 'Please set your group name'),
  
        const SizedBox(
          height: 12,
        ),
        const InputColumnField(title: 'Description (Optional)', formKey: 'desc', hint: 'Please enter  description of group'),
        Obx(()=> RadioColumnField(title: 'Privacy Level', selectList: const ['Private','Public'], selected: ctl.privacyLevel.value, onSelect: ctl.onSelectPrivacyLevel)),
        Obx(()=> CheckboxListTile(
          title: Text('Allow group members to invite'.tr),
          value: ctl.allowInvite.value, onChanged: ctl.onChangeAllowInvite),),
        Obx(()=> CheckboxListTile(
          title: Text('Invitation Approval'.tr),
          value: ctl.invitationApproval.value, onChanged: ctl.onChangeInvitationApproval)),
            Obx(()=> CheckboxListTile(
          title: Text('Allow members to add friends'.tr),
          value: ctl.allowInvite.value, onChanged: ctl.onChangeAllowAddFriends)),
      ],
    ),
  );

  
}
