import 'package:flutter/material.dart';
import 'package:core/core.dart';

@RoutePage()
class BaseScreen extends AutoRouter implements AutoRouteWrapper {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold();
  }
}
