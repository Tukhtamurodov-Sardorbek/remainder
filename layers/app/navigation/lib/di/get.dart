import 'package:core/core.dart' show PageRouteInfo, GetIt;
import 'package:navigation/navigation.dart';

final class GetAppNavigator {
  const GetAppNavigator._();

  static AppRouter appRouter() {
    return GetIt.I.get<AppRouter>();
  }

  static EntryNavigator entryNavigator() {
    return GetIt.I.get<EntryNavigator>();
  }

  static MainNavigator mainNavigator() {
    return GetIt.I.get<MainNavigator>();
  }
}

// final class GetAppRoute {
//   const GetAppRoute._();
//
//   static PageRouteInfo get homeRouter {
//     return GetIt.I.get<MainRoutes>().getHomeRouter();
//   }
// }
