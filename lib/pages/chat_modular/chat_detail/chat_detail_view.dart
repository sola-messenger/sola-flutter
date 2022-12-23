// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/popu/menu_popup.dart';

// Project imports:
import 'package:sola/common/widgets/pull_to_refresh/expanded_viewport.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';
import 'package:sola/r.dart';
import '../../../common/widgets/index.dart';
import 'chat_detail_controller.dart';

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
                  const Text(
                    'Jack',
                    style: TextStyle(
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
            body: SafeArea(child: _buildViews(ctl)),
          );
        });
  }

  Widget _buildViews(ChatDetailController controller) => Column(
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
                            () => ChatMessageItem(
                              nickname: controller.userName.value,
                              message: controller.groupMessageList[index],
                              avatar: controller.avatar.value,
                              onTapAvatar: controller.onNavPersonalDetail,
                              onResend: () {},
                              isSelectMode: controller.isSelectState.value,
                              onSelect: () {},
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
                                          controller.groupMessageList[index]);
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
                        }, childCount: controller.groupMessageList.length)),
                      ),
                    ],
                  );
                }),
          )),
          _buildReplyItem(controller),
          _buildInputBar(controller),
          _buildToolBar(controller),
        ],
      );

  Widget _buildReplyItem(ChatDetailController ctl) => Obx(
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
                    ctl.replyMsg.value?.content ?? '',
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

  Widget _buildInputBar(ChatDetailController ctl) => ReactiveForm(
        formGroup: ctl.fromGroup,
        child: Container(
          decoration: const BoxDecoration(
              border: Border(
                  top: BorderSide(
            color: Color(0xFFEAEAEA),
            width: 0.5,
          ))),
          padding: const EdgeInsets.only(
            top: 37,
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
                child: ReactiveTextField(
                  formControlName: 'input',
                  decoration: const InputDecoration(
                    fillColor: Color(0xFFEAEAEA),
                    filled: true,
                    constraints: BoxConstraints(
                      maxHeight: 25,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    R.assetsIconEmojiIcon,
                    width: 16,
                    height: 16,
                  )),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () {
                    ctl.isShowToolBar.call(!ctl.isShowToolBar.isTrue);
                    ctl.isShowToolBar.refresh();
                  },
                  child: Image.asset(
                    R.assetsIconMoreIcon,
                    width: 16,
                    height: 16,
                  )),
              const SizedBox(
                width: 12,
              ),
            ],
          ),
        ),
      );

  Widget buildLoadMoreFooter() => Container(
        alignment: Alignment.center,
        child: const Text('更多内容'),
      );

  _buildToolBar(ChatDetailController controller) => Obx(() => Visibility(
      visible: controller.isShowToolBar.value,
      child: Container(
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 10,
        ),
        child: Wrap(
          runSpacing: 36,
          children: controller.toolbar
              .map((e) => InkWell(
                    onTap: e['onTap'],
                    child: SizedBox(
                      width: (Get.mediaQuery.size.width -
                              Get.mediaQuery.padding.left -
                              Get.mediaQuery.padding.right) /
                          3,
                      child: Column(
                        children: [
                          Image.asset(
                            '${e['image']}',
                            width: 28,
                            height: 28,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            '${e['title']}',
                            style: const TextStyle(
                              fontSize: 14,
                              height: 21 / 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      )));
}
