import 'package:database/database.dart';
import 'package:repository/src/entry_repository.dart';

class EntryRepositoryImpl implements EntryRepository {
  final AppSecureStorage _appStorage;

  const EntryRepositoryImpl(this._appStorage);

  @override
  Future<int> get runTimes => _appStorage.getRunTimes;

  @override
  Future<void> saveRunTimes() => _appStorage.saveRunTimes();
}
