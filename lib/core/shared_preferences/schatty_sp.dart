import 'package:shared_preferences/shared_preferences.dart';

class SchattySP {
  //create a singleton
  static final SchattySP _schattySP = SchattySP._internal();
  late SharedPreferences _sharedPreferences;
  factory SchattySP() {
    return _schattySP;
  }

  SchattySP._internal();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    return _sharedPreferences.getBool(key);
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }

  Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }
}
