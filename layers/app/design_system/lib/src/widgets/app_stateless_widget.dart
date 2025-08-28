import 'package:flutter/material.dart';

abstract class AppStatelessWidget extends StatelessWidget {
  const AppStatelessWidget({super.key});

  @protected
  Widget builder(BuildContext context, ThemeData theme);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return builder(context, theme);
  }
}

mixin AppStatelessMixin on StatelessWidget {
  ThemeData themeOf(BuildContext context) => Theme.of(context);
}
