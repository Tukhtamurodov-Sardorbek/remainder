/// Design system library
library design_system;

import 'package:design_system/src/theme/impl/app_theme_impl.dart';
import 'package:flutter/material.dart';

export 'package:flutter_svg/flutter_svg.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:animated_text_kit/animated_text_kit.dart';
export 'package:auto_size_text/auto_size_text.dart';

export 'src/assets/app_asset.dart';
export 'src/assets/svg.dart';
export 'src/colors/app_color.dart';
export 'src/constants/constants.dart';
export 'src/extensions/context_ext.dart';
export 'src/extensions/date_time.dart';
export 'src/extensions/string_ext.dart';
export 'src/extensions/text_style_ext.dart';
export 'src/extensions/widget.dart';
export 'src/widgets/app_stateful_widget.dart';
export 'src/widgets/app_stateless_widget.dart';
export 'src/widgets/animations/animation_effect.dart';
export 'src/widgets/animations/animation_list_view_item.dart';
export 'src/widgets/animations/down_to_up.dart';
export 'src/widgets/app_buttons.dart';
export 'src/widgets/app_text_form_field.dart';
export 'src/widgets/app_tagged_text.dart';
export 'src/widgets/app_bar.dart';
export 'src/widgets/fade_out_page_view.dart';

typedef AppThemeConfig = AppThemeImpl;


/// Responsive text that measures itself and reduces font size until it fits.
class ResponsiveAutoSizeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final double minFontSize;
  final double maxFontSize;
  final TextAlign textAlign;

  const ResponsiveAutoSizeText(
      this.text, {
        Key? key,
        required this.style,
        this.maxLines = 2,
        this.minFontSize = 12,
        this.maxFontSize = 24,
        this.textAlign = TextAlign.center,
      }) : super(key: key);

  double _findBestFontSize(
      String text,
      TextStyle baseStyle,
      double maxWidth,
      int maxLines,
      double minFontSize,
      double maxFontSize,
      double textScaleFactor,
      ) {
    final tp = TextPainter(textDirection: TextDirection.ltr);

    double fs = maxFontSize * textScaleFactor;
    final double minFs = minFontSize * textScaleFactor;

    // Reduce font size in small steps until it fits or reached min.
    while (fs >= minFs) {
      tp.text = TextSpan(text: text, style: baseStyle.copyWith(fontSize: fs));
      tp.maxLines = maxLines;
      tp.layout(maxWidth: maxWidth);

      // If it didn't exceed maxLines and width is within bounds, accept it.
      if (!tp.didExceedMaxLines && tp.width <= maxWidth + 0.1) {
        return fs / textScaleFactor; // return unscaled font size
      }
      fs -= 0.5; // step down
    }
    return minFontSize; // fallback
  }

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return LayoutBuilder(builder: (context, constraints) {
      final maxW = constraints.maxWidth.clamp(0.0, double.infinity);

      final fittedFontSize = _findBestFontSize(
        text,
        style,
        maxW,
        maxLines,
        minFontSize,
        maxFontSize,
        textScaleFactor,
      );

      return Text(
        text,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: style.copyWith(fontSize: fittedFontSize),
      );
    });
  }
}

/// Example onboarding layout that keeps buttons fixed at bottom and uses
/// ResponsiveAutoSizeText for title/subtitle.
class OnboardingExample extends StatelessWidget {
  const OnboardingExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // change these base sizes to your design sizes (they will be clamped by ResponsiveAutoSizeText)
    final titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
    final subtitleStyle = TextStyle(fontSize: 16, height: 1.4);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top area: icon/back
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Main content area - uses flexible space
            Expanded(
              child: Column(
                children: [
                  // visual (avatars + rings) - give it decent flex so it shrinks/grows
                  Flexible(
                    flex: 6,
                    child: Center(
                      child: SizedBox(
                        width: 280,
                        height: 280,
                        // put your fancy widget here (I use a placeholder)
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.06),
                          ),
                          child: const Center(child: CircleAvatar(radius: 48)),
                        ),
                      ),
                    ),
                  ),

                  // Dots + title + subtitle - allow them to shrink if space is tight
                  Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // dots
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(width: 10, height: 10, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Container(width: 10, height: 10, decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle)),
                              const SizedBox(width: 8),
                              Container(width: 10, height: 10, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle)),
                            ],
                          ),
                          const SizedBox(height: 18),

                          // Title - will auto-shrink to maxLines = 2
                          ResponsiveAutoSizeText(
                            "For yourself, family and friends",
                            style: titleStyle,
                            maxLines: 2,
                            minFontSize: 14,
                            maxFontSize: 24,
                          ),

                          const SizedBox(height: 12),

                          // Subtitle - auto-shrink, allow up to 3 lines
                          ResponsiveAutoSizeText(
                            "Easily manage medication for everyone you care about with seamless profile switching.",
                            style: subtitleStyle,
                            maxLines: 3,
                            minFontSize: 12,
                            maxFontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bottom buttons fixed area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Create an account"),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
