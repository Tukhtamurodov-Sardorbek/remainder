import 'package:flutter/foundation.dart';
import 'package:backend_services/src/sentry/sentry.dart';
import 'package:backend_services/src/firebase/firebase.dart';
import 'package:backend_services/src/sentry/crashlytics/sentry_crashlytics.dart';
import 'package:backend_services/src/firebase/crashlytics/app_firebase_crashlytics.dart';

final class BackendServices {
  const BackendServices._();

  static BackendServices? _instance;

  static BackendServices get instance => _instance ??= BackendServices._();

  // * Flags
  static const bool _isSentryCrashlyticsEnabled = true;
  static const bool _isFirebaseCrashlyticsEnabled = true;

  Future<void> init() async {
    await Future.wait([AppSentry.ref.init(), AppFirebase.ref.init()]);

    // * Crash analytics settings
    FlutterError.onError = (details) async {
      FlutterError.presentError(details);
      recordFatal(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack, fatal: true);
      return true;
    };
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
}
