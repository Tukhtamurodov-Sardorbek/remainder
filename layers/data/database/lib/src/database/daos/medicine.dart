import 'package:drift/drift.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';
import 'package:database/src/database/tables/medicine.dart';

part 'medicine.g.dart';

@DriftAccessor(tables: [MedicineEntity])
class MedicinesDao
    extends
        BaseDAO<
          int,
          MedicineEntity,
          MedicineEntityData,
          MedicineEntityCompanion
        >
    with _$MedicinesDaoMixin {
  MedicinesDao(super.attachedDatabase);

  @override
  TableInfo<MedicineEntity, MedicineEntityData> get table =>
      attachedDatabase.medicineEntity;

  @override
  Expression<bool> Function(MedicineEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
