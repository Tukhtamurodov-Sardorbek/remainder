import 'package:design_system/src/theme/app_theme.dart';
import 'package:design_system/src/constants/constants.dart';
import 'package:design_system/src/typography/app_typography.dart';
import 'package:flutter/material.dart' show ThemeData, Typography;

final class AppThemeImpl extends AppTheme with AppTypography {
  AppThemeImpl._();

  static AppThemeImpl? _instance;

  static AppThemeImpl get ref => _instance ??= AppThemeImpl._();

  @override
  ThemeData get data {
    return ThemeData(
      fontFamily: DesignConstants.fontFamily,
      typography: Typography.material2021(),
      textTheme: textTheme,
    );
  }
}
