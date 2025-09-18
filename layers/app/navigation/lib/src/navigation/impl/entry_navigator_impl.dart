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
  Future<void> navigateSignUpPage(
    BuildContext context, {
    bool replace = false,
  }) {
    if (replace) {
      return context.router.replace<bool?>(const SignUpRoute());
    }
    return context.router.push<bool?>(const SignUpRoute());
  }

  @override
  Future<void> navigateSignInPage(
    BuildContext context, {
    bool replace = false,
  }) {
    if (replace) {
      return context.router.replace<bool?>(const SignInRoute());
    }
    return context.router.push<bool?>(const SignInRoute());
  }
}
