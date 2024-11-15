import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesOperate {
  static Future<void> setLocalId({required String localId}) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    _preferences.setString('localId', localId);
  }

  static Future<String> getLocalId() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    return _preferences.getString('localId') ?? '';
  }

  static Future<void> deleteUserLocalId() async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    await _preferences.clear();
  }
}
