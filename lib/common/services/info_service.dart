


import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';
abstract class InfoService extends GetxService{

  Future<void> init();

  /// 获取设备信息
  BaseDeviceInfo get deviceInfo;

  String get appName;
  PackageInfo get packageInfo;
  
}



class InfoServiceImpl extends InfoService{
  BaseDeviceInfo? _deviceInfo;
  PackageInfo? _packageInfo;
  @override
  Future<void> init() async{
    _deviceInfo = await  DeviceInfoPlugin().deviceInfo;
    _packageInfo = await PackageInfo.fromPlatform();

  }
  
  @override
  BaseDeviceInfo get deviceInfo => _deviceInfo!;
  
  @override
  String get appName => 'Sola';
  
  @override
  PackageInfo get packageInfo => _packageInfo!;

}