import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

mixin AppCrashAnalytics {
  static const bool _isFirebaseCrashlyticsEnabled = false;

  void initCrashAnalytics(SentryFlutterOptions sentryOptions) {
    // Adds request headers and IP for users, visit: https://docs.sentry.io/platforms/dart/data-management/data-collected/ for more info
    sentryOptions.dsn =
        'https://f1f112db574ba564451a1acad83c5252@o4509791506137089.ingest.us.sentry.io/4509791683608576';
    sentryOptions.sendDefaultPii = true;
    sentryOptions.tracesSampleRate = .01;
    sentryOptions.profilesSampleRate = .01;
  }

  void recordError(
    Object error,
    StackTrace stack, {
    String? reason,
    bool fatal = false,
  }) {
    Sentry.captureException(error, stackTrace: stack).ignore();
    if (_isFirebaseCrashlyticsEnabled) {
      FirebaseCrashlytics.instance
          .recordError(error, stack, fatal: fatal, reason: reason)
          .ignore();
    }
  }

  void recordFatal(FlutterErrorDetails details) {
    if (_isFirebaseCrashlyticsEnabled) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(details).ignore();
    }
  }

  void setCustomKey(String key, Object value) {
    if (_isFirebaseCrashlyticsEnabled) {
      FirebaseCrashlytics.instance.setCustomKey(key, value).ignore();
    }
  }

  void log(String message) {
    if (_isFirebaseCrashlyticsEnabled) {
      FirebaseCrashlytics.instance.log(message).ignore();
    }
  }
}

// class CrashlyticsRouteObserver extends RouteObserver<PageRoute<dynamic>> {
//   @override
//   void didPush(Route route, Route? previousRoute) {
//     _setRouteName(route);
//     super.didPush(route, previousRoute);
//   }
//
//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     if (newRoute != null) _setRouteName(newRoute);
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//   }
//
//   @override
//   void didPop(Route route, Route? previousRoute) {
//     if (previousRoute != null) _setRouteName(previousRoute);
//     super.didPop(route, previousRoute);
//   }
//
//   void _setRouteName(Route route) {
//     final name = route.settings.name;
//     if (name != null) {
//       FirebaseCrashlytics.instance.setCustomKey('current_route', name);
//     }
//   }
// }
