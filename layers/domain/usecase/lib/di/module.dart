import 'package:core/core.dart';
import 'package:repository/repository.dart';
import 'package:usecase/src/entry_usecase.dart';
import 'package:usecase/src/impl/entry_usecase_impl.dart';

@module
abstract class UsecaseModule {
  EntryUsecase injectEntryUsecase(EntryRepository repository) {
    return EntryUsecaseImpl(repository);
  }
}
