// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:sola/pages/chat_modular/chat_detail/views/image_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/text_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/time_clip.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/voice_clip.dart';

enum ChatMessageType{
  text,
  image,
  voice,
  time,
}

class ChatMessageEntity{
  final ChatMessageType type;
  final String content;
  final bool isOwen;

  ChatMessageEntity(this.type, this.content, this.isOwen);

}

class ChatMessageItem extends StatelessWidget {
  final String nickname;
  final String avatar;
  final VoidCallback onTapAvatar;
  final ChatMessageEntity message;
  const ChatMessageItem({super.key, required this.nickname, required this.avatar, required this.onTapAvatar, required this.message});

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case ChatMessageType.image:
      return ImageClip(avatar: avatar, content: message.content, isOwen: message.isOwen,onTapAvatar: onTapAvatar,);
      case ChatMessageType.text:
      return TextClip(avatar: avatar, content: message.content, isOwen: message.isOwen,onTapAvatar: onTapAvatar,);
      case ChatMessageType.voice:
      return VoiceClip(avatar: avatar, content: message.content, isOwen: message.isOwen);
      case ChatMessageType.time:
      return TimeClip(time: message.content);
    }
  }
}
