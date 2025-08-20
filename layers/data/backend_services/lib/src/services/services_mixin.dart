part of 'services_impl.dart';

mixin _ServicesMixin on BackendServices {
  // * Flags
  bool get _isSentryCrashlyticsEnabled {
    return AppRemoteConfig.ref.getBool(AppRemoteConfigKey.sentry);
  }

  bool get _isFirebaseCrashlyticsEnabled {
    return AppRemoteConfig.ref.getBool(AppRemoteConfigKey.crashlytics);
  }

  void recordFatal(FlutterErrorDetails details) {
    if (_isSentryCrashlyticsEnabled) {
      SentryCrashlytics.ref.recordError(details.exception, details.stack);
    }
    if (_isFirebaseCrashlyticsEnabled) {
      AppFirebaseCrashlytics.ref.recordFatal(details);
    }
  }

  void recordError(
    Object error,
    StackTrace stack, {
    String? reason,
    bool fatal = false,
  }) {
    try {
      if (_isSentryCrashlyticsEnabled) {
        SentryCrashlytics.ref.recordError(error, stack);
      }
      if (_isFirebaseCrashlyticsEnabled) {
        AppFirebaseCrashlytics.ref.recordError(
          error,
          stack,
          fatal: fatal,
          reason: reason,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<NavigatorObserver> get navigationObservers {
    return [AppFirebaseAnalyticsImpl.ref.observer];
  }
}
