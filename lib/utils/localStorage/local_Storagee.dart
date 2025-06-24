import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final GetStorage _box = GetStorage();

  /// Call this once before using any method (e.g., in `main`)
  static Future<void> init() async {
    await GetStorage.init();
  }

  /// Save any value (String, int, double, bool, Map, List)
  static Future<void> saveData<T>(String key, T value) async {
    await _box.write(key, value);
  }

  /// Read value of type T. If key doesn't exist, return defaultValue
  static T? readData<T>(String key, {T? defaultValue}) {
    return _box.read<T>(key) ?? defaultValue;
  }

  /// Read value and cast to Map
  static Map<String, dynamic>? readMap(String key) {
    final data = _box.read(key);
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    return null;
  }

  /// Save a model with toJson()
  static Future<void> saveModel(String key, Map<String, dynamic> json) async {
    await _box.write(key, json);
  }

  /// Read and convert to model using fromJson()
  static T? readModel<T>(
    String key,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    final data = readMap(key);
    if (data != null) {
      return fromJson(data);
    }
    return null;
  }

  /// Remove a specific key
  static Future<void> removeData(String key) async {
    await _box.remove(key);
  }

  /// Clear all storage
  static Future<void> clearData() async {
    await _box.erase();
  }

  /// Check if key exists
  static bool contains(String key) {
    return _box.hasData(key);
  }
}
