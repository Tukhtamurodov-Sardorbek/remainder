// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:entry_feature/entry_feature.dart' as _i1;
import 'package:entry_feature/onboarding/onboarding_page.dart' as _i2;
import 'package:entry_feature/sign_up/sign_up_page.dart' as _i3;
import 'package:entry_feature/splash/splash_page.dart' as _i4;

/// generated route for
/// [_i1.EntryPageWrapper]
class EntryRouteWrapper extends _i5.PageRouteInfo<void> {
  const EntryRouteWrapper({List<_i5.PageRouteInfo>? children})
    : super(EntryRouteWrapper.name, initialChildren: children);

  static const String name = 'EntryRouteWrapper';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.WrappedRoute(child: const _i1.EntryPageWrapper());
    },
  );
}

/// generated route for
/// [_i2.OnboardPage]
class OnboardRoute extends _i5.PageRouteInfo<void> {
  const OnboardRoute({List<_i5.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.OnboardPage();
    },
  );
}

/// generated route for
/// [_i3.SignUpPage]
class SignUpRoute extends _i5.PageRouteInfo<void> {
  const SignUpRoute({List<_i5.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.SignUpPage();
    },
  );
}

/// generated route for
/// [_i4.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashPage();
    },
  );
}
