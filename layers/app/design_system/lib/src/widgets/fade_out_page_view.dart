import 'package:flutter/material.dart';

class AppPageView<T> extends PageView {
  AppPageView({
    super.key,
    super.padEnds,
    super.physics,
    super.controller,
    required List<T> data,
    bool Function(int)? canAnimate,
    bool applyFadeOutAnimation = false,
    required Widget Function(T, int) childBuilder,
    required ValueNotifier<int> currentPageIndex,
    Duration fadeOutDuration = const Duration(milliseconds: 200),
  }) : super(
         children: List.generate(data.length, (index) {
           if (!applyFadeOutAnimation) {
             return childBuilder.call(data[index], index);
           }
           return ValueListenableBuilder(
             valueListenable: currentPageIndex,
             builder: (context, value, _) {
               final animate = canAnimate?.call(index);
               if (animate == false) {
                 return childBuilder.call(data[index], index);
               }
               return AnimatedSwitcher(
                 duration: fadeOutDuration,
                 transitionBuilder: (child, animation) {
                   return FadeTransition(
                     opacity: CurvedAnimation(
                       parent: animation,
                       curve: Curves.ease,
                     ),
                     child: child,
                   );
                 },
                 child: value == index
                     ? SizedBox(
                         key: ValueKey('page_$index'),
                         child: childBuilder.call(data[index], index),
                       )
                     : SizedBox.shrink(key: ValueKey(index)),
               );
             },
           );
         }),
       );
}
