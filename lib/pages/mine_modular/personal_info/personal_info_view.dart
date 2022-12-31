// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/future/profile_future_widget.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';

// Project imports:
import 'package:sola/pages/mine_modular/personal_info/views/personal_info_item.dart';
import 'package:sola/r.dart';
import 'personal_info_controller.dart';

class PersonalInfoPage extends GetView<PersonalInfoController> {
  const PersonalInfoPage({Key? key}) : super(key: key);

  Widget _buildView(PersonalInfoController ctl) => ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          Center(
            child: GestureDetector(
              onTap: ctl.onChangeAvatar,
              child: Stack(
                children: [
                  ProfileFutureWidget(
                    buildProfile: (profile) => Avatar(
                      mxContent: profile.avatarUrl,
                      size: 62,
                      name: profile.displayName,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                      R.assetsIconCameraIcon,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          PersionalInfoItem(
              title: 'My Display Name',
              content: 'Eric Fang',
              onEdit: ctl.onEditDisplayName),
          const PersionalInfoItem(
            title: 'User Name',
            content: 'ericfang1',
          ),
          PersionalInfoItem(
            title: 'User ID',
            content: '@shenwei:sub1:thetranches.com',
            onEdit: ctl.onEditUserId,
          ),
          PersionalInfoItem(
            title: 'Email',
            content: 'ericfang@gamil.com',
            onEdit: ctl.onEditEmail,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: PersonalInfoController(),
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Personal Info'.tr),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }
}
