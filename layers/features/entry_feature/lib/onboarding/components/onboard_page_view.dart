// part of '../onboarding_page.dart';
//
// final count = ValueNotifier<int>(0);
//
// final jkjk = DerivedValueNotifier<int, bool>(count, (val) => val == 0);
//
// class _OnboardPageView extends StatelessWidget {
//   const _OnboardPageView();
//
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: currentIndex,
//       builder: (context, currentIndex, child) {
//         return AnimatedSwitcher(
//           duration: const Duration(milliseconds: 250),
//           layoutBuilder: (currentChild, previousChildren) {
//             return Stack(
//               alignment: Alignment.topCenter,
//               children: <Widget>[
//                 ...previousChildren,
//                 if (currentChild != null) currentChild,
//               ],
//             );
//           },
//           transitionBuilder: transition,
//           child: currentIndex == 0
//               ? AppAsset.onboardImage1.displayImage(
//                   key: ValueKey(pageKey(0)),
//                   fit: BoxFit.cover,
//                 )
//               : AppAsset.onboardImage2.displayImage(
//                   key: ValueKey(pageKey(1)),
//                   fit: BoxFit.cover,
//                 ),
//         );
//       },
//     ).wrapWithDownToUpAnimation(delayFactor: 0.4);
//   }
//
//
//   String pageKey(int index) => 'page_$index';
//
//   Widget transition(Widget child, Animation<double> animation) {
//     final inAnimation = Tween<Offset>(
//       begin: Offset(1.0, 0.0),
//       end: Offset(0.0, 0.0),
//     ).animate(animation);
//     final outAnimation = Tween<Offset>(
//       begin: Offset(-1.0, 0.0),
//       end: Offset(0.0, 0.0),
//     ).animate(animation);
//
//     if (child.key == ValueKey(pageKey(1))) {
//       return FadeTransition(
//         opacity: animation,
//         child: ClipRect(
//           child: SlideTransition(
//             position: inAnimation,
//             child: Padding(padding: const EdgeInsets.all(8.0), child: child),
//           ),
//         ),
//       );
//     } else {
//       return FadeTransition(
//         opacity: animation,
//         child: ClipRect(
//           child: SlideTransition(
//             position: outAnimation,
//             child: Padding(padding: const EdgeInsets.all(8.0), child: child),
//           ),
//         ),
//       );
//     }
//   }
// }
//
// class _TitleView extends StatelessWidget {
//   final int index;
//
//   const _TitleView(this.index);
//
//   @override
//   Widget build(BuildContext context) {
//     final reference = OnboardPage.of(context);
//     final title = index == 0 ? LocaleKeys.pdfScanner : LocaleKeys.rateUs;
//     final subtitle = index == 0
//         ? LocaleKeys.easilyScanDocumentsOrConvertThemToPdf
//         : LocaleKeys.helpUsImproveWithYourFeedback;
//
//     return AnimatedSwitcher(
//       transitionBuilder: reference.transition,
//       duration: const Duration(milliseconds: 200),
//       child: Column(
//         key: ValueKey(reference.pageKey(index)),
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title.tr(), style: AppTextStyle.w600.modifier(fontSize: 36)),
//           Flexible(
//             child: Text(
//               subtitle.tr(),
//               maxLines: 4,
//               style: AppTextStyle.w400.modifier(
//                 fontSize: 20,
//                 color: AppColor.textSecondary,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
