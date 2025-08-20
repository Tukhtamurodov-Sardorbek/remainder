import 'package:core/core.dart';

enum AppFirebaseAnalyticsEvent {
  clickTest;

  String get code => name.toSnakeCase;
}
