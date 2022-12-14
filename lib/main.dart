import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';
import 'package:matrix/matrix.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sola/common/services/api_service.dart';
import 'package:sola/common/widgets/testing.dart';

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
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await initService();
    initUi();
    runApp(
      // debug UI
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    );
  }
}

void initUi() {
  SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

Future<void> initService() async {
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
      unknownRoute: Routers.unknownPage,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: () {
        return Routers.indexRoute;
      }(),
      getPages: Routers.routes,
    );
  }
}
