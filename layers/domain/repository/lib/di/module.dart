import 'package:core/core.dart';
import 'package:database/database.dart';
import 'package:repository/repository.dart';
import 'package:repository/src/impl/entry_repository_impl.dart';

@module
abstract class RepositoryModule {
  EntryRepository injectEntryRepository(AppSecureStorage storage) {
    return EntryRepositoryImpl(storage);
  }
}
