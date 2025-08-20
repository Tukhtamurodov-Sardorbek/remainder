import 'dart:async';

import 'package:backend_services/backend_services.dart';
import 'package:flutter/foundation.dart' show debugPrint;
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:backend_services/src/firebase/remote_config/app_remote_config.dart';

part 'helpers.dart';

/// https://firebase.google.com/docs/remote-config/use-cases?authuser=0
final class AppRemoteConfig extends AppRemoteConfiguration with _Mixin {
  AppRemoteConfig._();

  static AppRemoteConfig? _instance;

  static AppRemoteConfig get ref => _instance ??= AppRemoteConfig._();

  @override
  Future<void> init() async {
    _remoteConfig = FirebaseRemoteConfig.instance;
    await _remoteConfig.setDefaults(AppRemoteConfigKey.defaultParameters);

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );

    await _remoteConfig.fetchAndActivate();

    _remoteConfig.onConfigUpdated.listen(
      (event) async {
        // To make fetched parameter values available to app
        await _remoteConfig.activate();
      },
      onError: (e, s) {
        try {
          AppBackendService.instance.recordError(e, s);
        } catch (e) {}
        debugPrint('AppRemoteConfig error: $e');
      },
    );
  }
}
