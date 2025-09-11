import 'package:flutter/material.dart';

class AppTaggedText extends StatelessWidget {
  final String text;
  final TextStyle defaultStyle;
  final TextStyle taggedStyle;

  static String wrapArgument(String localeKey) => '<t>$localeKey</t>';

  const AppTaggedText({
    super.key,
    required this.text,
    required this.defaultStyle,
    required this.taggedStyle,
  });

  @override
  Widget build(BuildContext context) {
    // final spans = _parseTaggedText(text, defaultStyle, taggedStyle);
    // return RichText(
    //   maxLines: 5,
    //   textScaler: TextScaler.noScaling,
    //   text: TextSpan(children: spans, style: defaultStyle),
    // );
    final spans = _parseTaggedText(text, defaultStyle, taggedStyle);

    return Text.rich(TextSpan(children: spans), style: defaultStyle);
  }

  List<TextSpan> _parseTaggedText(
    String text,
    TextStyle defaultStyle,
    TextStyle taggedStyle,
  ) {
    final spans = <TextSpan>[];
    final tagRegExp = RegExp(r'<t>(.*?)<\/t>', dotAll: true);
    int currentIndex = 0;

    for (final match in tagRegExp.allMatches(text)) {
      // Text before tag
      if (match.start > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, match.start),
            style: defaultStyle, // Explicitly apply default style
          ),
        );
      }

      // Tagged text
      spans.add(TextSpan(text: match.group(1), style: taggedStyle));

      currentIndex = match.end;
    }

    // Remaining text after last tag
    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.substring(currentIndex), style: defaultStyle),
      );
    }

    return spans;
  }

  // List<TextSpan> _parseTaggedText(
  //   String text,
  //   TextStyle defaultStyle,
  //   TextStyle taggedStyle,
  // ) {
  //   final spans = <TextSpan>[];
  //   final tagRegExp = RegExp(r'<t>(.*?)<\/t>', dotAll: true);
  //   int currentIndex = 0;
  //
  //   final matches = tagRegExp.allMatches(text);
  //
  //   for (final match in matches) {
  //     // Add text before the tag
  //     if (match.start > currentIndex) {
  //       spans.add(
  //         TextSpan(
  //           style: defaultStyle,
  //           text: text.substring(currentIndex, match.start),
  //         ),
  //       );
  //     }
  //
  //     // Add tagged text
  //     spans.add(
  //       TextSpan(
  //         style: taggedStyle,
  //         text: match.group(1), // This excludes <t> and </t>
  //       ),
  //     );
  //
  //     currentIndex = match.end;
  //   }
  //
  //   // Add any remaining text after the last tag
  //   if (currentIndex < text.length) {
  //     spans.add(
  //       TextSpan(text: text.substring(currentIndex), style: defaultStyle),
  //     );
  //   }
  //
  //   return spans;
  // }
}
