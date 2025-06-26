import 'package:get_storage/get_storage.dart';

class AbLocalStorage {
  static final AbLocalStorage _instance = AbLocalStorage._internal();

  factory AbLocalStorage() {
    return _instance;
  }

  AbLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String key) async {
    await _storage.remove(key); // ✅ Fixed: removed wrong `value` param
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}
