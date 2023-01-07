// Flutter imports:
import 'dart:async';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:future_loading_dialog/future_loading_dialog.dart';

// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:sola/common/extension/ios_badge_client_extension.dart';

// Project imports:
import 'package:sola/common/index.dart';
import 'package:sola/common/matrix_locals.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/widgets/testing.dart';
import 'package:sola/r.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';

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

  Rx<Event?> replyMsg = (null as Event?).obs;
  Rx<Event?> editMsg = (null as Event?).obs;

  bool get isGroup => room.value!.directChatMatrixID == null;

  // RxBool get hasMoreHistory => (timeline != null &&
  //         (timeline!.events.isEmpty ||
  //             timeline!.events.last.type != EventTypes.RoomCreate))
  //     .obs;

  final AutoScrollController scrollController = AutoScrollController();

  RxList<Event> messageList = <Event>[].reversed.toList().obs;
  RxList<Event> selectedEvents = <Event>[].obs;

  RxString userName = 'Jack'.obs;
  RxString avatar = ''.obs;

  RxBool isShowToolBar = false.obs;

  RxBool isSelectState = false.obs;

  RxBool isShowEmojiPicker = false.obs;

  EmojiPickerType emojiPickerType = EmojiPickerType.keyboard;
  late Iterable<Event> _allReactionEvents;

  List<Map<String, dynamic>> get groupToolBar => [
    {
      'title': 'Gallery',
      'image': R.assetsIconGroupImageIcon,
      'onTap': onShowGallery
    },
    {
      'title': 'Voice Call',
      'image': R.assetsIconGroupVoiceCallIcon,
      'onTap': onVoiceCall
    },
    {
      'title': 'Files',
      'image': R.assetsIconGroupFileIcon,
    },
    {
      'title': 'Location',
      'image': R.assetsIconGroupLocationIcon,
    },
  ];

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

  bool get canLoadMore =>
      timeline != null &&
      (timeline!.events.isEmpty ||
          timeline!.events.last.type != EventTypes.RoomCreate);

  final int _loadHistoryCount = 100;

  void _updateScrollController() {
    if (!scrollController.hasClients) return;
    setReadMarker();
    // if (scrollController.position.pixels ==
    //     scrollController.position.maxScrollExtent &&
    //     timeline!.events.isNotEmpty &&
    //     timeline!.events[timeline!.events.length - 1].type !=
    //         EventTypes.RoomCreate) {
    //   requestHistory();
    // }
    // if (scrollController.position.pixels > 0 && showScrollDownButton == false) {
    //   setState(() => showScrollDownButton = true);
    // } else if (scrollController.position.pixels == 0 &&
    //     showScrollDownButton == true) {
    //   setState(() => showScrollDownButton = false);
    // }
  }

  void requestHistory() async {
    if (canLoadMore) {
      try {
        await timeline!.requestHistory(historyCount: _loadHistoryCount);
      } catch (err) {
        rethrow;
      }
    }
  }

  void onShowGallery() async {
    final data = await Get.toNamed(Routers.allImageRoute);
    if (data != null) {}
  }

  void onVoiceCall() {
    Get.toNamed(Routers.callPageRoute);
  }

  @override
  void onInit() async {
    super.onInit();
    room.value = Get.find<ClientService>().client.getRoomById(roomId!);
    if (room.value!.membership == Membership.invite) {
      showFutureLoadingDialog(
          context: Get.overlayContext!, future: () => room.value!.join());
    }

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

    inputFocus.addListener(_inputFocusListener);
    scrollController.addListener(_updateScrollController);
  }

  void _inputFocusListener() {
    if (inputFocus.hasFocus) {
      emojiPickerType = EmojiPickerType.keyboard;
      isShowEmojiPicker.call(false);
      isShowToolBar.call(false);
    }
  }

  /// 刷新消息
  void refreshMessage() {
    if (timeline != null) {
      messageList.assignAll(timeline!.events);
      messageList.refresh();
    }
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
  void onClose() {
    timeline?.cancelSubscriptions();
    timeline = null;
    inputFocus.removeListener(_inputFocusListener);
  }

  /// 菜单选项
  void onDropDown() {
    final directChatMatrixID = room.value!.directChatMatrixID;
    if (directChatMatrixID != null) {
      Get.toNamed(Routers.chatSetRoute, parameters: {
        'roomId': roomId!,
      });
    } else {
      Get.toNamed(Routers.contactGroupSetRoute, parameters: {
        'roomId': roomId!,
      });
    }
  }

  /// 加载更多聊天记录
  void onLoadMore() {
    requestHistory();
  }

  /// 跳转到用户详情
  void onNavPersonalDetail(Event event) async {
    final user = await event.fetchSenderUser();
    if (user?.id == Get.find<ClientService>().client.userID) return;
    Get.toNamed(Routers.memberInfoRoute, parameters: {
      'roomId': event.roomId!,
    });
  }

  void onChangeSelectState(Event event) {
    isSelectState.toggle();
    if (isSelectState.isTrue) {
      selectedEvents.clear();
      selectedEvents.add(event);
      selectedEvents.refresh();
    }
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

  void onShowMessageEdits(Event event) {
    editMsg.call(event);
    editMsg.refresh();
    inputController.text = editMsg.value?.calcLocalizedBodyFallback(
          MatrixLocals(L10n.of(Get.context!)!),
          hideReply: true,
          hideEdit: true,
          plaintextBody: true,
          removeMarkdown: true,
          withSenderNamePrefix: false,
        ) ??
        '';
    // Get.dialog(const MessageEditsDialog());
  }

  void onForwardTo(Event event) async {
    selectedEvents.clear();
    selectedEvents.add(event);
    late Map<String, dynamic> content;
    if (selectedEvents.length == 1) {
      content = selectedEvents.first.getDisplayEvent(timeline!).content;
    } else {
      content = {
        'msgtype': 'm.text',
        'body': _getSelectedEventString(),
      };
    }
    await Get.toNamed(Routers.forwardToRoute, arguments: {
      'events': content,
    });
    selectedEvents.clear();
  }

  String _getSelectedEventString() {
    var copyString = '';
    if (selectedEvents.length == 1) {
      return selectedEvents.first
          .getDisplayEvent(timeline!)
          .calcLocalizedBodyFallback(MatrixLocals(L10n.of(Get.context!)!));
    }
    for (final event in selectedEvents) {
      if (copyString.isNotEmpty) copyString += '\n\n';
      copyString += event.getDisplayEvent(timeline!).calcLocalizedBodyFallback(
          MatrixLocals(L10n.of(Get.context!)!),
          withSenderNamePrefix: true);
    }
    return copyString;
  }

  void onSelectMsg(Event message) {
    if (selectedEvents
        .where((p0) => p0.eventId == message.eventId)
        .isNotEmpty) {
      selectedEvents
          .removeWhere((element) => element.eventId == message.eventId);
    } else {
      selectedEvents.add(message);
    }
    selectedEvents.refresh();
  }

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
    replyMsg.value = null;
    replyMsg.refresh();
    editMsg.value = null;
    editMsg.refresh();
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

  /// 滚动到特定的聊天记录
  void scrollToEventId(String eventId) async {
    var eventIndex = timeline!.events.indexWhere((e) => e.eventId == eventId);
    if (eventIndex == -1) {
      // event id not found...maybe we can fetch it?
      // the try...finally is here to start and close the loading dialog reliably
      await showFutureLoadingDialog(
          context: Get.overlayContext!,
          future: () async {
            // okay, we first have to fetch if the event is in the room
            try {
              final event = await timeline!.getEventById(eventId);
              if (event == null) {
                // event is null...meaning something is off
                return;
              }
            } catch (err) {
              if (err is MatrixException && err.errcode == 'M_NOT_FOUND') {
                // event wasn't found, as the server gave a 404 or something
                return;
              }
              rethrow;
            }
            // okay, we know that the event *is* in the room
            while (eventIndex == -1) {
              if (!canLoadMore) {
                // we can't load any more events but still haven't found ours yet...better stop here
                return;
              }
              try {
                await timeline!.requestHistory(historyCount: _loadHistoryCount);
              } catch (err) {
                if (err is TimeoutException) {
                  // loading the history timed out...so let's do nothing
                  return;
                }
                rethrow;
              }
              eventIndex =
                  timeline!.events.indexWhere((e) => e.eventId == eventId);
            }
          });
    }
    await scrollController.scrollToIndex(
      eventIndex,
      preferPosition: AutoScrollPosition.middle,
    );
    _updateScrollController();
  }

  void onThumpsUp(Event event) async {
    await room.value!.sendReaction(
      event.eventId,
      'thumps up',
    );
  }

  void onCancelSelectState() {
    selectedEvents.clear();
    isSelectState.toggle();
    isSelectState.refresh();
  }

  void onDeleteMessage(Event event) async {
    showFutureLoadingDialog(
        context: Get.overlayContext!,
        future: () async {
          if (event.status.isSent) {
            if (event.canRedact) {
              await event.redactEvent();
            } else {
              final client = Get.find<ClientService>().client;
              final room = client.getRoomById(roomId!)!;
              await Event.fromJson(event.toJson(), room).redactEvent();
            }
          } else {
            await event.remove();
          }
        });
  }

  void unpinEvent(String eventId) async {
    final events = room.value!.pinnedEventIds
      ..removeWhere((oldEvent) => oldEvent == eventId);
    showFutureLoadingDialog(
      context: Get.overlayContext!,
      future: () => room.value!.setPinnedEvents(events),
    );
  }

  void goToNewRoomAction() async {
    final result = await showFutureLoadingDialog(
      context: Get.overlayContext!,
      future: () => room.value!.client.joinRoom(room.value!
          .getState(EventTypes.RoomTombstone)!
          .parsedTombstoneContent
          .replacementRoom),
    );
    await showFutureLoadingDialog(
      context: Get.overlayContext!,
      future: room.value!.leave,
    );
    if (result.error == null) {
      // VRouter.of(context).toSegments(['rooms', result.result!]);
    }
  }

  void onCopyMessage(Event event) {
    Clipboard.setData(ClipboardData(
        text: event.calcLocalizedBodyFallback(
              MatrixLocals(L10n.of(Get.context!)!),
              hideReply: true,
              hideEdit: true,
              plaintextBody: true,
              removeMarkdown: true,
            ) ??
            ''));
  }

  /// 置顶消息
  void onPinEvent(Event event) {
    showFutureLoadingDialog(
        context: Get.overlayContext!,
        future: () async {
          return await room.value!.setPinnedEvents([
            event.eventId,
          ]);
        });
  }

  /// 查看消息详情
  void onInfoTab(Event event) {}

  void onResendMessage(Event event) {
    // room.value!.send
  }
}
