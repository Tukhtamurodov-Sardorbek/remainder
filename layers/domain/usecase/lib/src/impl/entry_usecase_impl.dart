import 'package:usecase/src/entry_usecase.dart';
import 'package:repository/repository.dart';

class EntryUsecaseImpl implements EntryUsecase {
  final EntryRepository _repository;

  const EntryUsecaseImpl(this._repository);

  @override
  Future<int> get runTimes => _repository.runTimes;

  @override
  Future<void> saveRunTimes() => _repository.saveRunTimes();
}
