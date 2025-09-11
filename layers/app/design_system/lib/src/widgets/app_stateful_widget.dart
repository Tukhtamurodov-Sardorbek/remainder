import 'package:flutter/material.dart';

abstract class AppStatefulWidget extends StatefulWidget {
  const AppStatefulWidget({super.key});
}

abstract class ThemedState<T extends AppStatefulWidget> extends State<T> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }
}

mixin AppStatefulMixin<T extends StatefulWidget> on State<T> {
  late ThemeData theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }
}
