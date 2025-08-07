import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/medicine.dart';
import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late MedicinesDao dao;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    dao = database.medicinesDao;
  });

  tearDown(() async {
    await database.close();
  });

  group('Check BaseDAO using MedicinesDao implementation', () {
    test('insert and getAll', () async {
      final medicine = MedicineEntityCompanion.insert(
        name: 'Paracetamol',
        type: 'Tablet',
        strength: Value('500mg'),
        instructions: Value('After meal'),
        notes: Value('No alcohol'),
        inventoryCount: Value(10),
      );

      await dao.insert(medicine);

      final result = await dao.getAll();

      expect(result.length, 1);
      expect(result.first.name, 'Paracetamol');
      expect(result.first.type, 'Tablet');
    });

    test('insertOrReplace should update existing entry with same id', () async {
      final medicine = MedicineEntityCompanion.insert(
        name: 'Paracetamol',
        type: 'Tablet',
        strength: Value('500mg'),
        instructions: Value('After meal'),
        notes: Value('No alcohol'),
        inventoryCount: Value(10),
      );

      await dao.insert(medicine);

      final inserted = await dao.getAll();
      final updatedMedicine = MedicineEntityCompanion(
        id: Value(inserted.first.id),
        name: Value('Ibuprofen'),
        type: Value('Tablet'),
        strength: Value('400mg'),
        instructions: Value('Before meal'),
        notes: Value('Take with water'),
        inventoryCount: Value(5),
      );

      await dao.insertOrReplace(updatedMedicine);

      final all = await dao.getAll();
      expect(all.length, 1);
      expect(all.first.name, 'Ibuprofen');
      expect(all.first.strength, '400mg');
    });

    test('deleteAll should remove all entries', () async {
      final medicine = MedicineEntityCompanion.insert(
        name: 'Paracetamol',
        type: 'Tablet',
        strength: Value('500mg'),
      );

      await dao.insert(medicine);

      await dao.deleteAll();

      final result = await dao.getAll();
      expect(result, isEmpty);
    });

    test('observe should emit changes', () async {
      final medicine = MedicineEntityCompanion.insert(
        name: 'Paracetamol',
        type: 'Tablet',
      );

      final stream = dao.observe();

      final emissions = <List<MedicineEntityData>>[];

      final sub = stream.listen(emissions.add);

      await Future.delayed(Duration(milliseconds: 100));
      await dao.insert(medicine);
      await Future.delayed(Duration(milliseconds: 100));

      expect(emissions.length, greaterThanOrEqualTo(2));
      expect(emissions.last.first.name, 'Paracetamol');

      await sub.cancel();
    });
  });

  group('Check WithIdSupport using MedicinesDao implementation', () {
    test('getById should return the correct medicine', () async {
      final insertedId = await dao.insert(
        MedicineEntityCompanion(
          name: Value('Paracetamol'),
          type: Value('Tablet'),
          strength: Value('500mg'),
          instructions: Value('After meal'),
          notes: Value('No alcohol'),
          inventoryCount: Value(10),
        ),
      );

      final medicine = await dao.getById(insertedId);

      expect(medicine, isNotNull);
      expect(medicine!.id, equals(insertedId));
      expect(medicine.name, equals('Paracetamol'));
    });

    test('deleteById should remove the correct medicine', () async {
      final insertedId = await dao.insert(
        MedicineEntityCompanion(
          name: Value('Ibuprofen'),
          type: Value('Capsule'),
          inventoryCount: Value(5),
        ),
      );

      await dao.deleteById(insertedId);
      final result = await dao.getById(insertedId);

      expect(result, isNull);
    });
  });
}
