//@GeneratedMicroModule;DatabasePackageModule;package:database/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:database/di/module.dart' as _i45;
import 'package:database/src/database/app_database.dart' as _i116;
import 'package:drift/drift.dart' as _i500;
import 'package:injectable/injectable.dart' as _i526;

class DatabasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final databaseModule = _$DatabaseModule();
    gh.singleton<_i500.QueryExecutor>(
        () => databaseModule.provideQueryExecutor());
    gh.singleton<_i116.AppDatabase>(
        () => databaseModule.provideAppDatabase(gh<_i500.QueryExecutor>()));
  }
}

class _$DatabaseModule extends _i45.DatabaseModule {}
