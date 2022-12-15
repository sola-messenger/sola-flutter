// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/widgets/pull_to_refresh/expanded_viewport.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';
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
              title: Column(
                children: const [
                  Text('Jack'),
                  Text('DCC DEV'),
                ],
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: ctl.onCallPhone,
                  icon: const Icon(Icons.phone),
                ),
                IconButton(
                  onPressed: ctl.onDropDown,
                  icon: const Icon(Icons.menu),
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
                          return ChatMessageItem(
                            nickname: controller.userName.value,
                            message: controller.groupMessageList[index],
                            avatar: controller.avatar.value,
                            onTapAvatar: controller.onNavPersonalDetail,
                            // menuBuilder: (msg) {
                            //   if (msg.content is TextMessage) {
                            //     return buildMenuItemList(controller, msg);
                            //   }
                            //   return [];
                            // },
                          );
                        }, childCount: controller.groupMessageList.length)),
                      ),
                    ],
                  );
                }),
          )),
          _buildInputBar(controller),
        ],
      );

  Widget _buildInputBar(ChatDetailController ctl) => ReactiveForm(
        formGroup: ctl.fromGroup,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          margin: EdgeInsets.only(
            bottom: Get.mediaQuery.padding.bottom,
          ),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings_voice_sharp)),
              Expanded(
                child: ReactiveTextField(
                  formControlName: 'input',
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                      constraints:BoxConstraints(
                        maxHeight: 30,
                      ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            ],
          ),
        ),
      );

  Widget buildLoadMoreFooter() => Container(
        alignment: Alignment.center,
        child: const Text('更多内容'),
      );
}
