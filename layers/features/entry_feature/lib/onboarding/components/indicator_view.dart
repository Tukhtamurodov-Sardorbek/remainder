part of '../onboarding_page.dart';

class _IndicatorView extends StatelessWidget {
  const _IndicatorView();

  @override
  Widget build(BuildContext context) {
    final currentIndex = OnboardPage.of(context).currentIndex;
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      child: AnimatedBuilder(
        animation: currentIndex,
        builder: (context, child) {
          return Row(
            spacing: 4.w,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Indicator(currentIndex.value == 0),
              _Indicator(currentIndex.value == 1),
              _Indicator(currentIndex.value == 2),
            ],
          );
        },
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  final bool isActive;

  const _Indicator([this.isActive = false]);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: isActive ? 24.w : 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(88),
        color: isActive ? AppColor.primaryBlue.shade500 : AppColor.neutral.shade200,
      ),
    );
  }
}
