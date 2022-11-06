import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  HiveHelper._();
  static late Box _userBoxInstance;
  static Box get userBoxInstance {
    return _userBoxInstance;
  }

  static Future<void> init() async {
    await Hive.initFlutter();
    _userBoxInstance = await Hive.openBox('user');
  }

  static Future<void> storeToken(String token) async {
    await _userBoxInstance.put('token', token);
  }

  static String returnToken() {
    return _userBoxInstance.get('token', defaultValue: '');
  }

  static bool isTokenExists() {
    final token = returnToken();
    if (token == '' || token.isEmpty) return false;
    return true;
  }


  static Future<void> logOut() async {
    await _userBoxInstance.delete('user');
    await _userBoxInstance.delete('token');
  }
}
