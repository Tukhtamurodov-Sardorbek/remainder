import 'package:database/src/database/tables/medicine.dart';
import 'package:drift/drift.dart';

class SchedulesEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get medicineId => integer().references(MedicineEntity, #id)();

  DateTimeColumn get startDate => dateTime()();

  DateTimeColumn get endDate => dateTime().nullable()();

  TextColumn get repeatPattern => text()(); // e.g. daily, weekly, custom

  TextColumn get weekdays => text().nullable()(); // e.g. Mon,Wed,Fri
}
