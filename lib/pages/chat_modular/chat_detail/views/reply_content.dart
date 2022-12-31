import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/app_constants.dart';
import 'package:sola/common/matrix_locals.dart';

import 'html_message.dart';

class ReplyContent extends StatelessWidget {
  final Event replyEvent;
  final bool ownMessage;
  final Timeline? timeline;

  const ReplyContent(
    this.replyEvent, {
    this.ownMessage = false,
    Key? key,
    this.timeline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget replyBody;
    final timeline = this.timeline;
    final displayEvent =
        timeline != null ? replyEvent.getDisplayEvent(timeline) : replyEvent;
    const fontSize = 14;
    if (AppConstants.renderHtml &&
        [EventTypes.Message, EventTypes.Encrypted]
            .contains(displayEvent.type) &&
        [MessageTypes.Text, MessageTypes.Notice, MessageTypes.Emote]
            .contains(displayEvent.messageType) &&
        !displayEvent.redacted &&
        displayEvent.content['format'] == 'org.matrix.custom.html' &&
        displayEvent.content['formatted_body'] is String) {
      String? html = displayEvent.content['formatted_body'];
      if (displayEvent.messageType == MessageTypes.Emote) {
        html = '* $html';
      }
      replyBody = HtmlMessage(
        html: html!,
        defaultTextStyle: TextStyle(
          color: ownMessage
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
          fontSize: 14,
        ),
        maxLines: 1,
        room: displayEvent.room,
        emoteSize: fontSize * 1.5,
      );
    } else {
      replyBody = Text(
        displayEvent.calcLocalizedBodyFallback(
          MatrixLocals(L10n.of(context)!),
          withSenderNamePrefix: false,
          hideReply: true,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(
          color: ownMessage
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
          fontSize: 14,
        ),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 3,
          height: fontSize * 2 + 6,
          color: ownMessage
              ? Theme.of(context).colorScheme.onPrimary
              : Theme.of(context).colorScheme.onBackground,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<User?>(
                  future: displayEvent.fetchSenderUser(),
                  builder: (context, snapshot) {
                    return Text(
                      '${snapshot.data?.calcDisplayname() ?? displayEvent.senderFromMemoryOrFallback.calcDisplayname()}:',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ownMessage
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onBackground,
                        fontSize: 14,
                      ),
                    );
                  }),
              replyBody,
            ],
          ),
        ),
      ],
    );
  }
}
