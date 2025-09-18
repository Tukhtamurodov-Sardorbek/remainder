part of '../forgot_password_page.dart';

class _HeaderView extends StatelessWidget {
  const _HeaderView();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return [
      Text('Forgot Password'.needsToBeTranslated, style: textTheme.titleLarge),
      8.verticalSpace,
      Text(
        'Fill in the details to recover your account'.needsToBeTranslated,
        style: textTheme.bodySmall,
      ),
      32.verticalSpace,
    ].column(
      isSliver: true,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      delayFactor: ForgotPasswordPage.of(context).delayFactor(1),
    );
  }
}
