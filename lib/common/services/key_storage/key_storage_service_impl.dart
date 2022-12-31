import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'key_storage_service.dart';

class KeyStorageServiceImpl extends KeyStorageService {
  late GetStorage storage;
  static const String codeLanguage = 'code_language';

  @override
  Future<void> init() async {
    storage = GetStorage('multi_area_storage');
    await storage.initStorage;
  }

  @override
  Future<String?> getItem(String key) {
    return storage.read('$codeLanguage.$key');
  }

  @override
  Future<void> saveItem(String key, String value) {
    return storage.write('$codeLanguage.$key', value);
  }
}
