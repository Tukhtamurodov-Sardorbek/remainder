import 'package:design_system/src/constants/constants.dart';
import 'package:design_system/src/extensions/text_style_ext.dart';
import 'package:design_system/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

mixin AppTypography on AppTheme {
  TextStyle? _textStyleCached;

  TextStyle get _style {
    return _textStyleCached ??= TextStyle(
      height: 1.2,
      letterSpacing: 0.0,
      decoration: TextDecoration.none,
      fontFamily: DesignConstants.fontFamily,
    );
  }

  TextTheme get textTheme {
    /// The **2021** spec has fifteen text styles:
    ///
    /// | NAME           | SIZE |  HEIGHT |  WEIGHT |  SPACING |             |
    /// |----------------|------|---------|---------|----------|-------------|
    /// | displayLarge   | 57.0 |   64.0  | regular | -0.25    |             |
    /// | displayMedium  | 45.0 |   52.0  | regular |  0.0     |             |
    /// | displaySmall   | 36.0 |   44.0  | regular |  0.0     |             |
    /// | headlineLarge  | 32.0 |   40.0  | regular |  0.0     |             |
    /// | headlineMedium | 28.0 |   36.0  | regular |  0.0     |             |
    /// | headlineSmall  | 24.0 |   32.0  | regular |  0.0     |             |
    /// | titleLarge     | 22.0 |   28.0  | regular |  0.0     |             |
    /// | titleMedium    | 16.0 |   24.0  | medium  |  0.15    |             |
    /// | titleSmall     | 14.0 |   20.0  | medium  |  0.1     |             |
    /// | bodyLarge      | 16.0 |   24.0  | regular |  0.5     |             |
    /// | bodyMedium     | 14.0 |   20.0  | regular |  0.25    |             |
    /// | bodySmall      | 12.0 |   16.0  | regular |  0.4     |             |
    /// | labelLarge     | 14.0 |   20.0  | medium  |  0.1     |             |
    /// | labelMedium    | 12.0 |   16.0  | medium  |  0.5     |             |
    /// | labelSmall     | 11.0 |   16.0  | medium  |  0.5     |             |
    /// ...where "regular" is `FontWeight.w400` and "medium" is `FontWeight.w500`.
    return TextTheme(
      /// === Display ===
      displayLarge: _style.modifier(
        fontSize: 46,
        fontWeight: AppFontWeight.semiBold,
      ),
      displayMedium: _style.modifier(
        fontSize: 42,
        debugLabel: 'displayMedium',
        fontWeight: AppFontWeight.semiBold,
      ),
      displaySmall: _style.modifier(
        fontSize: 36,
        debugLabel: 'displaySmall',
        fontWeight: AppFontWeight.semiBold,
      ),

      /// === Headings ===
      headlineLarge: _style.modifier(
        fontSize: 32,
        debugLabel: 'headlineLarge',
        fontWeight: AppFontWeight.bold,
      ),
      headlineMedium: _style.modifier(
        fontSize: 30,
        debugLabel: 'headlineMedium',
        fontWeight: AppFontWeight.semiBold,
      ),
      headlineSmall: _style.modifier(
        fontSize: 24,
        debugLabel: 'headlineSmall',
        fontWeight: AppFontWeight.regular,
      ),

      titleLarge: _style.modifier(
        fontSize: 20,
        debugLabel: 'titleLarge',
        fontWeight: AppFontWeight.medium,
      ),
      titleMedium: _style.modifier(
        fontSize: 18,
        debugLabel: 'titleMedium',
        fontWeight: AppFontWeight.semiBold,
      ),
      titleSmall: _style.modifier(
        fontSize: 18,
        debugLabel: 'titleSmall',
        fontWeight: AppFontWeight.medium,
      ),

      /// === Body ===
      bodyLarge: _style.modifier(
        fontSize: 20,
        debugLabel: 'bodyLarge',
        fontWeight: AppFontWeight.regular,
      ),
      bodyMedium: _style.modifier(
        fontSize: 16,
        debugLabel: 'bodyMedium',
        fontWeight: AppFontWeight.regular,
      ),
      bodySmall: _style.modifier(
        fontSize: 14,
        debugLabel: 'bodySmall',
        fontWeight: AppFontWeight.regular,
      ),

      /// === Labels / Buttons ===
      labelLarge: _style.modifier(
        fontSize: 18,
        debugLabel: 'labelLarge',
        fontWeight: AppFontWeight.medium,
      ),
      labelMedium: _style.modifier(
        fontSize: 14,
        debugLabel: 'labelMedium',
        fontWeight: AppFontWeight.medium,
      ),
      labelSmall: _style.modifier(
        fontSize: 12,
        debugLabel: 'labelSmall',
        fontWeight: AppFontWeight.medium,
      ),
    );
  }
}
