import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends TextButton {
  const PrimaryButton._({
    super.key,
    super.clipBehavior,
    required super.style,
    required super.child,
    required super.onPressed,
  });

  factory PrimaryButton({
    Key? key,
    Size? size,
    Clip? clipBehavior,
    EdgeInsets? padding,
    required bool isDark,
    required Widget child,
    Color? foregroundColor,
    Color? backgroundColor,
    Color? pressedColor,
    Color? unpressedColor,
    VoidCallback? onPressed,
    ButtonType type = ButtonType.styled,
    bool applyDefaultPressedColor = false,
    ButtonBorder border = const ButtonBorder.noBorder(),
  }) {
    return PrimaryButton._(
      key: key,
      onPressed: onPressed,
      clipBehavior: clipBehavior,
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          (padding ?? const EdgeInsets.all(12)).r,
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            size?.width ?? 1.sw,
            type.isTransparent
                ? (size?.height ?? DesignConstants.defaultButtonHeight - 2)
                : (size?.height ?? DesignConstants.defaultButtonHeight),
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: border.side,
            borderRadius: BorderRadius.circular(DesignConstants.borderRadius16),
          ),
        ),
        foregroundColor: WidgetStatePropertyAll(
          foregroundColor ??
              (type.isTransparent ? AppColor.neutral.shade400 : AppColor.white),
        ),
        overlayColor: type.isTransparent
            ? WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                return AppColor.neutral.shade200.withValues(alpha: 0.5);
              })
            : WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return applyDefaultPressedColor
                      ? AppColor.neutral.shade200.withValues(alpha: 0.5)
                      : pressedColor ?? AppColor.buttonPressed;
                }
                return unpressedColor ?? AppColor.buttonUnselected;
              }),
        backgroundColor: type.isTransparent
            ? null
            : WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppColor.buttonDisabled;
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
      child: child,
    );
  }
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
