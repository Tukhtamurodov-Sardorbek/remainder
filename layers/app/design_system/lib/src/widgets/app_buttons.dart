import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends TextButton {
  PrimaryButton({
    super.key,
    required super.onPressed,
    required super.child,
    required bool isDark,
    double? width,
    double? height,
    REdgeInsets? padding,
    Color? foregroundColor,
    Color? backgroundColor,
    ButtonType type = ButtonType.styled,
    ButtonBorder border = const ButtonBorder.noBorder(),
  }) : super(
         style: ButtonStyle(
           padding: WidgetStatePropertyAll(
             padding ?? const EdgeInsets.all(12).r,
           ),
           fixedSize: WidgetStatePropertyAll(
             Size(
               width ?? 1.sw,
               type.isTransparent
                   ? (height ?? DesignConstants.defaultButtonHeight - 2)
                   : (height ?? DesignConstants.defaultButtonHeight),
             ),
           ),
           shape: WidgetStatePropertyAll(
             RoundedRectangleBorder(
               side: border.side,
               borderRadius: BorderRadius.circular(
                 DesignConstants.borderRadius16,
               ),
             ),
           ),
           foregroundColor: type.isTransparent
               ? null
               : WidgetStatePropertyAll(
                   foregroundColor ?? AppColor.white,
                   // (isDark
                   //     ? AppColorDark.elementsPrimary
                   //     : AppColorLight.elementsPrimary),
                 ),
           overlayColor: type.isTransparent
               ? WidgetStateProperty.resolveWith<Color>((
                   Set<WidgetState> states,
                 ) {
                   return Colors.transparent;
                 })
               : WidgetStateProperty.resolveWith<Color>((
                   Set<WidgetState> states,
                 ) {
                   if (states.contains(WidgetState.pressed)) {
                     return AppColor.buttonPressed;
                   }
                   return AppColor.buttonUnselected;
                 }),
           backgroundColor: type.isTransparent
               ? null
               : WidgetStateProperty.resolveWith<Color>((
                   Set<WidgetState> states,
                 ) {
                   if (states.contains(WidgetState.disabled)) {
                     return AppColor.buttonDisabled;
                     // isDark
                     // ? AppColorDark.disabledButtonColor
                     // : AppColorLight.disabledButtonColor;
                   }
                   return backgroundColor ?? AppColor.primaryBlue.shade500;
                 }),
           textStyle: WidgetStatePropertyAll(
             TextStyle(
               fontSize: 16.sp,
               color: foregroundColor,
               fontWeight: FontWeight.w600,
               fontFamily: DesignConstants.fontFamily,
             ),
           ),
         ),
       );
}

///////////////////////////////////////////////////////////////////////////////

enum ButtonType {
  transparent,
  styled;

  bool get isTransparent => this == transparent;
}

sealed class ButtonBorder {
  const ButtonBorder._();

  const factory ButtonBorder.noBorder() = _WithoutBorder;

  factory ButtonBorder.withBorder({Color? color, double? width}) {
    return _WithBorder(
      color: color ?? AppColor.neutral.shade400,
      width: width ?? 1.2,
    );
  }

  BorderSide get side {
    return switch (this) {
      _WithBorder(:final color, :final width) => BorderSide(
        color: color,
        width: width,
      ),
      _WithoutBorder() => BorderSide.none,
    };
  }
}

final class _WithBorder extends ButtonBorder {
  final Color color;
  final double width;

  const _WithBorder({required this.color, required this.width}) : super._();
}

final class _WithoutBorder extends ButtonBorder {
  const _WithoutBorder() : super._();
}
