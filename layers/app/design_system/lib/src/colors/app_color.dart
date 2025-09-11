import 'package:flutter/material.dart';

final class AppColor {
  const AppColor._();

  static const Color primaryBackground = Color(0xFFF7F7F7);

  static const MaterialColor primaryBlue =
      MaterialColor(0xFF1256DB, <int, Color>{
        50: Color(0xFFEAEFFB),
        100: Color(0xFFD3DFF6),
        200: Color(0xFFA4BDEE),
        300: Color(0xFF6897F3),
        400: Color(0xFF3674EE),
        500: buttonUnselected,
        600: Color(0xFF0E45B0),
        700: Color(0xFF0B3484),
        800: buttonPressed,
        900: Color(0xFF06122B),
      });

  static const MaterialColor neutral = MaterialColor(0xFF868686, <int, Color>{
    50: Color(0xFFF2F2F2),
    100: Color(0xFFE6E6E6),
    200: Color(0xFFCECECE),
    300: Color(0xFFB6B6B6),
    400: Color(0xFF9E9E9E),
    500: Color(0xFF868686),
    600: Color(0xFF6B6B6B),
    700: Color(0xFF505050),
    800: Color(0xFF353535),
    900: Color(0xFF151515),
  });

  static const MaterialColor success = MaterialColor(0xFF009E00, <int, Color>{
    50: Color(0xFFE6F5E6),
    200: Color(0xFFB0E1B0),
    500: Color(0xFF009E00),
    800: Color(0xFF0D3616),
  });

  static const MaterialColor error = MaterialColor(0xFFDC0000, <int, Color>{
    50: Color(0xFFFCE6E6),
    200: Color(0xFFF4B0B0),
    500: Color(0xFFDC0000),
    800: Color(0xFF4D0000),
  });

  static const MaterialColor warning = MaterialColor(0xFFF6B500, <int, Color>{
    200: Color(0xFFFFEBB2),
    500: Color(0xFFF6B500),
    800: Color(0xFF805E00),
  });

  static const MaterialColor info = MaterialColor(0xFF007BAF, <int, Color>{
    200: Color(0xFF82C3DF),
    500: Color(0xFF007BAF),
    800: Color(0xFF003146),
  });

  static const MaterialColor text = MaterialColor(0xFFFFFFFF, <int, Color>{
    400: Color(0xFF9E9E9E),
    500: Color(0xFF353535),
    800: Color(0xFF353535),
  });

  static const Color white = Color(0xFFFFFFFF);
  static const Color buttonPressed = Color(0xFF0B2455);
  static const Color buttonUnselected = Color(0xFF1256DB);
  static const Color buttonDisabled = Color(0xFFE6E6E6);
}
