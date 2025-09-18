import 'package:core/core.dart';
import 'package:entry_feature/entry_feature.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen, Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.cupertino();

  @override
  List<AutoRouteGuard> get guards => <AutoRouteGuard>[];

  @override
  List<AutoRoute> get routes => <AutoRoute>[
    AutoRoute(
      path: '/',
      page: EntryRouteWrapper.page,
      children: [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: SignInRoute.page, children: [

        ]),
      ],
    ),
  ];
}
