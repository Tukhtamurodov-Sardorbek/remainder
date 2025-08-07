import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/refill_reminders.dart';

part 'refill_reminders.g.dart';

@DriftAccessor(tables: [RefillRemindersEntity])
class RefillRemindersDao
    extends
        BaseDAO<
          int,
          RefillRemindersEntity,
          RefillRemindersEntityData,
          RefillRemindersEntityCompanion
        >
    with _$RefillRemindersDaoMixin {
  RefillRemindersDao(super.attachedDatabase);

  @override
  TableInfo<RefillRemindersEntity, RefillRemindersEntityData> get table =>
      refillRemindersEntity;

  @override
  Expression<bool> Function(RefillRemindersEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
