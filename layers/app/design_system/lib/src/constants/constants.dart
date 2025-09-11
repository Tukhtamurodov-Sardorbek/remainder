import 'package:flutter_screenutil/flutter_screenutil.dart';

final class DesignConstants {
  const DesignConstants._();

  /// === Typography ===
  static const String fontFamily = 'Roboto';

  /// === Corner ===
  static double? _r4, _r8, _r12, _r16, _r24, _r32, _rDH;

  static double get borderRadius4 => _r4 ??= 4.r;

  static double get borderRadius8 => _r8 ??= 8.r;

  static double get borderRadius12 => _r12 ??= 12.r;

  static double get borderRadius16 => _r16 ??= 16.r;

  static double get borderRadius24 => _r24 ??= 24.r;

  static double get borderRadius32 => _r32 ??= 32.r;

  static double get defaultButtonHeight => _rDH ??= 50.h;
}
