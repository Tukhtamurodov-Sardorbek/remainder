import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:entry_feature/global/alternative_options_view.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:navigation/di/get.dart';

part 'components/header.dart';

part 'components/state_mixin.dart';

part 'components/login_button.dart';

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();

  // Static method to access the state from descendant widgets
  static _SignInPageState of(BuildContext context) {
    final state = context.findAncestorStateOfType<_SignInPageState>();
    assert(state != null, 'No SignInPage ancestor found in the widget tree');
    return state!;
  }
}

class _SignInPageState extends State<SignInPage>
    with SequentialDownToUp, AppStatefulMixin, _StateHelper {
  @override
  ({double defaultInitDelay, double? delta, Map<int, int> slotsPerOrder})
  get setupSequence {
    return (
      delta: 0.09,
      defaultInitDelay: 0.4,
      slotsPerOrder: {1: 1, 2: data.length, 3: 1, 4: 1},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  _HeaderView(),
                  SliverList.separated(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data[index].label,
                            style: theme.textTheme.bodyMedium?.modifier(
                              fontWeight: AppFontWeight.medium,
                            ),
                          ),
                          8.verticalSpace,
                          AppTextFormField.labeledTextFormField(
                            filled: true,
                            context: context,
                            fillColor: AppColor.white,
                            hintText: data[index].hint,
                            focusNode: data[index].node,
                            controller: data[index].ctrl,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (_) {
                              FocusScope.of(
                                context,
                              ).requestFocus(data[index + 1].node);
                            },
                            autoValidateMode: AutovalidateMode.always,
                            validator: (input) {
                              if (input?.isEmpty == true) return null;
                              return 'Username and password doesn’t match';
                            },
                          ).conditionalWrapper(
                            condition: data[index].isPassword,
                            wrapper: (_) {
                              return ValueListenableBuilder(
                                valueListenable: _obscurePassword,
                                builder: (context, value, _) {
                                  return AppTextFormField.labeledTextFormField(
                                    filled: true,
                                    context: context,
                                    obscureText: value,
                                    fillColor: AppColor.white,
                                    hintText: data[index].hint,
                                    focusNode: data[index].node,
                                    controller: data[index].ctrl,
                                    textInputAction: TextInputAction.done,
                                    type: TextFieldType.password(
                                      _obscurePassword,
                                    ),
                                    onFieldSubmitted: (_) {
                                      FocusScope.of(
                                        context,
                                      ).unfocus(); // dismiss keyboard at the end
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ).wrapWithDownToUpAnimation(
                        delayFactor: delayFactor(2, index),
                      );
                    },
                    separatorBuilder: (context, index) => 16.verticalSpace,
                  ),
                  _LoginButton(),
                  AlternativeOptionsView(
                    appleAccountPressed: () {},
                    googleAccountPressed: () {},
                  ).wrapWith(
                    (child) => SliverToBoxAdapter(
                      child: child.wrapWithDownToUpAnimation(
                        delayFactor: delayFactor(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SafeArea(
              minimum: EdgeInsets.only(bottom: 18, top: 12),
              child: AppTaggedText(
                text:
                    'Don’t have an account? ${AppTaggedText.wrapArgument('Sign up')}'
                        .needsToBeTranslated,
                taggedStyle: theme.textTheme.labelSmall!.modifier(
                  color: AppColor.primaryBlue.shade500,
                ),
                defaultStyle: theme.textTheme.labelSmall!.modifier(
                  fontWeight: AppFontWeight.regular,
                  color: AppColor.text.shade800,
                ),
                onTagPressed: () {
                  GetAppNavigator.entryNavigator().navigateSignUpPage(
                    context,
                    replace: true,
                  );
                },
              ).wrapWithDownToUpAnimation(delayFactor: delayFactor(0)),
            ),
          ],
        ),
      ),
    );
  }
}
