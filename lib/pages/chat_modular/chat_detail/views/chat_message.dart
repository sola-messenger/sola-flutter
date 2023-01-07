import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/extension/date_time_extension.dart';
import 'package:sola/common/extension/room_status_extension.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/sola_radio_box.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/avatar.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/chat_message_item.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/message_reactions.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/state_message.dart';
import 'package:sola/pages/chat_modular/chat_detail/views/time_clip.dart';
import 'package:sola/r.dart';

import '../../../../common/widgets/popu/menu_popup.dart';
import 'reply_content.dart';
import 'verification_request_content.dart';

class ChatMessage extends StatelessWidget {
  final Event event;
  final Timeline timeline;
  final bool longPressSelect;
  final bool selected;
  final Event? nextEvent;
  final Room room;

  final void Function(Event)? onSelect;
  final void Function(Event)? onAvatarTab;
  final void Function(Event)? onInfoTab;
  final void Function(String)? scrollToEventId;
  final void Function(Event)? onResend;

  final List<MenuPopupItemEntity>? menus;
  final bool isSelectState;
  final bool isSelect;
  final bool isGroup;

  const ChatMessage(
      {Key? key,
      required this.event,
      required this.timeline,
      this.longPressSelect = false,
      this.selected = false,
      this.onSelect,
      this.onAvatarTab,
      this.onInfoTab,
      this.scrollToEventId,
      this.menus,
      this.nextEvent,
      required this.isSelectState,
      required this.isSelect,
      required this.room,
      this.onResend,
      this.isGroup = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!{
      EventTypes.Message,
      EventTypes.Sticker,
      EventTypes.Encrypted,
      EventTypes.CallInvite
    }.contains(event.type)) {
      if (event.type.startsWith('m.call.')) {
        return Container();
      }
      return StateMessage(event);
    }
    // if (event.type == EventTypes.Message &&
    //     event.messageType == EventTypes.KeyVerificationRequest) {
    //   return VerificationRequestContent(event: event, timeline: timeline);
    // }
    final client = Get.find<ClientService>().client;
    final ownMessage = event.senderId == client.userID;
    final rowMainAxisAlignment =
        ownMessage ? MainAxisAlignment.end : MainAxisAlignment.start;

    final displayEvent = event.getDisplayEvent(timeline);
    final displayTime = event.type == EventTypes.RoomCreate ||
        nextEvent == null ||
        !event.originServerTs.sameEnvironment(nextEvent!.originServerTs);

    const borderRadius = BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
      bottomLeft: Radius.circular(4),
      bottomRight: Radius.circular(4),
    );
    final backgroundColor = ownMessage ? const Color(0xFFCDE8F6) : Colors.white;

    final noBubble = {
          MessageTypes.Video,
          MessageTypes.Image,
          MessageTypes.Sticker,
        }.contains(event.messageType) &&
        !event.redacted;

    if (ownMessage) {
      //有错误信息
      // color = displayEvent.status.isError
      //     ? Colors.redAccent
      //     : Theme.of(context).colorScheme.primary;
    }
    List<Widget> rowChildren = <Widget>[
      const SizedBox(
        width: 6,
      ),
      FutureBuilder<User?>(
          future: event.fetchSenderUser(),
          builder: (context, snapshot) {
            final user = snapshot.data ?? event.senderFromMemoryOrFallback;
            return Avatar(
              mxContent: user.avatarUrl,
              name: user.calcDisplayname(),
              onTap: () => onAvatarTab!(event),
            );
          }),
      const SizedBox(
        width: 6,
      ),
      noBubble
          ? ChatMessageContent(
              event: displayEvent,
              onInfoTab: onInfoTab,
              menus: menus ?? [],
              timeline: timeline,
            )
          : Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: borderRadius,
                  ),
                  constraints: BoxConstraints(
                    maxWidth: isSelectState ? 262 : 273,
                    minWidth: 60,
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 6,
                    bottom: 12,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isGroup == true&&!ownMessage)
                        FutureBuilder<User?>(
                          future: event.fetchSenderUser(),
                          builder: (BuildContext context, snapshot) {
                            return Text(
                              '${snapshot.hasData ? snapshot.data?.displayName : ''}',
                              style: const TextStyle(
                                color: Color(0xFF333333),
                                fontSize: 10,
                                height: 15 / 10,
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                      if (event.relationshipType == RelationshipTypes.reply)
                        FutureBuilder<Event?>(
                          future: event.getReplyEvent(timeline),
                          builder: (BuildContext context, snapshot) {
                            final replyEvent = snapshot.hasData
                                ? snapshot.data!
                                : Event(
                                    eventId: event.relationshipEventId!,
                                    content: {
                                      'msgtype': 'm.text',
                                      'body': '...'
                                    },
                                    senderId: event.senderId,
                                    type: 'm.room.message',
                                    room: event.room,
                                    status: EventStatus.sent,
                                    originServerTs: DateTime.now(),
                                  );
                            return InkWell(
                              onTap: () {
                                if (scrollToEventId != null) {
                                  scrollToEventId!(replyEvent.eventId);
                                }
                              },
                              child: AbsorbPointer(
                                child: ReplyContent(replyEvent,
                                    ownMessage: ownMessage, timeline: timeline),
                              ),
                            );
                          },
                        ),
                      ChatMessageContent(
                        event: displayEvent,
                        onInfoTab: onInfoTab,
                        menus: menus ?? [],
                        timeline: timeline,
                      ),
                      if (event.hasAggregatedEvents(
                          timeline, RelationshipTypes.reaction))
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 6.0,
                          ),
                          child: MessageReactions(event, timeline),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  right: 6,
                  bottom: 5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        event.originServerTs.localizedTime(context),
                        style: const TextStyle(
                          fontSize: 6,
                          height: 9 / 6,
                          color: Color(0xFF6E8597),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      if (ownMessage &&
                          room
                              .getSeenByUsers(timeline, eventId: event.eventId)
                              .isNotEmpty)
                        Image.asset(
                          R.assetsIconMakeAsReadIcon,
                          width: 13,
                          height: 7,
                        )
                    ],
                  ),
                ),
              ],
            )
      //
      //
      // ownMessage
      //     ? Padding(
      //         padding: const EdgeInsets.only(top: 8.0),
      //         child: Center(
      //           child: SizedBox(
      //             width: 16,
      //             height: 16,
      //             child: event.status == EventStatus.sending
      //                 ? const CircularProgressIndicator.adaptive(strokeWidth: 2)
      //                 : event.status == EventStatus.error
      //                     ? const Icon(Icons.error, color: Colors.red)
      //                     : null,
      //           ),
      //         ),
      //       )
      //     : FutureBuilder<User?>(
      //         future: event.fetchSenderUser(),
      //         builder: (context, snapshot) {
      //           final user = snapshot.data ?? event.senderFromMemoryOrFallback;
      //           return Avatar(
      //             mxContent: user.avatarUrl,
      //             name: user.calcDisplayname(),
      //             onTap: () => onAvatarTab!(event),
      //           );
      //         }),
      // Expanded(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(left: 8.0, bottom: 4),
      //         child: ownMessage || event.room.isDirectChat
      //             ? const SizedBox(height: 12)
      //             : FutureBuilder<User?>(
      //             future: event.fetchSenderUser(),
      //             builder: (context, snapshot) {
      //               final displayname = snapshot.data?.calcDisplayname() ??
      //                   event.senderFromMemoryOrFallback.calcDisplayname();
      //               return Text(
      //                 displayname,
      //                 style: const TextStyle(
      //                   fontSize: 12,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               );
      //             }),
      //       ),
      //       Container(
      //         alignment: alignment,
      //         padding: const EdgeInsets.only(left: 8),
      //         child: Material(
      //           color: noBubble ? Colors.transparent : color,
      //           elevation: event.type == EventTypes.Sticker ? 0 : 4,
      //           shadowColor: Colors.black.withAlpha(64),
      //           borderRadius: borderRadius,
      //           clipBehavior: Clip.antiAlias,
      //           child: InkWell(
      //             onTap: longPressSelect ? () {} : () => onSelect!(event),
      //             onLongPress: !longPressSelect ? null : () => onSelect!(event),
      //             borderRadius: borderRadius,
      //             child: Container(
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(16),
      //               ),
      //               padding:
      //               noBubble ? EdgeInsets.zero : const EdgeInsets.all(16),
      //               child: Stack(
      //                 children: <Widget>[
      //                   Column(
      //                     mainAxisSize: MainAxisSize.min,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: <Widget>[
      //                       if (event.relationshipType ==
      //                           RelationshipTypes.reply)
      //                         FutureBuilder<Event?>(
      //                           future: event.getReplyEvent(timeline),
      //                           builder: (BuildContext context, snapshot) {
      //                             final replyEvent = snapshot.hasData
      //                                 ? snapshot.data!
      //                                 : Event(
      //                               eventId: event.relationshipEventId!,
      //                               content: {
      //                                 'msgtype': 'm.text',
      //                                 'body': '...'
      //                               },
      //                               senderId: event.senderId,
      //                               type: 'm.room.message',
      //                               room: event.room,
      //                               status: EventStatus.sent,
      //                               originServerTs: DateTime.now(),
      //                             );
      //                             return InkWell(
      //                               onTap: () {
      //                                 if (scrollToEventId != null) {
      //                                   scrollToEventId!(replyEvent.eventId);
      //                                 }
      //                               },
      //                               child: AbsorbPointer(
      //                                 child: Container(
      //                                   margin: const EdgeInsets.symmetric(
      //                                       vertical: 4.0),
      //                                   child: ReplyContent(replyEvent,
      //                                       ownMessage: ownMessage,
      //                                       timeline: timeline),
      //                                 ),
      //                               ),
      //                             );
      //                           },
      //                         ),
      //                       if (event.hasAggregatedEvents(
      //                           timeline, RelationshipTypes.edit))
      //                         Padding(
      //                           padding: const EdgeInsets.only(top: 4.0),
      //                           child: Row(
      //                             mainAxisSize: MainAxisSize.min,
      //                             children: [
      //                               const Icon(
      //                                 Icons.edit_outlined,
      //                                 size: 14,
      //                               ),
      //                               Text(
      //                                 ' - ${displayEvent.originServerTs
      //                                     .localizedTimeShort(context)}',
      //                                 style: const TextStyle(
      //                                   fontSize: 12,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                         ),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    ];
    if (ownMessage) {
      // 右边
      rowChildren = rowChildren.reversed.toList();
    }
    final row = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: rowMainAxisAlignment,
      children: [
        if (isSelectState == true) ...[
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 18,
            ),
            child: SolaRadioBox(
                isSelect: isSelect,
                onChange: () {
                  onSelect?.call(event);
                }),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: rowMainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (displayEvent.status.isError && ownMessage)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    right: 5,
                  ),
                  child: Image.asset(
                    R.assetsIconInfoIcon,
                    width: 17,
                    height: 17,
                  ),
                ),
              // MessageStateInherited.of(context).buildSelectIcon(),
              ...rowChildren
            ],
          ))
        ] else ...[
          if (displayEvent.status.isError && ownMessage)
            Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                right: 5,
              ),
              child: Image.asset(
                R.assetsIconInfoIcon,
                width: 17,
                height: 17,
              ),
            ),
          // MessageStateInherited.of(context).buildSelectIcon(),
          ...rowChildren,
        ]
      ],
    );

    Widget container;
    container = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          ownMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        if (event.hasAggregatedEvents(timeline, RelationshipTypes.reaction) ||
            displayTime ||
            selected)
          TimeClip(time: event.originServerTs.localizedTime(context)),
        row,
        if (displayEvent.status.isError && ownMessage)
          Padding(
            padding: const EdgeInsets.only(right: 59.0),
            child: InkWell(
              onTap: () {
                onResend?.call(event);
              },
              child: Text(
                'Resend'.tr,
                style: const TextStyle(
                  fontSize: 10,
                  height: 15 / 10,
                  color: AppColors.mainDarkRedColor,
                ),
              ),
            ),
          ),
        const SizedBox(
          height: 18,
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2,
        vertical: 2,
      ),
      child: container,
    );
  }
}
