import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' hide AppBar;

part 'components/state_mixin.dart';

part 'components/header.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();

  // Static method to access the state from descendant widgets
  static _ForgotPasswordPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_ForgotPasswordPageState>();
    assert(
      state != null,
      'No ForgotPasswordPage ancestor found in the widget tree',
    );
    return state!;
  }
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SequentialDownToUp, AppStatefulMixin, _StateHelper {
  @override
  ({double defaultInitDelay, double? delta, Map<int, int> slotsPerOrder})
  get setupSequence {
    return (
      delta: 0.09,
      defaultInitDelay: 0.4,
      slotsPerOrder: {1: 1, 2: 1, 3: 1},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: CustomScrollView(
          slivers: [
            _HeaderView(),
            Text(
              data.label,
              style: theme.textTheme.bodyMedium?.modifier(
                fontWeight: AppFontWeight.medium,
              ),
            ),
            8.verticalSpace,
            AppTextFormField.labeledTextFormField(
              filled: true,
              context: context,
              fillColor: AppColor.white,
              hintText: data.hint,
              controller: _emailCtrl,
            ),
            32.verticalSpace,
            PrimaryButton(
              onPressed: () {},
              isDark: context.isDark,
              child: Text('Recover'.needsToBeTranslated),
            ),
          ],
        ),
      ),
    );
  }
}
