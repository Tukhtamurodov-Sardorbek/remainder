// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:entry_feature/entry_feature.dart' as _i1;
import 'package:entry_feature/onboarding/onboarding_page.dart' as _i3;
import 'package:entry_feature/sign_in/forgot_password/forgot_password_page.dart'
    as _i2;
import 'package:entry_feature/sign_in/sign_in_page.dart' as _i4;
import 'package:entry_feature/sign_up/sign_up_page.dart' as _i5;
import 'package:entry_feature/splash/splash_page.dart' as _i6;

/// generated route for
/// [_i1.EntryPageWrapper]
class EntryRouteWrapper extends _i7.PageRouteInfo<void> {
  const EntryRouteWrapper({List<_i7.PageRouteInfo>? children})
    : super(EntryRouteWrapper.name, initialChildren: children);

  static const String name = 'EntryRouteWrapper';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i7.WrappedRoute(child: const _i1.EntryPageWrapper());
    },
  );
}

/// generated route for
/// [_i2.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i7.PageRouteInfo>? children})
    : super(ForgotPasswordRoute.name, initialChildren: children);

  static const String name = 'ForgotPasswordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [_i3.OnboardPage]
class OnboardRoute extends _i7.PageRouteInfo<void> {
  const OnboardRoute({List<_i7.PageRouteInfo>? children})
    : super(OnboardRoute.name, initialChildren: children);

  static const String name = 'OnboardRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardPage();
    },
  );
}

/// generated route for
/// [_i4.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute({List<_i7.PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignInPage();
    },
  );
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
    : super(SignUpRoute.name, initialChildren: children);

  static const String name = 'SignUpRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignUpPage();
    },
  );
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashPage();
    },
  );
}
