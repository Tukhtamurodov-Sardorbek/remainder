abstract class EntryRepository {
  Future<int> get runTimes;

  Future<void> saveRunTimes();
}
