abstract class AppSecureStorage {
  // * PIN
  Future<bool> hasPIN();

  Future<String?> getPIN();

  Future<void> savePIN(String pin);

  Future<void> deletePIN();

  // * PIN Attempts
  Future<int> getPinAttempts();

  Future<void> resetPinAttempts();

  Future<int> incrementPinAttempt();

  // * FCM
  Future<String?> getFCMToken();

  Future<void> saveFCMToken(String token);

  // * CLEAR
  Future<void> clear();
}
