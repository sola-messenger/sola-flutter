// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/style/app_text_styles.dart';
import 'package:sola/common/widgets/button/border_icon_button.dart';
import 'package:sola/common/widgets/button/fill_button.dart';
import 'package:sola/common/widgets/button/fill_icon_button.dart';

// Project imports:
import 'package:sola/common/widgets/list_tile/my_radio_list_tile.dart';
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
            child: Row(
              children: [
                InkWell(
                  onTap:ctl.onNavPersonalInfo,
                  child: Ink(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                InkWell(
                  onTap: ctl.onCreateGroup,
                  child: Ink.image(
                    image: AssetImage(R.assetsIconChatAddMoreIcon),
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ),
          const MyRadioListTile(
            title: 'Pin',
            isSelect: false,
          ),
          const MyRadioListTile(
            title: 'Mute Notification ',
            isSelect: false,
          ),
          const ListTile(
            title: Text('Clear chat history'),
          ),
          ListTile(
            title: Row(
              children: [
                const Text('Auto Delete'),
                Image.asset(
                  R.assetsIconWarningIcon,
                  width: 14,
                  height: 13,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              children: [
                FillIconButton(
                  image: R.assetsIconCommunicationIcon,
                  title: 'standard',
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 12,
                ),
                BorderIconButton(
                  onPressed: (){},
                  image: R.assetsIconCollectionIcon,
                  title: 'High',
                ),
              ],
            ),
          )
        ],
      );
}
