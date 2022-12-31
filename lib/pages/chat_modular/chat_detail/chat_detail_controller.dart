// Flutter imports:
import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sola/common/extension/ios_badge_client_extension.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/widgets/dialog/message_edits_dialog.dart';
import 'package:sola/common/widgets/testing.dart';
import 'package:sola/pages/chat_modular/forward_to/forward_to_view.dart';
import 'package:sola/r.dart';

enum EmojiPickerType { reaction, keyboard }

class ChatDetailController extends GetxController {
  TextEditingController inputController = TextEditingController();
  FocusNode inputFocus = FocusNode();
  Timer? typingCoolDown;
  Timer? typingTimeout;
  bool currentlyTyping = false;

  String? roomId = Get.parameters['roomId'];
  Rx<Room?> room = (null as Room?).obs;
  Timeline? timeline;

  RefreshController refreshController = RefreshController();
  RxBool hasMoreHistory = false.obs;
  Rx<Event?> replyMsg = (null as Event?).obs;
  Rx<Event?> editMsg = (null as Event?).obs;

  ScrollController scrollController = ScrollController();
  RxList<Event> messageList = <Event>[].reversed.toList().obs;

  RxString userName = 'Jack'.obs;
  RxString avatar = ''.obs;

  List<Event> selectedEvents = [];

  RxBool isShowToolBar = false.obs;

  RxBool isSelectState = false.obs;

  RxBool isShowEmojiPicker = false.obs;

  EmojiPickerType emojiPickerType = EmojiPickerType.keyboard;
  late Iterable<Event> _allReactionEvents;

  List<Map<String, dynamic>> get toolbar => [
        {
          'title': 'Gallery',
          'image': R.assetsIconChatGalleryIcon,
          'onTap': onShowGallery
        },
        {
          'title': 'Voice Call',
          'image': R.assetsIconChatVoiceCallIcon,
          'onTap': onVoiceCall
        },
        {
          'title': 'Voice Input',
          'image': R.assetsIconChatVoicceInputIcon,
        },
        {
          'title': 'Files',
          'image': R.assetsIconChatFileIcon,
        },
        {
          'title': 'Location',
          'image': R.assetsIconChatLocationIcon,
        },
        {
          'title': 'Contact',
          'image': R.assetsIconChatContactIcon,
        },
      ];

  void onShowGallery() async {
    List<AssetEntity>? data = await Get.toNamed(Routers.allImageRoute);
    if (data != null) {}
  }

  void onVoiceCall() {
    Get.toNamed(Routers.callPageRoute);
  }

  @override
  void onInit() async {
    super.onInit();
    room.value = Get.find<ClientService>().client.getRoomById(roomId!);
    await Get.find<ClientService>().client.roomsLoading;
    await Get.find<ClientService>().client.accountDataLoading;
    timeline = await room.value!.getTimeline(onUpdate: refresh);
    if (timeline!.events.isNotEmpty) {
      if (room.value!.markedUnread) room.value!.markUnread(false);
      setReadMarker();
    }

    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // final event = VRouter.of(context).queryParameters['event'];
      // if (event != null) {
      //   scrollToEventId(event);
      // }
      // _updateScrollController();
    });
    timeline!.requestKeys(onlineKeyBackupOnly: false);
    room.value!.onUpdate.stream
        .rateLimit(const Duration(seconds: 1))
        .listen((event) {
      refreshMessage();
    });
    refreshMessage();

    inputFocus.addListener(() {
      if (inputFocus.hasFocus) {
        emojiPickerType = EmojiPickerType.keyboard;
        isShowEmojiPicker.call(false);
        isShowToolBar.call(false);
      }
    });
  }

  /// 刷新消息
  void refreshMessage() {
    messageList.assignAll(timeline!.events);
    messageList.refresh();
  }

  Future<void>? _setReadMarkerFuture;

  /// 设置为已读
  void setReadMarker([_]) {
    if (_setReadMarkerFuture == null &&
        (room.value!.hasNewMessages || room.value!.notificationCount > 0) &&
        timeline != null &&
        timeline!.events.isNotEmpty) {
      Logs().v('Set read marker...');
      // ignore: unawaited_futures
      _setReadMarkerFuture = timeline!.setReadMarker().then((_) {
        _setReadMarkerFuture = null;
      });
      room.value!.client.updateIosBadge();
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onDropDown() {
    Get.toNamed(Routers.chatSetRoute, parameters: {
      'roomId': roomId!,
    });
  }

  void onLoadMore() {}

  void onNavPersonalDetail(Event event) async {
    final user = await event.fetchSenderUser();
    if (user?.id == Get.find<ClientService>().client.userID) return;
    Get.toNamed(Routers.memberInfoRoute, parameters: {
      'roomId': event.roomId!,
    });
  }

  void onChangeSelectState() {
    isSelectState.call(isSelectState.toggle().value);
    isSelectState.refresh();
  }

  void onReply(Event event) {
    replyMsg.call(event);
    replyMsg.refresh();
  }

  void onCancelReply() {
    replyMsg.value = null;
    replyMsg.refresh();
  }

  void onShowMessageEdits() {
    Get.dialog(const MessageEditsDialog());
  }

  void onForwardTo() {
    Get.dialog(const ForwardToPage());
  }

  void onSelectMsg(Event message) {}

  void scrollToEventId(String eventId) async {}

  void onSendMessage(String value) {
    final content = value;
    if (content.trim().isEmpty) return;

    // final commandMatch = RegExp(r'^\/(\w+)').firstMatch(content);
    // if (commandMatch != null &&
    //     !room.value!.client.commands.keys.contains(commandMatch[1]!.toLowerCase())) {
    //   final l10n = L10n.of(Get.overlayContext!)!;
    //   final dialogResult = await showOkCancelAlertDialog(
    //     context: context,
    //     useRootNavigator: false,
    //     title: l10n.commandInvalid,
    //     message: l10n.commandMissing(commandMatch[0]!),
    //     okLabel: l10n.sendAsText,
    //     cancelLabel: l10n.cancel,
    //   );
    //   if (dialogResult == OkCancelResult.cancel) return;
    //   parseCommands = false;
    // }
    room.value!.sendTextEvent(content,
        inReplyTo: replyMsg.value,
        editEventId: editMsg.value?.eventId,
        parseCommands: false);
    inputController.text = '';
  }

  void onEmojiSelected(Category? category, Emoji emoji) {
    switch (emojiPickerType) {
      case EmojiPickerType.reaction:
        senEmojiReaction(emoji);
        break;
      case EmojiPickerType.keyboard:
        typeEmoji(emoji);
        onInputBarChanged(inputController.text);
        break;
    }
  }

  void onInputBarChanged(String text) {
    setReadMarker();
    // if (text.endsWith(' ') && matrix!.hasComplexBundles) {
    //   final clients = currentRoomBundle;
    //   for (final client in clients) {
    //     final prefix = client!.sendPrefix;
    //     if ((prefix.isNotEmpty) &&
    //         text.toLowerCase() == '${prefix.toLowerCase()} ') {
    //       setSendingClient(client);
    //       return;
    //     }
    //   }
    // }
    typingCoolDown?.cancel();
    typingCoolDown = Timer(const Duration(seconds: 2), () {
      typingCoolDown = null;
      currentlyTyping = false;
      room.value!.setTyping(false);
    });
    typingTimeout ??= Timer(const Duration(seconds: 30), () {
      typingTimeout = null;
      currentlyTyping = false;
    });
    if (!currentlyTyping) {
      currentlyTyping = true;
      room.value!
          .setTyping(true, timeout: const Duration(seconds: 30).inMilliseconds);
    }
    // setState(() => inputText = text);
  }

  void senEmojiReaction(Emoji? emoji) {
    isShowEmojiPicker.call(false);
    isShowEmojiPicker.refresh();
    if (emoji == null) return;
    // make sure we don't send the same emoji twice
    if (_allReactionEvents
        .any((e) => e.content['m.relates_to']['key'] == emoji.emoji)) return;
    return sendEmojiAction(emoji.emoji);
  }

  void typeEmoji(Emoji? emoji) {
    if (emoji == null) return;
    final text = inputController.text;

    final selection = inputController.selection;
    final newText = inputController.text.isEmpty
        ? emoji.emoji
        : text.replaceRange(selection.start, selection.end, emoji.emoji);
    inputController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(
        // don't forget an UTF-8 combined emoji might have a length > 1
        offset: selection.baseOffset + emoji.emoji.length,
      ),
    );
  }

  void sendEmojiAction(String? emoji) async {
    final events = List<Event>.from(selectedEvents);
    selectedEvents.clear();
    for (final event in events) {
      await room.value!.sendReaction(
        event.eventId,
        emoji!,
      );
    }
  }

  void emojiPickerBackspace() {
    switch (emojiPickerType) {
      case EmojiPickerType.reaction:
        isShowEmojiPicker.toggle();
        break;
      case EmojiPickerType.keyboard:
        inputController
          ..text = inputController.text.characters.skipLast(1).toString()
          ..selection = TextSelection.fromPosition(
              TextPosition(offset: inputController.text.length));
        break;
    }
  }

  void onChangeEmojiBox() {
    void _onChangeEmojiBox() {
      if (isShowEmojiPicker.isTrue) {
        isShowEmojiPicker.toggle();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 150));
          inputFocus.requestFocus();
        });
      } else {
        inputFocus.unfocus();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 150));
          isShowEmojiPicker.toggle();
          await Future.delayed(const Duration(milliseconds: 200));
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn);
        });
      }
    }

    if (isShowToolBar.isTrue) {
      isShowToolBar.toggle();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 150));
        _onChangeEmojiBox();
      });
    } else {
      _onChangeEmojiBox();
    }
  }

  void onChangeToolBar() {
    void _onChangeToolBar() {
      if (isShowToolBar.isTrue) {
        isShowToolBar.toggle();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 150));
          inputFocus.requestFocus();
        });
      } else {
        inputFocus.unfocus();
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await Future.delayed(const Duration(milliseconds: 150));
          isShowToolBar.toggle();
          await Future.delayed(const Duration(milliseconds: 200));
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeIn);
        });
      }
    }

    if (isShowEmojiPicker.isTrue) {
      isShowEmojiPicker.toggle();
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await Future.delayed(const Duration(milliseconds: 150));
        _onChangeToolBar();
      });
    } else {
      _onChangeToolBar();
    }
  }
}
