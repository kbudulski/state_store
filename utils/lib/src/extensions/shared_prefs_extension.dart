import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

extension SharePrefsExt on SharedPreferences {
  dynamic getJson(String key) async {
    return json.decode(getString(key) ?? '{}');
  }

  Future<void> setJson(String key, dynamic value) async {
    await setString(key, json.encode(value));
  }
}
