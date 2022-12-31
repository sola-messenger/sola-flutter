import 'package:get/get.dart';

abstract class KeyStorageService extends GetxService {
  Future<void> init();
  Future<void> saveItem(String key,String value);

  Future<String?> getItem(String key);

}
