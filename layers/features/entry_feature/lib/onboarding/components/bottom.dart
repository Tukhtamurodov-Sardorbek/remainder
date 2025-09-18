part of '../onboarding_page.dart';

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    final reference = OnboardPage.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: reference._isLast,
      builder: (context, value, _) {
        return AnimatedPositioned(
          left: 0,
          right: 0,
          bottom: 6,
          duration: const Duration(milliseconds: 250),
          child:
              [
                PrimaryButton(
                  onPressed: () {
                    if (value) {
                      GetAppNavigator.entryNavigator().navigateSignUpPage(
                        context,
                      );
                    } else {
                      reference._toNextPage();
                    }
                  },
                  isDark: context.isDark,
                  child: Text(
                    value
                        ? 'Create an account'.needsToBeTranslated
                        : 'Next'.needsToBeTranslated,
                  ),
                ),
                AnimatedCrossFade(
                  sizeCurve: Curves.ease,
                  firstCurve: Curves.ease,
                  secondCurve: Curves.ease,
                  duration: Duration(milliseconds: 300),
                  crossFadeState: value
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: PrimaryButton(
                      onPressed: () {
                        GetAppNavigator.entryNavigator().navigateSignInPage(
                          context,
                        );
                      },
                      isDark: context.isDark,
                      type: ButtonType.transparent,
                      border: ButtonBorder.withBorder(),
                      child: Text(
                        'Login'.needsToBeTranslated,
                        style: Theme.of(context).textTheme.bodyMedium?.modifier(
                          color: AppColor.neutral.shade400,
                        ),
                      ),
                    ),
                  ),
                  secondChild: SizedBox.shrink(),
                ),
              ].column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                margin: EdgeInsets.symmetric(
                  horizontal: reference._horizontalMargin,
                ),
              ),
        );
      },
    );
  }
}
