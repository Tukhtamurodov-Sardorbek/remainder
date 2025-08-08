import 'package:sentry_flutter/sentry_flutter.dart';

final class SentryCrashlytics {
  const SentryCrashlytics._();

  static SentryCrashlytics? _instance;

  static SentryCrashlytics get ref => _instance ??= SentryCrashlytics._();

  void recordError(Object error, StackTrace? stack) {
    Sentry.captureException(error, stackTrace: stack).ignore();
    return;
  }
}
