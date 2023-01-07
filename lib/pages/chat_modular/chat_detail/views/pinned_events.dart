import 'dart:async';

import 'package:flutter/material.dart';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';
import 'package:matrix_link_text/link_text.dart';
import 'package:sola/common/matrix_locals.dart';

import 'package:sola/pages/chat_modular/chat_detail/chat_detail_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class PinnedEvents extends StatelessWidget {
  final ChatDetailController controller;

  const PinnedEvents(this.controller, {Key? key}) : super(key: key);

  Future<void> _displayPinnedEventsDialog(
      BuildContext context, List<Event?> events) async {
    final eventId = events.length == 1
        ? events.single?.eventId
        : await showModalActionSheet<String>(
            context: context,
            actions: events
                .map((event) => SheetAction(
                      key: event?.eventId ?? '',
                      label: event?.calcLocalizedBodyFallback(
                            MatrixLocals(L10n.of(context)!),
                            withSenderNamePrefix: true,
                            hideReply: true,
                          ) ??
                          'UNKNOWN',
                    ))
                .toList());

    if (eventId != null) controller.scrollToEventId(eventId);
  }

  @override
  Widget build(BuildContext context) {
    final pinnedEventIds = controller.room.value!.pinnedEventIds;

    if (pinnedEventIds.isEmpty) {
      return Container();
    }
    final completers = pinnedEventIds.map<Completer<Event?>>((e) {
      final completer = Completer<Event?>();
      controller.room.value!
          .getEventById(e)
          .then((value) => completer.complete(value));
      return completer;
    });
    return FutureBuilder<List<Event?>>(
        future: Future.wait(completers.map((e) => e.future).toList()),
        builder: (context, snapshot) {
          final pinnedEvents = snapshot.data;
          final event = (pinnedEvents != null && pinnedEvents.isNotEmpty)
              ? snapshot.data?.last
              : null;

          if (event == null || pinnedEvents == null) {
            return Container();
          }
          return Material(
            color: Theme.of(context).colorScheme.surfaceVariant,
            child: InkWell(
              onTap: () => _displayPinnedEventsDialog(
                context,
                pinnedEvents,
              ),
              child: Row(
                children: [
                  IconButton(
                    splashRadius: 20,
                    iconSize: 20,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    icon: const Icon(Icons.push_pin),
                    tooltip: L10n.of(context)!.unpin,
                    onPressed: controller.room.value
                                ?.canSendEvent(EventTypes.RoomPinnedEvents) ??
                            false
                        ? () => controller.unpinEvent(event.eventId)
                        : null,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: FutureBuilder<String>(
                          future: event.calcLocalizedBody(
                            MatrixLocals(L10n.of(context)!),
                            withSenderNamePrefix: true,
                            hideReply: true,
                          ),
                          builder: (context, snapshot) {
                            return LinkText(
                              text: snapshot.data ??
                                  event.calcLocalizedBodyFallback(
                                    MatrixLocals(L10n.of(context)!),
                                    withSenderNamePrefix: true,
                                    hideReply: true,
                                  ),
                              maxLines: 2,
                              textStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 14,
                                decoration: event.redacted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                              linkStyle: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                              ),
                              onLinkTap: (url) =>
                                  launchUrl(Uri.parse(url)),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
