import 'package:database/src/database/tables/medicine.dart';
import 'package:database/src/database/tables/schedules.dart';
import 'package:drift/drift.dart';

class IntakeLogsEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get scheduleId => integer().references(SchedulesEntity, #id)();

  IntColumn get medicineId => integer().references(MedicineEntity, #id)();

  DateTimeColumn get intendedTime => dateTime()();

  DateTimeColumn get actualTime => dateTime().nullable()();

  TextColumn get status =>
      text().withDefault(const Constant('pending'))(); // taken, missed, snoozed

  TextColumn get note => text().nullable()();
}
