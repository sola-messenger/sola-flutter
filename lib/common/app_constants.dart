// Flutter imports:
import 'package:flutter/foundation.dart';

class AppConstants {
  static var requestDebug = kDebugMode;

  static var apiBaseUrl = '';

  static int connectTimeout = 5000;

  static int receiveTimeout = 50000;

  static const dw = 375.0;
  static const dh = 812.0;

  static const clientName = 'Sola Chat';
  static const databaseName = 'matrix_sola_chat';

  static const homeService = 'matrix.sub1.thetranches.com';

  static bool autoplayImages = false;

  static bool renderHtml = true;

  static const String inviteLinkPrefix = 'https://matrix.to/#/';
  static const String deepLinkPrefix = 'im.fluffychat://chat/';

}

