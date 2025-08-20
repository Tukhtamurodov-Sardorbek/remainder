part of 'app_remote_config_impl.dart';

enum AppRemoteConfigKey {
  sentry('is_sentry_crashlytics_enabled'),
  crashlytics('is_firebase_crashlytics_enabled'),
  firebaseAnalytics('is_firebase_analytics_enabled');

  final String code;

  const AppRemoteConfigKey(this.code);

  static Map<String, dynamic> get defaultParameters {
    return Map.fromEntries(values.map((e) => MapEntry(e.code, true)));
  }
}

mixin _Mixin on AppRemoteConfiguration {
  late final FirebaseRemoteConfig _remoteConfig;

  int getInt(AppRemoteConfigKey key) => _remoteConfig.getInt(key.code);

  bool getBool(AppRemoteConfigKey key) => _remoteConfig.getBool(key.code);

  double getDouble(AppRemoteConfigKey key) => _remoteConfig.getDouble(key.code);

  String getString(AppRemoteConfigKey key) => _remoteConfig.getString(key.code);
}
