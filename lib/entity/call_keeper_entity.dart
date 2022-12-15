


// Package imports:
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';

// Project imports:
import 'package:sola/common/services/call_keep_service.dart';

class CallKeeperEntity{

  bool? held = false;
  bool? muted = false;
  bool connected = false;
  final CallSession call;
  CallKeepService callKeepService = Get.find<CallKeepService>();

  CallKeeperEntity(this.call,){
      call.onCallStateChanged.stream.listen(_handleCallState);
  }


void _handleCallState(CallState state) {
    Logs().i('CallKeepManager::handleCallState: ${state.toString()}');
    switch (state) {
      case CallState.kConnecting:
        Logs().v('callkeep connecting');
        break;
      case CallState.kConnected:
        Logs().v('callkeep connected');
        if (!connected) {
          callKeepService.answer(call.callId);
        } else {
          callKeepService.setMutedCall(call.callId, false);
          callKeepService.setOnHold(call.callId, false);
        }
        break;
      case CallState.kEnded:
        callKeepService.hangup(call.callId);
        break;
      /* TODO:
      case CallState.kMuted:
        callKeepManager.setMutedCall(uuid, true);
        break;
      case CallState.kHeld:
        callKeepManager.setOnHold(uuid, true);
        break;
      */
      case CallState.kFledgling:
        // TODO: Handle this case.
        break;
      case CallState.kInviteSent:
        // TODO: Handle this case.
        break;
      case CallState.kWaitLocalMedia:
        // TODO: Handle this case.
        break;
      case CallState.kCreateOffer:
        // TODO: Handle this case.
        break;
      case CallState.kCreateAnswer:
        // TODO: Handle this case.
        break;
      case CallState.kRinging:
        // TODO: Handle this case.
        break;
    }
  }

}
