import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:entry_feature/entry_feature.dart';

class EntryNavigatorImpl extends EntryNavigator {
  EntryNavigatorImpl();

  @override
  Future<void> navigateOnboardingPage(BuildContext context) {
    return context.router.replace(const OnboardRoute());
  }

  @override
  Future<void> navigateSignUpPage(BuildContext context) {
    return context.router.push<bool?>(const SignUpRoute());
  }
}
