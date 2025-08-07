import 'package:database/src/database/tables/intake_logs.dart';
import 'package:drift/drift.dart';

class SnoozesEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get intakeLogId => integer().references(IntakeLogsEntity, #id)();
  DateTimeColumn get snoozedUntil => dateTime()();
}
