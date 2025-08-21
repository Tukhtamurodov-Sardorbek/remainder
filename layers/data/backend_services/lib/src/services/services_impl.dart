import 'package:backend_services/src/firebase/ad_mob/app_ad_mob.dart';
import 'package:backend_services/src/firebase/analytics/impl/app_firebase_analytics.dart';
import 'package:backend_services/src/firebase/remote_config/impl/app_remote_config_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:backend_services/src/services.dart';
import 'package:backend_services/src/sentry/sentry.dart';
import 'package:backend_services/src/firebase/firebase.dart';
import 'package:backend_services/src/sentry/crashlytics/sentry_crashlytics.dart';
import 'package:backend_services/src/firebase/crashlytics/app_firebase_crashlytics.dart';
import 'package:flutter/material.dart' show NavigatorObserver;

part 'services_mixin.dart';

final class AppBackendService extends BackendServices with _ServicesMixin {
  AppBackendService._();

  static AppBackendService? _instance;

  static AppBackendService get instance => _instance ??= AppBackendService._();

  @override
  Future<void> init() async {
    await Future.wait([AppFirebase.ref.init(), AppSentry.ref.init()]);
    await AppRemoteConfig.ref.init();
    await AppAdvertisements.ref.init();
    await AppFirebaseAnalyticsImpl.ref.init();

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
}
