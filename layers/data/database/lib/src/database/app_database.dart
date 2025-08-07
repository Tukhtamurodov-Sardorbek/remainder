import 'package:database/src/database/daos/intake_logs.dart';
import 'package:database/src/database/daos/medicine.dart';
import 'package:database/src/database/daos/refill_reminders.dart';
import 'package:database/src/database/daos/reminder_times.dart';
import 'package:database/src/database/daos/schedules.dart';
import 'package:database/src/database/daos/snoozes.dart';
import 'package:database/src/database/daos/user.dart';
import 'package:database/src/database/tables/refill_reminders.dart';
import 'package:database/src/database/tables/snoozes.dart';
import 'package:drift/drift.dart';
import 'package:database/src/database/tables/intake_logs.dart';
import 'package:database/src/database/tables/reminder_times.dart';
import 'package:database/src/database/tables/schedules.dart';
import 'package:database/src/database/tables/user.dart';
import 'package:database/src/database/tables/medicine.dart';
import 'package:sqlcipher_flutter_libs/sqlcipher_flutter_libs.dart';
import 'package:sqlite3/open.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    IntakeLogsEntity,
    MedicineEntity,
    RefillRemindersEntity,
    ReminderTimesEntity,
    SchedulesEntity,
    SnoozesEntity,
    UserEntity,
  ],
  daos: [
    IntakeLogsDao,
    MedicinesDao,
    RefillRemindersDao,
    ReminderTimesDao,
    SchedulesDao,
    SnoozesDao,
    UsersDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e) {
    Future.microtask(() async {
      await applyWorkaroundToOpenSqlCipherOnOldAndroidVersions();
      open.overrideFor(OperatingSystem.android, openCipherOnAndroid);
    }).ignore();
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => destructiveFallback;

  Future<void> clear() async {
    await customStatement('PRAGMA foreign_keys = OFF');
    try {
      await transaction(() async {
        for (final table in allTables) {
          await delete(table).go();
        }
      });
    } finally {
      await customStatement('PRAGMA foreign_keys = ON');
    }
  }
}
