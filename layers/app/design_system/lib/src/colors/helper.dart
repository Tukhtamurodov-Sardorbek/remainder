import 'package:flutter/material.dart';

final class AppColor extends ThemeExtension<AppColor> {
  const AppColor._();

  @override
  ThemeExtension<AppColor> copyWith() {
    // TODO: implement copyWith
    throw UnimplementedError();
  }

  @override
  ThemeExtension<AppColor> lerp(covariant ThemeExtension<AppColor>? other,
      double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
}


abstract class ThemeModeBasedColor {}

final class _LightModeColor {}

final class _DarkModeColor {}

enum AppColorOpacity {
  $100('FF'),
  $95('F2'),
  $90('E6'),
  $85('D9'),
  $80('CC'),
  $75('BF'),
  $70('B3'),
  $65('A6'),
  $60('99'),
  $55('8C'),
  $50('80'),
  $45('73'),
  $40('66'),
  $35('59'),
  $30('4D'),
  $25('40'),
  $20('33'),
  $15('26'),
  $10('1A'),
  $5('0D'),
  $0('00');

  final String alpha;

  const AppColorOpacity(this.alpha);
}

/// | Hex (Alpha) | Decimal | % Opacity | Notes             |
/// | ----------- | ------- | --------- | ----------------- |
/// | `FF`        | 255     | 100%      | Fully opaque      |
/// | `F2`        | 242     | 95%       |                   |
/// | `E6`        | 230     | 90%       |                   |
/// | `D9`        | 217     | 85%       |                   |
/// | `CC`        | 204     | 80%       |                   |
/// | `BF`        | 191     | 75%       |                   |
/// | `B3`        | 179     | 70%       |                   |
/// | `A6`        | 166     | 65%       |                   |
/// | `99`        | 153     | 60%       |                   |
/// | `8C`        | 140     | 55%       |                   |
/// | `80`        | 128     | 50%       | Half transparent  |
/// | `73`        | 115     | 45%       |                   |
/// | `66`        | 102     | 40%       |                   |
/// | `59`        | 89      | 35%       |                   |
/// | `4D`        | 77      | 30%       |                   |
/// | `40`        | 64      | 25%       |                   |
/// | `33`        | 51      | 20%       |                   |
/// | `26`        | 38      | 15%       |                   |
/// | `1A`        | 26      | 10%       |                   |
/// | `0D`        | 13      | 5%        |                   |
/// | `00`        | 0       | 0%        | Fully transparent |
