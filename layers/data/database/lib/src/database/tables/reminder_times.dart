import 'package:database/src/database/tables/schedules.dart';
import 'package:drift/drift.dart';

class ReminderTimesEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get scheduleId => integer().references(SchedulesEntity, #id)();

  TextColumn get time => text()(); // e.g. "08:00"

  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}
