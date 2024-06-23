import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  Future<SharedPreferencesService> init() async {
    _instance ??= SharedPreferencesService();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  static const _startUpCheckKey = 'start_up_check_key';
  static const _isDarkMode = 'is_dark_mode';

  bool get isDarkMode => _getFromDisk(_isDarkMode) ?? false;
  set isDarkMode(bool value) => _saveToDisk(_isDarkMode, value);

  bool get startUpCheck => _getFromDisk(_startUpCheckKey) ?? false;
  set startUpCheck(bool value) => _saveToDisk(_startUpCheckKey, value);

  dynamic _getFromDisk(String key) {
    var value = _preferences!.get(key);
    return value;
  }

  void _saveToDisk(String key, dynamic content) {
    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
  }
}
