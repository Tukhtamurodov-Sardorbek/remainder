import 'package:flutter/material.dart' show NavigatorState, GlobalKey;

final class AppNavigatorKey {
  const AppNavigatorKey._();

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
