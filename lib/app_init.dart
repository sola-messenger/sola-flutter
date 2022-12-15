// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

// Project imports:
import 'common/index.dart';
import 'common/services/api_service.dart';

class AppInit {
  static Future<void> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await initService();
    initUi();
  }

  static void initUi() {
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  static Future<void> initService() async {
    await Get.putAsync<LoggerService>(() async {
      final sv = LoggerServiceImpl();
      await sv.init();
      return sv;
    });
    await Get.putAsync<CallKeepService>(() async {
      final sv = CallKeepServiceImpl();
      await sv.init();
      return sv;
    });

    await Get.putAsync<InfoService>(() async {
      final sv = InfoServiceImpl();
      await sv.init();
      return sv;
    });

    await Get.putAsync<ApiService>(() async {
      final sv = ApiServiceImpl();
      await sv.init();
      return sv;
    });
  }
}
