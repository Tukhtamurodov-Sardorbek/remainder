import 'package:flutter/material.dart' show Alignment;
import 'package:flutter_svg/svg.dart';

class AppIconSvg extends SvgPicture {
  AppIconSvg.asset(
    super.assetName, {
    super.key,
    super.width,
    super.height,
    super.color,
    super.colorBlendMode,
    super.fit,
    super.colorFilter,
    super.alignment = Alignment.center,
    super.package = 'design_system',
  }) : super.asset();
}
