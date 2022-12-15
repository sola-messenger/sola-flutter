// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/widgets/index.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';

class ChatDetailController extends GetxController {
  final count = 0.obs;
  final fromGroup = FormGroup({
    'input': FormControl(validators: []),
  });
  RefreshController refreshController = RefreshController();
  RxBool hasMoreHistory = false.obs;

  ScrollController scrollController = ScrollController();
  RxList<ChatMessageEntity> groupMessageList = <ChatMessageEntity>[
    ChatMessageEntity(ChatMessageType.time, '11-17 12:09', false),
    ChatMessageEntity(ChatMessageType.text,
        '今天下班之前完成所有的需求文档，进行需求评审，争取早日进入开发阶段，完成这个项目', false),
    ChatMessageEntity(ChatMessageType.time, 'You withdrew a message', false),
    ChatMessageEntity(
        ChatMessageType.time, '\'Alan\' withdrew a message', false),
    ChatMessageEntity(ChatMessageType.time, '11-17 17:09', false),
    ChatMessageEntity(ChatMessageType.text, ' 需求已完成，邮件已发至相关人员，可以进行评审', true),
    ChatMessageEntity(ChatMessageType.time, '10:09', false),
    ChatMessageEntity(ChatMessageType.text, '好的，马上到会议室准备进行需求评审，拉上开发', false),
    ChatMessageEntity(ChatMessageType.text, '好的，收到', true),
    ChatMessageEntity(
        ChatMessageType.voice,
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F57a42b9002e19.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673105488&t=0e38b37fa99d15b017d3ca0bd11d05da',
        true),
    ChatMessageEntity(
        ChatMessageType.image,
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2Ff%2F57a42b9002e19.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1673105488&t=0e38b37fa99d15b017d3ca0bd11d05da',
        false),
  ].reversed.toList().obs;

  RxString userName = 'Jack'.obs;
  RxString avatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  increment() => count.value++;

  void onCallPhone() {}

  void onDropDown() {
    Get.toNamed(Routers.chatSetRoute);

  }

  void onLoadMore() {}

  void onNavPersonalDetail() {
    Get.toNamed(Routers.memberInfoRoute);

  }
}
