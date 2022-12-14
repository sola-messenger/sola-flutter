// 日志打印
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sola/common/index.dart';

import '../../app_constants.dart';


class NftLogInterceptor extends Interceptor {
  late DateTime _time;

  NftLogInterceptor();

  bool get isDebug => AppConstants.requestDebug;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _time = DateTime.now();
    if (isDebug) {
      Get.find<LoggerService>().write("""
url:    ${options.baseUrl}${options.path}?${options.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}
method: ${options.method}
header: ${options.headers}
params: ${options.method == 'POST' ? options.data is Map ? json.encode(options.data) : options.data : options.queryParameters}""");
    }
    handler.next(options);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    Get.find<LoggerService>().write("""
time:   ${DateTime.now().millisecondsSinceEpoch - _time.millisecondsSinceEpoch}
url:    ${response.requestOptions.baseUrl}${response.requestOptions.path}?${response.requestOptions.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}
method: ${response.requestOptions.method}
header: ${response.requestOptions.headers}
params: ${response.requestOptions.method == 'POST' ? response.requestOptions.data is Map ? json.encode(response.requestOptions.data) : response.requestOptions.data : response.requestOptions.queryParameters}
status: ${response.statusCode}
resp:   ${response.toString()}""");
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // 打印日志
    Get.find<LoggerService>().write("""
time:   ${DateTime.now().millisecondsSinceEpoch - _time.millisecondsSinceEpoch}
url:    ${err.requestOptions.baseUrl}${err.requestOptions.path}?${err.requestOptions.queryParameters.entries.map((e) => '${e.key}=${e.value}').join('&')}
method: ${err.requestOptions.method}
header: ${err.requestOptions.headers}
params: ${err.requestOptions.method == 'POST' ? err.requestOptions.data is Map ? json.encode(err.requestOptions.data) : err.requestOptions.data : err.requestOptions.queryParameters}
status: ${err.response?.statusCode ?? ""}
msg:    ${err.toString()}""");
    handler.next(err);
  }
}