import 'package:backend_services/src/firebase/analytics/impl/events.dart';
import 'package:backend_services/src/firebase/remote_config/impl/app_remote_config_impl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:backend_services/src/firebase/analytics/app_firebase_analytics.dart';

/// https://firebase.google.com/docs/analytics/events?platform=flutter
final class AppFirebaseAnalyticsImpl implements AppFirebaseAnalytics {
  final FirebaseAnalytics _firebaseAnalytics;

  const AppFirebaseAnalyticsImpl._(this._firebaseAnalytics);

  static AppFirebaseAnalyticsImpl? _instance;

  static AppFirebaseAnalyticsImpl get ref {
    return _instance ??= AppFirebaseAnalyticsImpl._(FirebaseAnalytics.instance);
  }

  FirebaseAnalyticsObserver get observer {
    return FirebaseAnalyticsObserver(analytics: _firebaseAnalytics);
  }

  @override
  Future<void> init() {
    final flag = AppRemoteConfig.ref.getBool(
      AppRemoteConfigKey.firebaseAnalytics,
    );
    if (flag) {
      _firebaseAnalytics.logAppOpen().ignore();
    }
    return _firebaseAnalytics.setAnalyticsCollectionEnabled(flag);
  }

  Future<void> _logEvent(
    AppFirebaseAnalyticsEvent event,
    Map<String, Object> params,
  ) {
    return _firebaseAnalytics.logEvent(name: event.code, parameters: params);
  }

  @override
  Future<void> clickTest() {
    return _logEvent(AppFirebaseAnalyticsEvent.clickTest, {'param1': 'data'});
  }
}
