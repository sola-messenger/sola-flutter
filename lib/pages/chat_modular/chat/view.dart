// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/popu/menu_popup.dart';
import 'package:sola/pages/chat_modular/chat/views/contact_item.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'package:sola/r.dart';
import 'index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(ChatController ctl) {
    return ListView(
      children: [
        const SearchBar(),
        ...List.generate(
            10,
            (index) => ContactItem(
                  img: 'img',
                  name: 'Jack',
                  orgName: 'DCC DEV',
                  lastContent: 'Come here, to have a meeting',
                  time: '19-11',
                  unreadCount: 1,
                  isTop: true,
                  isSytemContact: false,
                  onTap: () {
                    Get.toNamed(Routers.chatDetailRoute);
                  },
                  isMute: true,
                  isOnline: true,
                  menuItems: [
                    MenuPopupItemEntity(
                        image: R.assetsIconPinIcon, title: 'Pin', onTap: () {}),
                    MenuPopupItemEntity(
                        image: R.assetsIconMuteIcon,
                        title: 'Mute notification',
                        onTap: () {}),
                    MenuPopupItemEntity(
                        image: R.assetsIconMakeAsReadIcon,
                        title: 'Make as read',
                        onTap: () {}),
                    MenuPopupItemEntity(
                        image: R.assetsIconAutoDeleteIcon,
                        title: 'Auto delete',
                        onTap: ctl.onAutoDelete),
                    MenuPopupItemEntity(
                        image: R.assetsIconDeleteChatIcon,
                        title: 'Delete chat',
                        onTap: ctl.onDeleteChat),
                  ],
                )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: "chat",
      builder: (ctl) {
        return Scaffold(
          appBar: AppBar(
            title: _buildUserInfo(ctl),
            iconTheme: const IconThemeData(
              color: AppColors.mainBlueColor,
            ),
            centerTitle: false,
            actions: [
              MenuPopup(
                menuPopupType: MenuPopupType.chatMenu,
                menuItem: [
                  MenuPopupItemEntity(
                      title: 'Scan QR code'.tr,
                      image: R.assetsIconScanQrcodeIcon,
                      onTap: () {}),
                  MenuPopupItemEntity(
                      title: 'Create Group'.tr,
                      image: R.assetsIconCreateGroupIcon,
                      onTap: () {}),
                  MenuPopupItemEntity(
                      title: 'Add by QR code'.tr,
                      image: R.assetsIconAddByQrcodeIcon,
                      onTap: () {}),
                  MenuPopupItemEntity(
                      title: 'Add Contacts'.tr,
                      image: R.assetsIconAddContactsIcon,
                      onTap: () {}),
                ],
                child: const Icon(Icons.menu),
              ),
              const SizedBox(
                width: 18,
              ),
              // PopupMenuButton(
              //   onSelected: (value) {
              //     switch (value) {
              //       case 1:
              //         break;
              //       case 2:
              //         ctl.onCreateGroup();
              //         break;
              //       case 3:
              //         ctl.onInviteFriend();
              //         break;
              //       case 4:
              //         break;
              //       default:
              //     }
              //   },
              //   icon: ,
              //   itemBuilder: (BuildContext context) {
              //     return [
              //       PopupMenuItem(value: 1, child: Text('Scan QRCode')),
              //       PopupMenuItem(value: 2, child: Text('Create Group')),
              //       PopupMenuItem(value: 3, child: Text('Invite Friends')),
              //       PopupMenuItem(value: 4, child: Text('Add by QRCode')),
              //     ];
              //   },
              // ),
            ],
          ),
          body: SafeArea(
            child: _buildView(ctl),
          ),
        );
      },
    );
  }

  Row _buildUserInfo(ChatController ctl) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 54,
          height: 54,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Eric Fang',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                height: 22/15,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            // InkWell(
            //   onTap: ctl.onChangeOrg,
            //   child: Row(
            //     children: const [
            //       Text(
            //         'DCS Card',
            //         style: TextStyle(
            //           fontSize: 12,
            //           color: Colors.white,
            //         ),
            //       ),
            //       Icon(Icons.arrow_drop_down),
            //     ],
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}
