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
import 'package:sola/common/widgets/testing.dart';

import 'common/app_constants.dart';
import 'common/widgets/media_query_builder.dart';

void main() async {
  if (kReleaseMode) {
    WidgetsFlutterBinding.ensureInitialized();
    final client = Client(
      'Sola Chat',
      databaseBuilder: (_) async {
        final dir = await getApplicationSupportDirectory();
        final db = HiveCollectionsDatabase('matrix_sola_chat', dir.path);
        await db.open();
        return db;
      },
    );
    await client.init();
    runApp(MatrixExampleChat(client: client));
  } else {
    await AppInit.init();
    runApp(
      // debug UI
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );
  }
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
      ),
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
        return Routers.registerRoute;
      }(),
      getPages: Routers.routes,
    );
  }
}
