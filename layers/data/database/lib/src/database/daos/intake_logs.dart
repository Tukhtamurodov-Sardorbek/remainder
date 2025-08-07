import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/intake_logs.dart';

part 'intake_logs.g.dart';

@DriftAccessor(tables: [IntakeLogsEntity])
class IntakeLogsDao
    extends
        BaseDAO<
          int,
          IntakeLogsEntity,
          IntakeLogsEntityData,
          IntakeLogsEntityCompanion
        >
    with _$IntakeLogsDaoMixin {
  IntakeLogsDao(super.attachedDatabase);

  @override
  TableInfo<IntakeLogsEntity, IntakeLogsEntityData> get table =>
      intakeLogsEntity;

  @override
  Expression<bool> Function(IntakeLogsEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
