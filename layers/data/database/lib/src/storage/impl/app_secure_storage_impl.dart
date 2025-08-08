import 'package:database/src/storage/app_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'keys.dart';

class AppSecureStorageImpl implements AppSecureStorage {
  final FlutterSecureStorage _storage;

  const AppSecureStorageImpl(this._storage);

  // * PIN
  @override
  Future<bool> hasPIN() async {
    final value = await _storage.read(key: _StorageKey.pin.key);
    return value != null && value.isNotEmpty;
  }

  @override
  Future<String?> getPIN() async {
    return _storage.read(key: _StorageKey.pin.key);
  }

  @override
  Future<void> savePIN(String pin) async {
    return _storage.write(key: _StorageKey.pin.key, value: pin);
  }

  @override
  Future<void> deletePIN() async {
    return _storage.delete(key: _StorageKey.pin.key);
  }

  // * PIN Attempts
  @override
  Future<int> getPinAttempts() async {
    final attemptStr = await _storage.read(key: _StorageKey.pinAttempts.key);
    if (attemptStr != null) {
      return int.tryParse(attemptStr) ?? 0;
    }
    return 0;
  }

  @override
  Future<void> resetPinAttempts() async {
    return _storage.write(key: _StorageKey.pinAttempts.key, value: '0');
  }

  @override
  Future<int> incrementPinAttempt() async {
    final attempts = await getPinAttempts();
    final newAttempt = attempts + 1;

    await _storage.write(
      key: _StorageKey.pinAttempts.key,
      value: newAttempt.toString(),
    );

    return newAttempt;
  }

  // * FCM
  @override
  Future<String?> getFCMToken() async {
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
