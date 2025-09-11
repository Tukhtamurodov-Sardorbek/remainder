import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum SplashType {
  noSplash(NoSplash.splashFactory),
  defaultSplash(InkSplash.splashFactory),
  straightSplash(InkSparkle.splashFactory),
  aggressiveSplash(InkRipple.splashFactory);

  const SplashType(this.factory);

  final InteractiveInkFeatureFactory factory;
}

extension WidgetExt on Widget {
  Widget buttonize({
    Key? key,
    required VoidCallback? onTap,
    bool withBouncingAnimation = false,
    BorderRadius? borderRadius,
    SplashType? splashType,
    REdgeInsets? padding,
    Color? highlightColor,
    Color? splashColor,
    Color? backgroundColor,
    Decoration? decoration,
  }) {
    if (onTap == null) {
      return this;
    }
    if (withBouncingAnimation) {
      return AnimationButtonEffect(key: key, onTap: onTap, child: this);
    }

    final defaultColor = splashType == SplashType.noSplash
        ? Colors.transparent
        : null;

    return Material(
      key: key,
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        splashFactory: splashType?.factory,
        splashColor: defaultColor ?? splashColor,
        highlightColor: defaultColor ?? highlightColor,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(12)),
        child: Ink(
          padding: padding,
          decoration:
              decoration ??
              BoxDecoration(
                color: backgroundColor ?? Colors.transparent,
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(12)),
              ),
          child: this,
        ),
      ),
    );
  }

  Widget verticalAnimationWrapper({int index = 0, int milliseconds = 480}) {
    return VerticalAnimationItemWrapper(
      milliseconds: milliseconds,
      position: index,
      child: this,
    );
  }

  Widget horizontalAnimationWrapper({int index = 0, int milliseconds = 740}) {
    return HorizontalAnimationItemWrapper(
      milliseconds: milliseconds,
      position: index,
      child: this,
    );
  }

  Widget wrapWithDownToUpAnimation({
    Key? key,
    required double delayFactor,
    bool withPosition = true,
    bool reversePosition = false,
    Function()? onFinish,
    bool applyOpacityAnimation = true,
  }) {
    return DownToUp(
      key: key,
      onFinish: onFinish,
      reversePosition: reversePosition,
      delayFactor: delayFactor,
      applyOpacityAnimation: applyOpacityAnimation,
      child: this,
    );
  }

  Widget wrapWith(Widget Function(Widget child) wrap) {
    return wrap(this);
  }

  Widget conditionalWrapper({
    required bool condition,
    required Widget Function(Widget child) wrapper,
  }) {
    return condition ? wrapper(this) : this;
  }

  Widget colorize([Color color = Colors.red]) {
    return ColoredBox(color: color.withValues(alpha: 0.5), child: this);
  }
}

extension IconDataExt on IconData {
  IconButton buttonize({
    required VoidCallback? onTap,
    double? size,
    Color? color,
  }) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(this),
      iconSize: size ?? 24.r,
      color: color ?? AppColor.neutral.shade800,
      style: IconButton.styleFrom(
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: color ?? AppColor.neutral.shade800,
        // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }
}

extension ListWidgetExt on List<Widget> {
  Column column({
    double spacing = 0.0,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Column(
      spacing: spacing,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }

  Row row({
    double spacing = 0.0,
    MainAxisSize mainAxisSize = MainAxisSize.max,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) {
    return Row(
      spacing: spacing,
      mainAxisSize: mainAxisSize,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: this,
    );
  }
}
