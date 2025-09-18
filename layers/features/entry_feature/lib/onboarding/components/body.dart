part of '../onboarding_page.dart';

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reference = OnboardPage.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: AppPageView(
            data: reference._data,
            padEnds: false,
            controller: reference._pageController,
            applyFadeOutAnimation: true,
            currentPageIndex: reference._currentIndex,
            physics: const NeverScrollableScrollPhysics(),
            canAnimate: (index) {
              final currentIndex = reference._currentIndex.value;
              final result = currentIndex - reference._previousPageIndex;
              return result.abs() == 1 ||
                  (index + 2 == currentIndex) ||
                  (index - 2 == reference._previousPageIndex);
            },
            childBuilder: (data, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: reference._horizontalMargin,
                ),
                child: AppAsset.onboarding(
                  index + 1,
                ).displayImage(fit: BoxFit.fitHeight),
              );
            },
          ).wrapWithDownToUpAnimation(delayFactor: 0.4),
        ),
        _IndicatorView(),
        Flexible(
          child: AppPageView(
            data: reference._data,
            padEnds: false,
            applyFadeOutAnimation: true,
            controller: reference._mirroredPageCtrl,
            currentPageIndex: reference._currentIndex,
            physics: const NeverScrollableScrollPhysics(),
            canAnimate: (index) {
              final currentIndex = reference._currentIndex.value;
              final result = currentIndex - reference._previousPageIndex;
              return result.abs() == 1 ||
                  (index + 2 == currentIndex) ||
                  (index - 2 == reference._previousPageIndex);
            },
            childBuilder: (data, index) {
              return [
                Text(
                  reference._data[index].key,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.modifier(
                    color: AppColor.text.shade800,
                    fontWeight: AppFontWeight.semiBold,
                  ),
                ),
                16.verticalSpace,
                Text(
                  reference._data[index].value,
                  // minFontSize: 18,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.modifier(
                    color: AppColor.text.shade800,
                  ),
                ),
              ].column(
                margin: EdgeInsets.symmetric(
                  horizontal: reference._horizontalMargin,
                ),
              );
            },
          ).wrapWithDownToUpAnimation(delayFactor: 0.4),
        ),
      ],
    );
  }
}
