import 'package:drift/drift.dart';
import 'package:database/src/database/tables/user.dart';
import 'package:database/src/database/app_database.dart';
import 'package:database/src/database/daos/base_dao.dart';

part 'user.g.dart';

@DriftAccessor(tables: [UserEntity])
class UsersDao
    extends BaseDAO<int, UserEntity, UserEntityData, UserEntityCompanion>
    with _$UsersDaoMixin {
  UsersDao(super.attachedDatabase);

  @override
  TableInfo<UserEntity, UserEntityData> get table =>
      attachedDatabase.userEntity;

  @override
  Expression<bool> Function(UserEntity tbl, int id) get idFilter =>
      (tbl, id) => tbl.id.equals(id);
}
