import 'package:flutter/material.dart';

final class AppColor {
  const AppColor._();

  static const MaterialColor primaryBlue =
      MaterialColor(0xFF1256DB, <int, Color>{
        50: Color(0xFFEAEFFB),
        100: Color(0xFFD3DFF6),
        200: Color(0xFFA4BDEE),
        300: Color(0xFF6897F3),
        400: Color(0xFF3674EE),
        500: Color(0xFF1256DB),
        600: Color(0xFF0E45B0),
        700: Color(0xFF0B3484),
        800: Color(0xFF0B2455),
        900: Color(0xFF06122B),
      });

  static const MaterialColor neutral =
      MaterialColor(0xFF868686, <int, Color>{
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

  static const MaterialColor success =
      MaterialColor(0xFF009E00, <int, Color>{
        50: Color(0xFFE6F5E6),
        200: Color(0xFFB0E1B0),
        500: Color(0xFF009E00),
        800: Color(0xFF0D3616),
      });

  static const MaterialColor error =
      MaterialColor(0xFFDC0000, <int, Color>{
        50: Color(0xFFFCE6E6),
        200: Color(0xFFF4B0B0),
        500: Color(0xFFDC0000),
        800: Color(0xFF4D0000),
      });

  static const MaterialColor warning =
      MaterialColor(0xFFF6B500, <int, Color>{
        200: Color(0xFFFFEBB2),
        500: Color(0xFFF6B500),
        800: Color(0xFF805E00),
      });

  static const MaterialColor info =
      MaterialColor(0xFF007BAF, <int, Color>{
        200: Color(0xFF82C3DF),
        500: Color(0xFF007BAF),
        800: Color(0xFF003146),
      });

  static const Color primaryTone = Color(0xFFFD1524);
  static const Color blueLight = Color(0xFF007AFF);

  static const Color primaryBackground = Color(0xFFF7F7F7);

  static const Color text = Color(0xFF280609);
  static const Color textSecondary = Color(0xFF8B7979);
  static const Color textTertiary = Color(0xFF767676);
  static const Color textQuaternary = Color(0xFF3E3E3E);

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color lightGrey = Color(0xFFE8E5E5);
  static const Color lowLight = Color(0xFFCBCBCB);
  static const Color lowGrey = Color(0xFF9AA3B2);

  static const Color redShadow1 = Color(0x03C20F0F);
  static const Color redShadow11 = Color(0x1CC20F0F);
  static const Color redShadow36 = Color(0x5CC20F0F);
  static const Color redShadow61 = Color(0x9CC20F0F);
  static const Color redShadow71 = Color(0xB5C20F0F);

  static const Color whiteShadow0 = Color(0x00363636);
  static const Color whiteShadow1 = Color(0x03363636);
  static const Color whiteShadow3 = Color(0x08363636);
  static const Color whiteShadow5 = Color(0x0d363636);
  static const Color whiteShadow6 = Color(0x0f363636);

  static const Color whiteShadow2_8 = Color(0x14343434);

  static const Color whiteShadow2_0 = Color(0x00333333);
  static const Color whiteShadow2_1 = Color(0x03333333);
  static const Color whiteShadow2_3 = Color(0x08333333);
  static const Color whiteShadow2_5 = Color(0x0D333333);
  static const Color whiteShadow2_6 = Color(0x0F333333);
}
