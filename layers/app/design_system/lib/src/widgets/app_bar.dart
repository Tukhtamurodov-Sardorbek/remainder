import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;
import 'package:flutter/material.dart' as material;

typedef AppBar = MyAppBar;

class MyAppBar extends material.AppBar {
  MyAppBar(
    material.BuildContext context, {
    super.key,
    String? title,
    super.actions,
    super.titleTextStyle,
    super.centerTitle = true,
    super.automaticallyImplyLeading,
  }) : super(
         title: title == null ? null : material.Text(title),
         systemOverlayStyle: context.getSystemUiOverlayStyle,
         leading: material.IconButton(
           onPressed: context.maybePop,
           iconSize: material.Theme.of(context).iconTheme.size ?? 24.r,
           icon: material.Icon(
             material.Icons.arrow_back_ios_new_rounded,
             semanticLabel: material.MaterialLocalizations.of(
               context,
             ).backButtonTooltip,
           ),
           tooltip: defaultTargetPlatform == material.TargetPlatform.android
               ? material.MaterialLocalizations.of(context).backButtonTooltip
               : null,
         ),
       );
}
