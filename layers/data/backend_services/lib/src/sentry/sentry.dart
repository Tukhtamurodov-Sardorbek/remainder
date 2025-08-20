import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

final class AppSentry {
  const AppSentry._();

  static AppSentry? _instance;

  static AppSentry get ref => _instance ??= AppSentry._();

  Future<void> init() {
    SentryWidgetsFlutterBinding.ensureInitialized();
    return SentryFlutter.init((options) async {
      options.debug = kDebugMode;
      options.sendDefaultPii = true;
      options.tracesSampleRate = .01; // performance monitoring
      options.profilesSampleRate = .01; // profiling traces
      options.dsn = await AppEncryptedData.ref.dsn;
      // Request headers and IP, info: https://docs.sentry.io/platforms/dart/data-management/data-collected/
      // options.environment = F.appFlavor == Flavor.STG ? 'staging' : 'production';
    });
  }
}
