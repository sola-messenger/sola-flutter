// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:sola/pages/chat_modular/chat_detail/views/image_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/system_msg_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/text_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/time_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/voice_clip.dart';
import 'package:sola/r.dart';

import '../../../../common/widgets/popu/menu_popup.dart';

enum ChatMessageType {
  text,
  image,
  voice,
  time,
  system,
}

class ChatMessageEntity {
  final ChatMessageType type;
  final String content;
  final bool isOwen;
  final MessageStateType state;

  ChatMessageEntity(this.type, this.content, this.isOwen, this.state);
}

class ChatMessageItem extends StatelessWidget {
  final String nickname;
  final String avatar;
  final VoidCallback onTapAvatar;
  final ChatMessageEntity message;
  final VoidCallback onResend;
  final List<MenuPopupItemEntity> menus;
  final bool isSelectMode;
  final VoidCallback onSelect;

  const ChatMessageItem(
      {super.key,
      required this.nickname,
      required this.avatar,
      required this.onTapAvatar,
      required this.message,
      required this.onResend,
      required this.menus,
      required this.isSelectMode,
      required this.onSelect});

  @override
  Widget build(BuildContext context) {
    Widget child = const SizedBox();
    switch (message.type) {
      case ChatMessageType.image:
        child = ImageClip(
          avatar: avatar,
          content: message.content,
          isOwen: message.isOwen,
          onTapAvatar: onTapAvatar,
        );
        break;
      case ChatMessageType.text:
        child = TextClip(
          avatar: avatar,
          content: message.content,
          isOwen: message.isOwen,
          onTapAvatar: onTapAvatar,
        );
        break;
      case ChatMessageType.voice:
        child = VoiceClip(
            avatar: avatar, content: message.content, isOwen: message.isOwen,
        onTapAvatar: onTapAvatar,);
        break;
      case ChatMessageType.time:
        child = TimeClip(time: message.content);
        break;
      case ChatMessageType.system:
        child = SystemMsgClip(time: message.content);
        break;
    }
    return MenuPopup(
      menuItem: menus,
      menuPopupType: MenuPopupType.messageList,
      child: MessageStateInherited(
        onResend: onResend,
        type: message.state,
        isSelectMode: isSelectMode,
        child: child,
      ),
    );
  }
}

enum MessageStateType {
  read,
  error,
  time,
  done,
}

class MessageStateInherited extends InheritedWidget {
  final VoidCallback onResend;
  final MessageStateType type;
  final bool isSelectMode;

  const MessageStateInherited({
    Key? key,
    required this.onResend,
    required this.type,
    required this.isSelectMode,
    required Widget child,
  }) : super(key: key, child: child);

  static MessageStateInherited of(BuildContext context) {
    final MessageStateInherited? result =
        context.dependOnInheritedWidgetOfExactType<MessageStateInherited>();
    assert(result != null, 'No MessageStateInherited found in context');
    return result!;
  }

  Widget buildSelectIcon() {
    return isSelectMode
        ? Image.asset(
            R.assetsIconUnselectIcon,
            width: 16,
            height: 16,
          )
        : Container();
  }

  Widget buildIcon() {
    Widget child = const SizedBox();
    switch (type) {
      case MessageStateType.read:
        child = Image.asset(R.assetsIconMakeAsReadIcon);
        break;
      case MessageStateType.error:
        child = Image.asset(R.assetsIconInfoIcon);
        break;
      case MessageStateType.time:
        child = Image.asset(R.assetsIconTimeIcon);
        break;
      case MessageStateType.done:
        child = Image.asset(R.assetsIconDoneIcon);
        break;
    }
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 24,
        height: 24,
        margin: const EdgeInsets.only(
          right: 8,
          top: 17,
        ),
        child: child,
      ),
    );
  }

  @override
  bool updateShouldNotify(MessageStateInherited old) {
    return old.onResend != onResend ||
        old.type != type ||
        old.isSelectMode != isSelectMode;
  }
}
