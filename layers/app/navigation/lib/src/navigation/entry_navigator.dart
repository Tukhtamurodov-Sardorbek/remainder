import 'package:flutter/material.dart';

abstract class EntryNavigator{
  Future<void> navigateOnboardingPage(BuildContext context);
  Future<void> navigateSignUpPage(BuildContext context);
}
