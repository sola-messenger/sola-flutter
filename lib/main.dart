// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:device_preview/device_preview.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';

// Project imports:
import 'package:sola/app_init.dart';
import 'package:sola/common/index.dart';
import 'package:sola/common/services/client_service.dart';
import 'package:sola/common/style/app_colors.dart';
import 'package:sola/common/widgets/testing.dart';

import 'common/app_constants.dart';
import 'common/widgets/media_query_builder.dart';

void main() async {
  await AppInit.init();
  runApp(
    const MyApp(),
    // // debug UI
    // DevicePreview(
    //   enabled: !kDebugMode,
    //   builder: (context) => const MyApp(),
    // ),
  );
  // if (kReleaseMode) {

  //   runApp(MatrixExampleChat(client: client));
  // } else {
  //
  // }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 移除splash
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      title: 'Sola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              fontSize: 14,
              color: AppColors.textBlackColor,
              fontWeight: FontWeight.w600,
            ),
            color: Color(0xFFEAEAEA),
          )),
      builder: (context, widget) {
        // 设置屏幕适配
        return screenAdapterBuilder(
          builder: (context) {
            return MediaQuery(
              // 设置文字大小不随系统设置改变
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          designSize: const Size(AppConstants.dw, AppConstants.dh),
        );
      },
      unknownRoute: Routers.unknownPage,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: () {
        if (Get.find<ClientService>().client.isLogged()) {
          return Routers.indexRoute;
        }
        return Routers.splashRoute;
      }(),
      getPages: Routers.routes,
    );
  }
}
