import 'package:flutter/material.dart';

abstract class EntryNavigator {
  Future<void> navigateOnboardingPage(BuildContext context);

  Future<void> navigateSignUpPage(BuildContext context, {bool replace = false});

  Future<void> navigateSignInPage(BuildContext context, {bool replace = false});
}
