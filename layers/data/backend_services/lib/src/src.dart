import 'package:backend_services/src/crash_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class BackendServices with AppCrashAnalytics {
  const BackendServices._();

  static BackendServices? _instance;

  static BackendServices get instance {
    _instance ??= BackendServices._();
    return _instance!;
  }

  Future<void> init() => SentryFlutter.init((opt) => _initialize(opt));

  Future<void> _initialize(SentryFlutterOptions options) async {
    initCrashAnalytics(options);

    // * Firebase initialization
    await Firebase.initializeApp();

    // * Crashlytics settings
    FlutterError.onError = (details) async {
      FlutterError.presentError(details);
      recordFatal(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      recordError(error, stack, fatal: true);
      return true;
    };

    // * Enable or disable Crashlytics reporting based on environment
    // Disable Crashlytics collection while in debug mode
    // await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  void reportUncaughtErrors(Object error, StackTrace stack) =>
      recordError(error, stack, fatal: true);
}
