import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class AnimatedTypingDots extends StatefulWidget {
  final int maxDots;
  final String localeKey;
  final TextStyle? textStyle;

  const AnimatedTypingDots({
    super.key,
    this.textStyle,
    this.maxDots = 3,
    required this.localeKey,
  });

  @override
  State<AnimatedTypingDots> createState() => _AnimatedTypingDotsState();
}

class _AnimatedTypingDotsState extends State<AnimatedTypingDots>
    with SingleTickerProviderStateMixin, AppStatefulMixin {
  int _visibleDotCount = 0;
  late final AnimationController _controller;

  @override
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..addListener(_updateDots);
    _controller.repeat();
  }

  void _updateDots() {
    final newCount = (_controller.value * (widget.maxDots + 1)).floor();
    if (newCount != _visibleDotCount) {
      setState(() {
        _visibleDotCount = newCount % (widget.maxDots + 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = widget.textStyle ?? theme.textTheme.labelLarge;
    final transparentStyle = effectiveStyle!.copyWith(color: Colors.transparent);

    return RichText(
      text: TextSpan(
        style: effectiveStyle,
        children: [
          TextSpan(text: widget.localeKey.tr()),
          ...List.generate(widget.maxDots, (index) {
            return TextSpan(
              text: '.',
              style: index < _visibleDotCount ? effectiveStyle : transparentStyle,
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
