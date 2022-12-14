import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/services/client_service.dart';

class ConnectionStatusHeader extends StatefulWidget {
  const ConnectionStatusHeader({Key? key}) : super(key: key);

  @override
  ConnectionStatusHeaderState createState() => ConnectionStatusHeaderState();
}

class ConnectionStatusHeaderState extends State<ConnectionStatusHeader> {
  late final StreamSubscription _onSyncSub;

  @override
  void initState() {
    _onSyncSub = Get.find<ClientService>().client.onSyncStatus.stream.listen(
          (_) => setState(() {}),
        );
    super.initState();
  }

  @override
  void dispose() {
    _onSyncSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final client = Get.find<ClientService>().client;
    final status = client.onSyncStatus.value ??
        const SyncStatusUpdate(SyncStatus.waitingForResponse);
    final hide = client.onSync.value != null &&
        status.status != SyncStatus.error &&
        client.prevBatch != null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
      height: hide ? 0 : 36,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator.adaptive(
              strokeWidth: 2,
              value: hide ? 1.0 : status.progress,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              status.toLocalizedString(context),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
        ],
      ),
    );
  }
}

extension on SyncStatusUpdate {
  String toLocalizedString(BuildContext context) {
    switch (status) {
      case SyncStatus.waitingForResponse:
        return L10n.of(context)!.loadingPleaseWait;
      case SyncStatus.error:
        return '${error?.exception}';
      case SyncStatus.processing:
      case SyncStatus.cleaningUp:
      case SyncStatus.finished:
      default:
        return L10n.of(context)!.synchronizingPleaseWait;
    }
  }
}
