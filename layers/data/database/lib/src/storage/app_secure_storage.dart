abstract class AppSecureStorage {
  // * RUN TIMES
  Future<int> get getRunTimes;

  Future<void> saveRunTimes();

  // * PIN
  Future<bool> get hasPIN;

  Future<String?> get getPIN;

  Future<void> savePIN(String pin);

  Future<void> deletePIN();

  // * PIN Attempts
  Future<int> get getPinAttempts;

  Future<void> resetPinAttempts();

  Future<int> incrementPinAttempt();

  // * FCM
  Future<String?> get getFCMToken;

  Future<void> saveFCMToken(String token);

  // * CLEAR
  Future<void> clear();
}
