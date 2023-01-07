// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/extension/date_time_extension.dart';
import 'package:sola/common/extension/stream_extension.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/matrix_locals.dart';

// Project imports:
import 'package:sola/common/routers/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/future/profile_future_widget.dart';
import 'package:sola/common/widgets/popu/menu_popup.dart';
import 'package:sola/pages/chat_modular/chat/views/connection_status_header.dart';
import 'package:sola/pages/chat_modular/chat/views/contact_item.dart';
import 'package:sola/pages/chat_modular/chat/views/search_bar.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';
import 'package:sola/r.dart';
import 'index.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(ChatController ctl) {
    return StreamBuilder(
        stream: Get.find<ClientService>()
            .client
            .onSync
            .stream
            .where((event) => event.hasRoomUpdate)
            .rateLimit(const Duration(seconds: 1)),
        builder: (context, _) {
          final List<Room> rooms = Get.find<ClientService>().client.rooms;
          return ListView(
            children: [
              const ConnectionStatusHeader(),
              const SearchBar(),
              ...List.generate(
                  rooms.length,
                  (index) => ContactItem(
                        onNavDetail: () {
                          ctl.onNavToPersonInfo(rooms[index]);
                        },
                        img: rooms[index].avatar,
                        name: rooms[index].displayname.toString(),
                        orgName: 'DCC DEV',
                        lastContent: rooms[index].membership ==
                                Membership.invite
                            ? 'You are invite to this chat'
                            : rooms[index].lastEvent?.calcLocalizedBodyFallback(
                                      MatrixLocals(L10n.of(context)!),
                                      hideReply: true,
                                      hideEdit: true,
                                      plaintextBody: true,
                                      removeMarkdown: true,
                                      withSenderNamePrefix: !rooms[index]
                                              .isDirectChat ||
                                          rooms[index].directChatMatrixID !=
                                              rooms[index].lastEvent?.senderId,
                                    ) ??
                                '',
                        time: rooms[index]
                            .timeCreated
                            .localizedTimeShort(context),
                        unreadCount: rooms[index].isUnread ||
                                rooms[index].membership == Membership.invite
                            ? rooms[index].notificationCount
                            : 0,
                        isTop: rooms[index].isFavourite,
                        isSytemContact: false,
                        onTap: () {
                          ctl.onNavToRoom(rooms[index]);
                        },
                        isMute:
                            rooms[index].pushRuleState != PushRuleState.notify,
                        isOnline: true,
                        menuItems: [
                          MenuPopupItemEntity(
                              image: R.assetsIconPinIcon,
                              title: 'Pin',
                              onTap: () {}),
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
                              onTap: (){
                                ctl.onDeleteChat(rooms[index]);
                              }),
                        ],
                      )),
            ],
          );
        });
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
                      onTap: ctl.onScanQrCode),
                  MenuPopupItemEntity(
                      title: 'Create Group'.tr,
                      image: R.assetsIconCreateGroupIcon,
                      onTap: ctl.onCreateGroup),
                  MenuPopupItemEntity(
                      title: 'Add by QR code'.tr,
                      image: R.assetsIconAddByQrcodeIcon,
                      onTap: () {}),
                  MenuPopupItemEntity(
                      title: 'Add Contacts'.tr,
                      image: R.assetsIconAddContactsIcon,
                      onTap: ctl.onAdd),
                ],
                child: const Icon(Icons.menu),
              ),
              const SizedBox(
                width: 18,
              ),
            ],
          ),
          body: SafeArea(
            child: _buildView(ctl),
          ),
        );
      },
    );
  }

  Widget _buildUserInfo(ChatController ctl) {
    return ProfileFutureWidget(
      buildProfile: (Profile profile) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Avatar(
              mxContent: profile.avatarUrl,
              name: profile.displayName,
              onTap: () {},
              size: 50,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${profile.displayName}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    height: 22 / 15,
                  ),
                ),
                const SizedBox(
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
      },
    );
  }
}
