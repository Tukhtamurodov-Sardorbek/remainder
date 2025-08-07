import 'package:database/src/database/app_database.dart';
import 'package:drift/drift.dart';

abstract class BaseDAO<
  IdType,
  Entity extends Table,
  EntityData extends DataClass,
  EntityCompanion extends UpdateCompanion<EntityData>
>
    extends DatabaseAccessor<AppDatabase> {
  BaseDAO(super.attachedDatabase);

  TableInfo<Entity, EntityData> get table;

  Expression<bool> Function(Entity tbl, IdType id) get idFilter;

  Stream<List<EntityData>> observe() {
    return db.select(table).watch();
  }

  Future<List<EntityData>> getAll() {
    return db.select(table).get();
  }

  Future<int> insert(EntityCompanion companion) {
    return db.into(table).insert(companion);
  }

  Future<int> insertOrReplace(EntityCompanion companion) {
    return db.into(table).insert(companion, mode: InsertMode.insertOrReplace);
  }

  Future<void> deleteAll() {
    return db.delete(table).go();
  }

  Future<EntityData?> getById(IdType id) {
    return (select(table)..where((tbl) => idFilter(tbl, id))).getSingleOrNull();
  }

  Future<int> updateById(IdType id, EntityCompanion companion) {
    return (update(table)..where((tbl) => idFilter(tbl, id))).write(companion);
  }

  Future<void> deleteById(IdType id) {
    return (delete(table)..where((tbl) => idFilter(tbl, id))).go();
  }
}

// mixin WithIdSupport<
//   IdType,
//   Entity extends Table,
//   EntityData extends DataClass,
//   EntityCompanion extends UpdateCompanion<EntityData>
// >
//     on BaseDAO<Entity, EntityData, EntityCompanion> {
//   Expression<bool> Function(Entity tbl, IdType id) get idFilter;
//
//   Future<EntityData?> getById(IdType id) {
//     return (select(table)..where((tbl) => idFilter(tbl, id))).getSingleOrNull();
//   }
//
//   Future<int> updateById(IdType id, EntityCompanion companion) {
//     return (update(table)..where((tbl) => idFilter(tbl, id))).write(companion);
//   }
//
//   Future<void> deleteById(IdType id) {
//     return (delete(table)..where((tbl) => idFilter(tbl, id))).go();
//   }
// }
