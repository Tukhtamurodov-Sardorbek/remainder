import 'package:flutter/material.dart' show BuildContext;

abstract class MainNavigator {
  Future<void> navigateToMainPage(BuildContext context);
}
