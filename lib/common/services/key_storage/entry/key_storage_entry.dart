import 'package:get_storage/get_storage.dart';

abstract class KeyStorageEntry<T> {
  final String key;

  final GetStorage box;

  KeyStorageEntry(this.box, this.key);

  Future<void> set(T value);

  T? get();

  void listen(Function(T? value) lister);

}
