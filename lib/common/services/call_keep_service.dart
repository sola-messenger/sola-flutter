import 'dart:async';

import 'package:callkeep/callkeep.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:matrix/matrix.dart';
import 'package:sola/common/services/info_service.dart';
import 'package:sola/common/services/logger_service.dart';
import 'package:sola/entity/call_keeper_entity.dart';

abstract class CallKeepService extends GetxService {
  Future<void> init();

  Stream<CallState> get callStateStream;

  ///呼叫
  void answer(String callId);

  ///静音
  void setMutedCall(String callId, bool bool);

  ///hold住
  void setOnHold(String callId, bool bool);

  ///挂起
  void hangup(String callId);
}

class CallKeepServiceImpl extends CallKeepService {
  FlutterCallkeep? _callkeep;
  Map<String?, CallKeeperEntity> calls = <String?, CallKeeperEntity>{};

  String get appName => Get.find<InfoService>().appName;

  Map<String, dynamic> get alertOptions => <String, dynamic>{
        'alertTitle': 'Permissions required',
        'alertDescription':
            'Allow $appName to register as a calling account? This will allow calls to be handled by the native android dialer.',
        'cancelButton': 'Cancel',
        'okButton': 'ok',
        // Required to get audio in background when using Android 11
        'foregroundService': {
          'channelId': 'com.fluffy.fluffychat',
          'channelName': 'Foreground service for my app',
          'notificationTitle': '$appName is running on background',
          'notificationIcon': 'mipmap/ic_notification_launcher',
        },
        'additionalPermissions': [''],
      };

  @override
  Future<void> init() async {
    _callkeep = FlutterCallkeep()
      ..on(CallKeepPerformAnswerCallAction(), answerCall)
      ..on(CallKeepDidPerformDTMFAction(), didPerformDTMFAction)
      ..on(CallKeepDidReceiveStartCallAction(), didReceiveStartCallAction)
      ..on(CallKeepDidToggleHoldAction(), didToggleHoldCallAction)
      ..on(CallKeepDidPerformSetMutedCallAction(), didPerformSetMutedCallAction)
      ..on(CallKeepPerformEndCallAction(), endCall)
      ..on(CallKeepPushKitToken(), onPushKitToken)
      ..on(CallKeepDidDisplayIncomingCall(), didDisplayIncomingCall);
    Get.find<LoggerService>().write('[Call Keep Service] init');
  }

  @override
  Stream<CallState> get callStateStream => throw UnimplementedError();

  void onPushKitToken(CallKeepPushKitToken event) {
    Logs().v('[onPushKitToken] token => ${event.token}');
  }

  void didDisplayIncomingCall(CallKeepDidDisplayIncomingCall event) {
    final callUUID = event.callUUID;
    final number = event.handle;
    Logs().v('[displayIncomingCall] $callUUID number: $number');
    // addCall(callUUID, CallKeeper(this null));
  }

  Future<void> didPerformDTMFAction(CallKeepDidPerformDTMFAction event) async {
    final keeper = calls[event.callUUID]!;
    keeper.call.sendDTMF(event.digits!);
  }

  void removeCall(String? callUUID) {
    calls.remove(callUUID);
  }

  void setCallMuted(String? callUUID, bool? muted) {
    calls[callUUID]!.muted = muted;
  }

  Future<void> endCall(CallKeepPerformEndCallAction event) async {
    final keeper = calls[event.callUUID];
    keeper?.call.hangup();
    removeCall(event.callUUID);
  }

  Future<void> didPerformSetMutedCallAction(
      CallKeepDidPerformSetMutedCallAction event) async {
    final keeper = calls[event.callUUID];
    if (event.muted!) {
      keeper!.call.setMicrophoneMuted(true);
    } else {
      keeper!.call.setMicrophoneMuted(false);
    }
    setCallMuted(event.callUUID, event.muted);
  }

  /// CallActions.
  Future<void> answerCall(CallKeepPerformAnswerCallAction event) async {
    final callUUID = event.callUUID;
    final keeper = calls[event.callUUID]!;
    if (!keeper.connected) {
      Logs().e('answered');
      // Answer Call
      keeper.connected = true;
    }
    Timer(const Duration(seconds: 1), () {
      _callkeep?.setCurrentCallActive(callUUID!);
    });
  }

  Future<void> didToggleHoldCallAction(
      CallKeepDidToggleHoldAction event) async {
    final keeper = calls[event.callUUID];
    if (event.hold!) {
      keeper!.call.setRemoteOnHold(true);
    } else {
      keeper!.call.setRemoteOnHold(false);
    }
    setCallHeld(event.callUUID, event.hold);
  }

  void setCallHeld(String? callUUID, bool? held) {
    calls[callUUID]!.held = held;
  }

  void addCall(String? callUUID, CallKeeperEntity callKeeper) {
    if (calls.containsKey(callUUID)) return;
    calls[callUUID] = callKeeper;
  }

  Future<void> didReceiveStartCallAction(
      CallKeepDidReceiveStartCallAction event) async {
    if (event.handle == null) {
      // @TODO: sometime we receive `didReceiveStartCallAction` with handle` undefined`
      return;
    }
    final callUUID = event.callUUID!;
    if (event.callUUID == null) {
      // final call =
      // await _voipPlugin!.voip.inviteToCall(event.handle!, CallType.kVideo);
      // addCall(callUUID, CallKeeperEntity(call));
    }
    await _callkeep?.startCall(callUUID, event.handle!, event.handle!);
    Timer(const Duration(seconds: 1), () {
      _callkeep?.setCurrentCallActive(callUUID);
    });
  }

  @override
  void answer(String callId) async {
    final keeper = calls[callId]!;
    if (!keeper.connected) {
      await _callkeep?.answerIncomingCall(callId!);
      keeper.connected = true;
    }
  }

  @override
  void hangup(String callId) async {
    await _callkeep?.endCall(callId);
    removeCall(callId);
  }

  @override
  void setMutedCall(String callId, bool bool) async {
    await _callkeep?.setMutedCall(callId, bool);
    setCallMuted(callId, bool);
  }

  @override
  void setOnHold(String callId, bool bool) async {
    await _callkeep?.setOnHold(callId, bool);
    setCallHeld(callId, bool);
  }
}
