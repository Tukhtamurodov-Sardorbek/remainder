import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/snoozes.dart';

part 'snoozes.g.dart';

@DriftAccessor(tables: [SnoozesEntity])
class SnoozesDao
    extends
        BaseDAO<int, SnoozesEntity, SnoozesEntityData, SnoozesEntityCompanion>
    with _$SnoozesDaoMixin {
  SnoozesDao(super.attachedDatabase);

  @override
  TableInfo<SnoozesEntity, SnoozesEntityData> get table =>
      attachedDatabase.snoozesEntity;

  @override
  Expression<bool> Function(SnoozesEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
