//@GeneratedMicroModule;DatabasePackageModule;package:database/di/micro_init.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:core/core.dart' as _i494;
import 'package:database/database.dart' as _i252;
import 'package:database/di/module.dart' as _i45;
import 'package:drift/drift.dart' as _i500;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:injectable/injectable.dart' as _i526;

class DatabasePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    final databaseModule = _$DatabaseModule();
    await gh.singletonAsync<_i500.QueryExecutor>(
      () => databaseModule.injectQueryExecutor(),
      preResolve: true,
    );
    gh.singleton<_i558.FlutterSecureStorage>(
        () => databaseModule.injectSecureStorage(gh<_i494.AppDetails>()));
    gh.singleton<_i252.AppDatabase>(
        () => databaseModule.injectAppDatabase(gh<_i500.QueryExecutor>()));
    gh.singleton<_i252.AppSecureStorage>(() => databaseModule
        .injectAppSecureStorage(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i252.IntakeLogsDao>(
        () => databaseModule.injectIntakeLogsDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.MedicinesDao>(
        () => databaseModule.injectMedicinesDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.RefillRemindersDao>(
        () => databaseModule.injectRefillRemindersDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.ReminderTimesDao>(
        () => databaseModule.injectReminderTimesDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.SchedulesDao>(
        () => databaseModule.injectSchedulesDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.SnoozesDao>(
        () => databaseModule.injectSnoozesDao(gh<_i252.AppDatabase>()));
    gh.lazySingleton<_i252.UsersDao>(
        () => databaseModule.injectUsersDao(gh<_i252.AppDatabase>()));
  }
}

class _$DatabaseModule extends _i45.DatabaseModule {}
