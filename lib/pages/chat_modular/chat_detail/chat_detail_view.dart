// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:sola/common/matrix_locals.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/popu/menu_popup.dart';

// Project imports:
import 'package:sola/common/widgets/pull_to_refresh/expanded_viewport.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/tool_bar_picker.dart';
import 'package:sola/r.dart';
import '../../../common/widgets/index.dart';
import 'chat_detail_controller.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

import 'views/chat_emoji_picker.dart';
import 'views/chat_message.dart';

class ChatDetailPage extends GetView<ChatDetailController> {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ChatDetailController(),
        id: 'chat detail',
        builder: (ctl) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              title: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    R.assetsIconCollectionIcon,
                    width: 18,
                    height: 22,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    ctl.room.value?.displayname.toString() ?? 'Not Found',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textBlackColor,
                      height: 22 / 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'DCC DEV',
                    style: TextStyle(
                      fontSize: 8,
                      color: Color(0xFF7B7B7B),
                      height: 22 / 8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: ctl.onDropDown,
                  icon: Image.asset(
                    R.assetsIconListMoreIcon,
                    width: 15,
                    height: 15,
                  ),
                ),
              ],
            ),
            body: Obx(() => ctl.room.value == null
                ? Center(
                    child: Text(L10n.of(context)!
                        .youAreNoLongerParticipatingInThisChat),
                  )
                : SafeArea(child: _buildViews(context, ctl))),
          );
        });
  }

  Widget _buildViews(BuildContext context, ChatDetailController controller) =>
      Column(
        children: [
          Expanded(
              child: SmartRefresher(
            controller: controller.refreshController,
            onLoading: controller.onLoadMore,
            enablePullUp: controller.hasMoreHistory.isTrue,
            enablePullDown: false,
            scrollController: controller.scrollController,
            footer: buildLoadMoreFooter(),
            child: Scrollable(
                controller: controller.scrollController,
                axisDirection: AxisDirection.up,
                viewportBuilder: (context, offset) {
                  return ExpandedViewport(
                    offset: offset as ScrollPosition,
                    axisDirection: AxisDirection.up,
                    slivers: <Widget>[
                      SliverExpanded(),
                      Obx(
                        () => SliverList(
                            delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                          return Obx(
                            () => ChatMessage(
                              event: controller.messageList[index],
                              timeline: controller.timeline!,
                              onSelect: controller.onSelectMsg,
                              scrollToEventId: (String eventId) =>
                                  controller.scrollToEventId(eventId),
                              longPressSelect:
                                  controller.selectedEvents.isEmpty,
                              onAvatarTab: controller.onNavPersonalDetail,
                              nextEvent:
                                  index < controller.timeline!.events.length - 2
                                      ? controller.timeline!.events[index + 1]
                                      : null,
                              menus: [
                                SeeMenuPopupItemEntity(
                                    title: '3 Seen',
                                    image: R.assetsIconMakeAsReadIcon,
                                    onTap: () {},
                                    avatars: ['', '', '']),
                                MenuPopupItemEntity(
                                    title: 'Thumps Up',
                                    image: R.assetsIconLikeIcon,
                                    onTap: () {}),
                                MenuPopupItemEntity(
                                    title: 'Reply',
                                    image: R.assetsIconReplyIcon,
                                    onTap: () {
                                      controller.onReply(
                                          controller.messageList[index]);
                                    }),
                                MenuPopupItemEntity(
                                    title: 'Pin',
                                    image: R.assetsIconPinIcon,
                                    onTap: () {}),
                                MenuPopupItemEntity(
                                    title: 'Copy',
                                    image: R.assetsIconCopyIcon,
                                    onTap: () {}),
                                MenuPopupItemEntity(
                                    title: 'Forward',
                                    image: R.assetsIconForwardIcon,
                                    onTap: controller.onForwardTo),
                                MenuPopupItemEntity(
                                    title: 'Delete',
                                    image: R.assetsIconDeleteChatIcon,
                                    onTap: () {}),
                                MenuPopupItemEntity(
                                    title: 'Select',
                                    image: R.assetsIconSelectIcon,
                                    onTap: controller.onChangeSelectState),
                                MenuPopupItemEntity(
                                    title: 'Edit',
                                    image: R.assetsIconEditIcon,
                                    onTap: controller.onShowMessageEdits),
                              ],
                              // menuBuilder: (msg) {
                              //   if (msg.content is TextMessage) {
                              //     return buildMenuItemList(controller, msg);
                              //   }
                              //   return [];
                              // },
                            ),
                          );
                        }, childCount: controller.messageList.length)),
                      ),
                    ],
                  );
                }),
          )),
          _buildReplyItem(context, controller),
          _buildInputBar(controller),
          ToolBarPicker(controller),
          ChatEmojiPicker(controller),
        ],
      );

  Widget _buildReplyItem(BuildContext context, ChatDetailController ctl) => Obx(
        () => Visibility(
          visible: ctl.replyMsg.value != null,
          child: Container(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
              top: 17,
              bottom: 7,
            ),
            color: const Color(0x1A353434),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    ctl.onCancelReply();
                  },
                  child: Image.asset(
                    R.assetsIconDeleteBlueIcon,
                    width: 13,
                    height: 13,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0x1A353434),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(0),
                    ),
                  ),
                  constraints: const BoxConstraints(
                    maxWidth: 250,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    ctl.replyMsg.value?.calcLocalizedBodyFallback(
                          MatrixLocals(L10n.of(context)!),
                          hideReply: true,
                          hideEdit: true,
                          plaintextBody: true,
                          removeMarkdown: true,
                          withSenderNamePrefix: false,
                        ) ??
                        '',
                    style: const TextStyle(
                      color: Color(0xFF151515),
                      fontSize: 16,
                      height: 24 / 16,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.mainBlueColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildInputBar(ChatDetailController ctl) => Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Color(0xFFEAEAEA),
          width: 0.5,
        ))),
        padding: const EdgeInsets.only(
          top: 6,
        ),
        margin: EdgeInsets.only(
          bottom: Get.mediaQuery.padding.bottom,
        ),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  R.assetsIconVoiceIcon,
                  width: 14,
                  height: 19,
                )),
            Expanded(
              child: TextField(
                controller: ctl.inputController,
                focusNode: ctl.inputFocus,
                onSubmitted: ctl.onSendMessage,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.send,
                maxLines: null,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  isDense: true,
                  isCollapsed: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0x33353434),
                  )),
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: ctl.onChangeEmojiBox,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 4, right: 4.0, top: 4, bottom: 4),
                child: Ink.image(
                  image: AssetImage(R.assetsIconEmojiIcon),
                  width: 16,
                  height: 16,
                ),
              ),
            ),
            InkWell(
                onTap: ctl.onChangeToolBar,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 4, right: 12.0, top: 4, bottom: 4),
                  child: Ink.image(
                    image: AssetImage(R.assetsIconMoreIcon),
                    width: 16,
                    height: 16,
                  ),
                )),
          ],
        ),
      );

  Widget buildLoadMoreFooter() => Container(
        alignment: Alignment.center,
        child: const Text('更多内容'),
      );
}
