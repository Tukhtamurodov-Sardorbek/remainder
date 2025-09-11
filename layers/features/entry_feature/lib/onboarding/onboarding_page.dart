import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';
import 'package:navigation/navigation.dart';

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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Stack(
          children: [
            Column(
              children: [
                [
                      ValueListenableBuilder<bool>(
                        valueListenable: _isInitial,
                        builder: (context, value, _) {
                          if (value) return SizedBox.shrink();
                          return Icons.arrow_back_ios.buttonize(
                            onTap: _toPreviousPage,
                          );
                        },
                      ),
                      ValueListenableBuilder<bool>(
                        valueListenable: _isLast,
                        builder: (context, value, _) {
                          if (value) {
                            return SizedBox.shrink();
                          }
                          return TextButton(
                            onPressed: _toLastPage,
                            child: Text(
                              'Skip'.needsToBeTranslated,
                              style: theme.textTheme.bodyMedium?.modifier(
                                color: AppColor.text.shade800,
                              ),
                            ),
                          );
                        },
                      ),
                    ]
                    .row(mainAxisAlignment: MainAxisAlignment.spaceBetween)
                    .wrapWith((child) => SafeArea(child: child)),
                16.verticalSpace,
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 2,
                          child: PageView(
                            padEnds: false,
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(_data.length, (i) {
                              return AppAsset.onboarding(i + 1).displayImage(
                                key: ValueKey(pageKey(i)),
                                fit: BoxFit.fitHeight,
                              );
                            }),
                          ).wrapWithDownToUpAnimation(delayFactor: 0.4),
                        ),
                        _IndicatorView(),
                        Flexible(
                          child: PageView(
                            controller: _mirroredPageCtrl,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(_data.length, (i) {
                              // return Column(
                              //   children: [
                              //     DefaultTextStyle(
                              //       textAlign: TextAlign.center,
                              //       style: theme.textTheme.headlineSmall!
                              //           .modifier(
                              //             color: AppColor.text[800],
                              //             fontWeight: AppFontWeight.semiBold,
                              //           ),
                              //       child: AnimatedTextKit(
                              //         totalRepeatCount: 1,
                              //         isRepeatingAnimation: false,
                              //         animatedTexts: [
                              //           TyperAnimatedText(
                              //             _data[i].key,
                              //             textAlign: TextAlign.center,
                              //             speed: const Duration(
                              //               milliseconds: 70,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     16.verticalSpace,
                              //     DefaultTextStyle(
                              //       textAlign: TextAlign.center,
                              //       style: theme.textTheme.bodyMedium!
                              //           .modifier(color: AppColor.text[800]),
                              //       child: AnimatedTextKit(
                              //         totalRepeatCount: 1,
                              //         isRepeatingAnimation: false,
                              //         animatedTexts: [
                              //           TyperAnimatedText(
                              //             _data[i].value,
                              //             textAlign: TextAlign.center,
                              //             speed: const Duration(
                              //               milliseconds: 80,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // );
                              return Column(
                                children: [
                                  Text(
                                    _data[i].key,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.headlineSmall
                                        ?.modifier(
                                          color: AppColor.text.shade800,
                                          fontWeight: AppFontWeight.semiBold,
                                        ),
                                  ),
                                  16.verticalSpace,
                                  Text(
                                    _data[i].value,
                                    textAlign: TextAlign.center,
                                    style: theme.textTheme.bodyMedium?.modifier(
                                      color: AppColor.text.shade800,
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ).wrapWithDownToUpAnimation(delayFactor: 0.4),
                        ),
                      ],
                    ),
                  ),
                ),
                DesignConstants.defaultButtonHeight.verticalSpace,
              ],
            ),
            ValueListenableBuilder<bool>(
              valueListenable: _isLast,
              builder: (context, value, _) {
                return AnimatedPositioned(
                  bottom: value ? 16.h : -DesignConstants.defaultButtonHeight,
                  left: 0,
                  right: 0,
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PrimaryButton(
                        onPressed: () {
                          if (value) {
                            GetAppNavigator.entryNavigator().navigateSignUpPage(
                              context,
                            );
                          } else {
                            _toNextPage();
                          }
                        },
                        isDark: context.isDark,
                        child: Text(
                          value
                              ? 'Create an account'.needsToBeTranslated
                              : 'Next'.needsToBeTranslated,
                        ),
                      ),
                      AnimatedOpacity(
                        curve: Curves.ease,
                        opacity: value ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: PrimaryButton(
                            onPressed: () {},
                            isDark: context.isDark,
                            type: ButtonType.transparent,
                            border: ButtonBorder.withBorder(),
                            child: Text(
                              'Login'.needsToBeTranslated,
                              style: theme.textTheme.bodyMedium?.modifier(
                                color: AppColor.neutral.shade400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      2.verticalSpace,
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
