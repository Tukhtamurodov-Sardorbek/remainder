import 'package:core/core.dart';
import 'package:feature_home/feature_home.gr.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart' show MainNavigator, AppRouter;

class MainNavigatorImpl extends MainNavigator {
  final AppRouter _appRouter;

  MainNavigatorImpl(this._appRouter);

  @override
  Future<void> navigateToMainPage(BuildContext context) {
    return context.router.replaceAll([const BaseRoute()]);
  }
}
