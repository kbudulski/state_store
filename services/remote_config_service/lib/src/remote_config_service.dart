import 'dart:convert';
import 'dart:developer';

import 'package:firebase_dependencies/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:remote_config_service/remote_config_service.dart';

class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<void> initialize() async {
    try {
      await _remoteConfig.ensureInitialized();
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 30),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await _remoteConfig.fetchAndActivate();
    } on Exception catch (error, stackTrace) {
      log(
        'Unable to initialize Firebase Remote Config',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void onConfigUpdated(ValueChanged<Set<String>> onChanges) {
    _remoteConfig.onConfigUpdated.listen((event) async {
      final activated = await _remoteConfig.activate();
      if (activated) onChanges.call(event.updatedKeys);
    });
  }

  RemoteData getRemoteData() {
    final json = _remoteConfig.getString(RemoteKeys.sampleJson);
    return RemoteData.fromJson(jsonDecode(json) as Map<String, dynamic>);
  }

  bool getSide() => _remoteConfig.getBool(RemoteKeys.lightSide);
}
