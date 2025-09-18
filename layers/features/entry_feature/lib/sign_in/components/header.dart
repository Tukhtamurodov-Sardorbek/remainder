part of '../sign_in_page.dart';

class _HeaderView extends StatelessWidget {
  const _HeaderView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return [
      Text('Sign In'.needsToBeTranslated, style: textTheme.titleLarge),
      8.verticalSpace,
      Text(
        'Fill in the details to Login to your account'.needsToBeTranslated,
        style: textTheme.bodySmall,
      ),
      32.verticalSpace,
    ].column(
      isSliver: true,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      delayFactor: SignInPage.of(context).delayFactor(1),
    );
  }
}
