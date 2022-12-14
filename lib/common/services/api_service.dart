import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../app_constants.dart';

abstract class ApiService extends GetxService {

  Dio get dio;
  
  Future<void> init();
}

/// dio实现
class ApiServiceImpl extends ApiService {
  late Dio _dio;

  @override
  Future<void> init() async {
    // final pkg = await PackageInfo.fromPlatform();
    // String mode = '';
    // final deviceInfo = DeviceInfoPlugin();
    // if (Platform.isAndroid) {
    //   mode = (await deviceInfo.androidInfo).model;
    // } else if (Platform.isIOS) {
    //   mode = (await deviceInfo.iosInfo).model;
    // }
    _dio = Dio(BaseOptions(
      baseUrl: AppConstants.apiBaseUrl,
      connectTimeout: AppConstants.connectTimeout,
      receiveTimeout: AppConstants.receiveTimeout,
      followRedirects: false,
      validateStatus: (status) => status != null && status < 500,
      headers: {
        'Content-Type': 'application/json',
        // 'ver': pkg.version,
        // 'model': mode,
        // 'device-id': await FlutterUdid.udid
      },
    ));
    // _dio.interceptors.add(NftLogInterceptor());
    // _dio.interceptors.add(RequestTokenInterceptor());
    // // _dio.interceptors.add(ResultTokenInterceptor(dio: _dio));
    // _dio.interceptors.add(ResultCodeInterceptor());
    // _dio.interceptors.add(ResultUnwarpDataInterceptor());

  }
  // @override
  // UserApi get userApi => UserApi(_dio);

  // @override
  // NftApi get nftApi => NftApi(_dio);
  
  @override
  Dio get dio => _dio;
  
}
