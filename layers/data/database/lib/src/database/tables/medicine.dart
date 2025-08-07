import 'package:drift/drift.dart';

class MedicineEntity extends Table {
  @override
  String? get tableName => 'medicine_table';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()(); // e.g. Paracetamol

  TextColumn get type => text()(); // e.g. tablet, syrup

  TextColumn get strength => text().nullable()(); // e.g. 500mg

  TextColumn get instructions => text().nullable()(); // e.g. after/before meal

  TextColumn get notes => text().nullable()();

  IntColumn get inventoryCount => integer().nullable()();
}
