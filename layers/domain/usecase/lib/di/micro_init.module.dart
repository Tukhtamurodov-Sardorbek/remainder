//@GeneratedMicroModule;UsecasePackageModule;package:usecase/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:repository/repository.dart' as _i585;
import 'package:usecase/di/module.dart' as _i117;
import 'package:usecase/src/entry_usecase.dart' as _i210;

class UsecasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final usecaseModule = _$UsecaseModule();
    gh.factory<_i210.EntryUsecase>(
        () => usecaseModule.injectEntryUsecase(gh<_i585.EntryRepository>()));
  }
}

class _$UsecaseModule extends _i117.UsecaseModule {}
