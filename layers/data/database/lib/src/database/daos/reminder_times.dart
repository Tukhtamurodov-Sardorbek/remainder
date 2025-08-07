import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/reminder_times.dart';

part 'reminder_times.g.dart';

@DriftAccessor(tables: [ReminderTimesEntity])
class ReminderTimesDao
    extends
        BaseDAO<
          int,
          ReminderTimesEntity,
          ReminderTimesEntityData,
          ReminderTimesEntityCompanion
        >
    with _$ReminderTimesDaoMixin {
  ReminderTimesDao(super.attachedDatabase);

  @override
  TableInfo<ReminderTimesEntity, ReminderTimesEntityData> get table =>
      attachedDatabase.reminderTimesEntity;

  @override
  Expression<bool> Function(ReminderTimesEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
