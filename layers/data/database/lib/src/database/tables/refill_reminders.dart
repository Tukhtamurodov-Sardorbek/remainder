import 'package:database/src/database/tables/medicine.dart';
import 'package:drift/drift.dart';

class RefillRemindersEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get medicineId => integer().references(MedicineEntity, #id)();

  IntColumn get threshold => integer()();

  BoolColumn get notified => boolean().withDefault(const Constant(false))();
}
