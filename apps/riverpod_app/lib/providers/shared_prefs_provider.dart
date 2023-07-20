import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_provider.g.dart';

@riverpod
SharedPreferences sharedPrefs(SharedPrefsRef ref) {
  throw UnimplementedError();
}

extension SharePrefsExt on SharedPreferences {
  dynamic getJson(String key) async {
    return json.decode(getString(key) ?? '{}');
  }

  Future<void> setJson(String key, dynamic value) async {
    await setString(key, json.encode(value));
  }
}
