import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/schedules.dart';

part 'schedules.g.dart';

@DriftAccessor(tables: [SchedulesEntity])
class SchedulesDao
    extends
        BaseDAO<
          int,
          SchedulesEntity,
          SchedulesEntityData,
          SchedulesEntityCompanion
        >
    with _$SchedulesDaoMixin {
  SchedulesDao(super.attachedDatabase);

  @override
  TableInfo<SchedulesEntity, SchedulesEntityData> get table =>
      attachedDatabase.schedulesEntity;

  @override
  Expression<bool> Function(SchedulesEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
