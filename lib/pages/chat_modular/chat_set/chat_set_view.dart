// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/border_icon_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/button/fill_icon_button.dart';
import 'package:sola/common/widgets/list_tile/click_list_tile.dart';

// Project imports:
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
import 'package:sola/common/widgets/list_tile/privacy_level_list_tile.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';
import 'package:sola/r.dart';
import 'chat_set_controller.dart';

class ChatSetPage extends GetView<ChatSetController> {
  const ChatSetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatSetController(),
        id: 'chat set',
        builder: (ctl) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Chat Set'),
            ),
            body: SafeArea(child: _buildView(ctl)),
          );
        });
  }

  Widget _buildView(ChatSetController ctl) => ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Create Group',
              style: AppTextStyles.black_15,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Stack(
              children: [
                InkWell(
                  onTap: ctl.onNavPersonalInfo,
                  child: Avatar(
                    mxContent: ctl.room!.avatar,
                    name: ctl.room!.displayname,
                    size: 45,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    left: 40,
                  ),
                  child: InkWell(
                    onTap: ctl.onCreateGroup,
                    child: Ink.image(
                      image: AssetImage(R.assetsIconChatAddMoreIcon),
                      width: 19,
                      height: 19,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => MyRadioListTile(
              title: 'Pin',
              isSelect: ctl.isPin.isTrue,
              onTap: ctl.onChangePin,
            ),
          ),
          Obx(
            () => MyRadioListTile(
              title: 'Mute Notification ',
              isSelect: ctl.isMute.isTrue,
              onTap: ctl.onChangeMute,
            ),
          ),
          ClickListTile(
            onTap: () {},
            title: 'Clear chat history',
            isShowLine: false,
          ),
          ClickListTile(
            onTap: () {},
            title: 'Auto Delete',
            isShowLine: false,
          ),
          Obx(
            () => PrivacyLevelListTile(
              isPrivate: ctl.isPrivacy.isTrue,
              onChangePrivate: ctl.onchangePrivacyLevel,
            ),
          ),
        ],
      );
}
