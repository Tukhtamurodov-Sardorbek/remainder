import 'package:drift/drift.dart';

class UserEntity extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  IntColumn get age => integer().nullable()();

  TextColumn get gender => text().nullable()();

  RealColumn get weight => real().nullable()();

  TextColumn get allergies => text().nullable()();

  TextColumn get medicalNotes => text().nullable()();
}
