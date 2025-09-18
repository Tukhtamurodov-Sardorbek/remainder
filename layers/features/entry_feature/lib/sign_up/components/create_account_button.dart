part of '../sign_up_page.dart';

class _CreateAnAccountButton extends StatelessWidget {
  const _CreateAnAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return [
      32.verticalSpace,
      PrimaryButton(
        onPressed: () {},
        isDark: context.isDark,
        child: Text('Create an account'.needsToBeTranslated),
      ),
      16.verticalSpace,
      AppTaggedText(
        text:
            'By Signing up, You agree to the ${AppTaggedText.wrapArgument('Term of Service')} and ${AppTaggedText.wrapArgument('Privacy Policy')}'
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
      delayFactor: SignUpPage.of(context).delayFactor(3),
    );
  }
}
