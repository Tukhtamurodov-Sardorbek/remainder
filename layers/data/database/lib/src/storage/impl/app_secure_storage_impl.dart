import 'package:database/src/storage/app_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'keys.dart';

class AppSecureStorageImpl implements AppSecureStorage {
  final FlutterSecureStorage _storage;

  const AppSecureStorageImpl(this._storage);

  // * Helper methods
  Future<void> _setNumber(_StorageKey storage, num value) async {
    return _storage.write(key: storage.key, value: value.toString());
  }

  // * RUN TIMES
  @override
  Future<int> get getRunTimes async {
    final strData = await _storage.read(key: _StorageKey.runTimes.key) ?? '';
    final result = int.tryParse(strData) ?? 0;
    return result;
  }

  @override
  Future<void> saveRunTimes() async {
    final times = await getRunTimes;
    return _setNumber(_StorageKey.runTimes, times + 1);
  }

  // * PIN
  @override
  Future<bool> get hasPIN async {
    final value = await _storage.read(key: _StorageKey.pin.key);
    return value != null && value.isNotEmpty;
  }

  @override
  Future<String?> get getPIN {
    return _storage.read(key: _StorageKey.pin.key);
  }

  @override
  Future<void> savePIN(String pin) {
    return _storage.write(key: _StorageKey.pin.key, value: pin);
  }

  @override
  Future<void> deletePIN() async {
    return _storage.delete(key: _StorageKey.pin.key);
  }

  // * PIN Attempts
  @override
  Future<int> get getPinAttempts async {
    final attemptStr =
        await _storage.read(key: _StorageKey.pinAttempts.key) ?? '';
    return int.tryParse(attemptStr) ?? 0;
  }

  @override
  Future<void> resetPinAttempts() async {
    return _storage.write(key: _StorageKey.pinAttempts.key, value: '0');
  }

  @override
  Future<int> incrementPinAttempt() async {
    final attempts = await getPinAttempts;
    final newAttempt = attempts + 1;
    await _setNumber(_StorageKey.pinAttempts, newAttempt);
    return newAttempt;
  }

  // * FCM
  @override
  Future<String?> get getFCMToken async {
    final value = await _storage.read(key: _StorageKey.fcmToken.key);
    return value;
  }

  @override
  Future<void> saveFCMToken(String token) {
    return _storage.write(key: _StorageKey.fcmToken.key, value: token);
  }

  // * CLEAR
  @override
  Future<void> clear() {
    return _storage.deleteAll();
  }
}
