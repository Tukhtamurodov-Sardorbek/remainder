import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart' hide AppBar;

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with AppStatefulMixin {
  late final TextEditingController _nameCtrl, _emailCtrl, _passwordCtrl;
  late final ValueNotifier<bool> _obscurePassword;
  List<(String, String, TextEditingController)>? _data;

  List<(String, String, TextEditingController)> get data => _data ??= [
    ('Name', 'Enter your name', _nameCtrl),
    ('Email', 'Enter your email address', _emailCtrl),
    ('Password', 'Enter your desired password', _passwordCtrl),
  ];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
    _obscurePassword = ValueNotifier(true);
  }

  @override
  void dispose() {
    _obscurePassword.dispose();
    _passwordCtrl.dispose();
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign Up'.needsToBeTranslated,
                    style: theme.textTheme.titleLarge,
                  ),
                  8.verticalSpace,
                  Text(
                    'Fill in the details to create your account'
                        .needsToBeTranslated,
                    style: theme.textTheme.bodySmall,
                  ),
                  32.verticalSpace,
                ],
              ),
            ),
            SliverList.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data[index].$1,
                      style: theme.textTheme.bodyMedium?.modifier(
                        fontWeight: AppFontWeight.medium,
                      ),
                    ),
                    8.verticalSpace,
                    AppTextFormField(
                      context: context,
                      filled: true,
                      fillColor: AppColor.white,
                      hintText: data[index].$2,
                      controller: data[index].$3,
                    ).conditionalWrapper(
                      condition: index == 2,
                      wrapper: (_) {
                        return ValueListenableBuilder(
                          valueListenable: _obscurePassword,
                          builder: (context, value, _) {
                            return AppTextFormField(
                              filled: true,
                              context: context,
                              obscureText: value,
                              hintText: data[2].$2,
                              controller: data[2].$3,
                              fillColor: AppColor.white,
                              type: TextFieldType.password(_obscurePassword),
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => 16.verticalSpace,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
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
                    taggedStyle: theme.textTheme.labelSmall!.modifier(
                      fontWeight: AppFontWeight.regular,
                      color: AppColor.primaryBlue.shade500,
                    ),
                    defaultStyle: theme.textTheme.labelSmall!.modifier(
                      fontWeight: AppFontWeight.regular,
                      color: AppColor.text.shade800,
                    ),
                  ),
                  32.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: AppColor.neutral.shade500),
                      ),
                      10.horizontalSpace,
                      Text(
                        ' or ',
                        style: theme.textTheme.labelMedium?.modifier(
                          color: AppColor.neutral.shade500,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Divider(color: AppColor.neutral.shade500),
                      ),
                    ],
                  ),
                  32.verticalSpace,
                  PrimaryButton(
                    onPressed: () {},
                    backgroundColor: AppColor.white,
                    border: ButtonBorder.withBorder(
                      color: AppColor.buttonDisabled,
                    ),
                    isDark: context.isDark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppAsset.icAppleLogo.displayImage(
                          height: 24.r,
                          width: 24.r,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Continue with Apple'.needsToBeTranslated,
                          style: theme.textTheme.bodyMedium?.modifier(
                            color: AppColor.text.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.verticalSpace,
                  PrimaryButton(
                    onPressed: () {},
                    backgroundColor: AppColor.white,
                    border: ButtonBorder.withBorder(
                      color: AppColor.buttonDisabled,
                    ),
                    isDark: context.isDark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppAsset.icGoogleLogo.displayImage(
                          height: 24.r,
                          width: 24.r,
                        ),
                        10.horizontalSpace,
                        Text(
                          'Continue with Google'.needsToBeTranslated,
                          style: theme.textTheme.bodyMedium?.modifier(
                            color: AppColor.text.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                minimum: EdgeInsets.only(bottom: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppTaggedText(
                      text:
                          'Already Have an account? ${AppTaggedText.wrapArgument('Sign in')}'
                              .needsToBeTranslated,
                      taggedStyle: theme.textTheme.labelSmall!.modifier(
                        color: AppColor.primaryBlue.shade500,
                      ),
                      defaultStyle: theme.textTheme.labelSmall!.modifier(
                        fontWeight: AppFontWeight.regular,
                        color: AppColor.text.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
