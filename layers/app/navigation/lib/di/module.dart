import 'package:core/core.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation/src/navigation/impl/app_navigator_impl.dart';
import 'package:navigation/src/navigation/impl/entry_navigator_impl.dart';

@module
abstract class NavigationModule {
  @singleton
  AppRouter injectAppRouter() => AppRouter();

  @lazySingleton
  EntryNavigator injectEntryNavigator() {
    return EntryNavigatorImpl();
  }

  @lazySingleton
  MainNavigator injectMainNavigator(AppRouter appRouter) {
    return MainNavigatorImpl(appRouter);
  }
}
