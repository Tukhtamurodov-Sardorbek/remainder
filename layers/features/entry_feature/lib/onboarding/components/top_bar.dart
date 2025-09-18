part of '../onboarding_page.dart';

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final reference = OnboardPage.of(context);
    return [
      ValueListenableBuilder<bool>(
        valueListenable: reference._isInitial,
        builder: (context, value, _) {
          if (value) return SizedBox.shrink();
          return Icons.arrow_back_ios.buttonize(
            onTap: reference._toPreviousPage,
          );
        },
      ),
      ValueListenableBuilder<bool>(
        valueListenable: reference._isInitial,
        builder: (context, value, _) {
          if (!value) {
            return SizedBox.shrink();
          }
          return TextButton(
            onPressed: reference._toLastPage,
            child: Text(
              'Skip'.needsToBeTranslated,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.modifier(color: AppColor.text.shade800),
            ),
          );
        },
      ),
    ].row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      margin: EdgeInsets.symmetric(horizontal: reference._horizontalMargin),
    );
  }
}
