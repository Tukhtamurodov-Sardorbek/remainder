import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AlternativeOptionsView extends StatelessWidget {
  final VoidCallback appleAccountPressed;
  final VoidCallback googleAccountPressed;

  const AlternativeOptionsView({
    super.key,
    required this.appleAccountPressed,
    required this.googleAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return [
      32.verticalSpace,
      Row(
        children: [
          Expanded(child: Divider(color: AppColor.neutral.shade500)),
          10.horizontalSpace,
          Text(
            ' or '.needsToBeTranslated,
            style: textTheme.labelMedium?.modifier(
              color: AppColor.neutral.shade500,
            ),
          ),
          10.horizontalSpace,
          Expanded(child: Divider(color: AppColor.neutral.shade500)),
        ],
      ),
      32.verticalSpace,
      PrimaryButton(
        onPressed: appleAccountPressed,
        isDark: context.isDark,
        applyDefaultPressedColor: true,
        backgroundColor: AppColor.white,
        border: ButtonBorder.withBorder(color: AppColor.buttonDisabled),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAsset.icAppleLogo.displayImage(height: 24.r, width: 24.r),
            10.horizontalSpace,
            Text(
              'Continue with Apple'.needsToBeTranslated,
              style: textTheme.bodyMedium?.modifier(
                color: AppColor.text.shade800,
              ),
            ),
          ],
        ),
      ),
      12.verticalSpace,
      PrimaryButton(
        onPressed: googleAccountPressed,
        isDark: context.isDark,
        applyDefaultPressedColor: true,
        backgroundColor: AppColor.white,
        border: ButtonBorder.withBorder(color: AppColor.buttonDisabled),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAsset.icGoogleLogo.displayImage(height: 24.r, width: 24.r),
            10.horizontalSpace,
            Text(
              'Continue with Google'.needsToBeTranslated,
              style: textTheme.bodyMedium?.modifier(
                color: AppColor.text.shade800,
              ),
            ),
          ],
        ),
      ),
    ].column();
  }
}
