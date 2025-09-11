//@GeneratedMicroModule;AppBlocPackageModule;package:app_bloc/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:app_bloc/app_bloc.dart' as _i995;
import 'package:app_bloc/di/module.dart' as _i27;
import 'package:injectable/injectable.dart' as _i526;
import 'package:usecase/usecase.dart' as _i211;

class AppBlocPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final appBlocModule = _$AppBlocModule();
    gh.lazySingleton<_i995.PopHandlerCubit>(
        () => appBlocModule.injectPopHandlerCubit());
    gh.factory<_i995.EntryCubit>(
        () => appBlocModule.injectEntryCubit(gh<_i211.EntryUsecase>()));
  }
}

class _$AppBlocModule extends _i27.AppBlocModule {}
