import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/services.dart' show SystemNavigator;
import 'package:navigation/navigation.dart';

part 'components/top_bar.dart';

part 'components/body.dart';

part 'components/bottom.dart';

part 'components/indicator_view.dart';

part 'components/state_mixin.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();

  // Static method to access the state from descendant widgets
  static _OnboardPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_OnboardPageState>();
    assert(state != null, 'No OnboardPage ancestor found in the widget tree');
    return state!;
  }
}

class _OnboardPageState extends State<OnboardPage>
    with AppStatefulMixin, _StateHelper {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  _TopBar(),
                  Expanded(child: _Body()),
                  (DesignConstants.defaultButtonHeight + 20).verticalSpace,
                ],
              ),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}
