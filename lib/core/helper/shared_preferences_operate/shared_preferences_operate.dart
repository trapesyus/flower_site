import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesOperate {
  static Future<void> getLocalId({required String localId}) async {
    final SharedPreferences _preferences =
        await SharedPreferences.getInstance();
    _preferences.setString('localId', localId);
  }
}
