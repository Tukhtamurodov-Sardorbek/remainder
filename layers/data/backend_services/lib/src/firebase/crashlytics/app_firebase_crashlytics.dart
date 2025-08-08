import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

final class AppFirebaseCrashlytics {
  const AppFirebaseCrashlytics._();

  static AppFirebaseCrashlytics? _instance;

  static AppFirebaseCrashlytics get ref =>
      _instance ??= AppFirebaseCrashlytics._();

  void recordError(
    Object error,
    StackTrace stack, {
    String? reason,
    bool fatal = false,
  }) {
    FirebaseCrashlytics.instance
        .recordError(error, stack, fatal: fatal, reason: reason)
        .ignore();
    return;
  }

  void recordFatal(FlutterErrorDetails details) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(details).ignore();
    return;
  }

  void setCustomKey(String key, Object value) {
    FirebaseCrashlytics.instance.setCustomKey(key, value).ignore();
    return;
  }

  void log(String message) {
    FirebaseCrashlytics.instance.log(message).ignore();
    return;
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
