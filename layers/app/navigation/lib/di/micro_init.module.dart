//@GeneratedMicroModule;NavigationPackageModule;package:navigation/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/di/module.dart' as _i948;
import 'package:navigation/navigation.dart' as _i1058;

class NavigationPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final navigationModule = _$NavigationModule();
    gh.singleton<_i1058.AppRouter>(() => navigationModule.injectAppRouter());
    gh.lazySingleton<_i1058.EntryNavigator>(
        () => navigationModule.injectEntryNavigator());
    gh.lazySingleton<_i1058.MainNavigator>(
        () => navigationModule.injectMainNavigator(gh<_i1058.AppRouter>()));
  }
}

class _$NavigationModule extends _i948.NavigationModule {}
