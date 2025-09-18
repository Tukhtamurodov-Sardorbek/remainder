part of '../sign_in_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return [
      32.verticalSpace,
      PrimaryButton(
        onPressed: () {},
        isDark: context.isDark,
        child: Text('Login'.needsToBeTranslated),
      ),
      16.verticalSpace,
      AppTaggedText(
        text:
        'Forgot your Password? ${AppTaggedText.wrapArgument('Click Here')}'
            .needsToBeTranslated,
        taggedStyle: textTheme.labelSmall!.modifier(
          fontWeight: AppFontWeight.regular,
          color: AppColor.primaryBlue.shade500,
        ),
        defaultStyle: textTheme.labelSmall!.modifier(
          fontWeight: AppFontWeight.regular,
          color: AppColor.text.shade800,
        ),
        onTagPressed: () {},
      ),
    ].column(
      isSliver: true,
      delayFactor: SignInPage.of(context).delayFactor(3),
    );
  }
}
