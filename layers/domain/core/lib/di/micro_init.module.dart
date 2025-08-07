//@GeneratedMicroModule;CorePackageModule;package:core/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:core/di/module.dart' as _i1011;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

class CorePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final coreModule = _$CoreModule();
    await gh.lazySingletonAsync<_i655.PackageInfo>(
      () => coreModule.providePackageInfo(),
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i494.DeviceInfo>(
      () => coreModule.provideDeviceInfo(),
      preResolve: true,
    );
    gh.lazySingleton<_i494.AppDetails>(() => coreModule.provideAppDetails(
          gh<_i655.PackageInfo>(),
          gh<_i494.DeviceInfo>(),
        ));
  }
}

class _$CoreModule extends _i1011.CoreModule {}
