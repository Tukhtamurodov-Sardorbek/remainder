part of 'app_secure_storage_impl.dart';

enum _StorageKey {
  runTimes('RUN_TIMES'),
  pin('APP_PIN'),
  fcmToken('FCM_TOKEN'),
  pinAttempts('APP_PIN_ATTEMPTS');

  final String key;

  const _StorageKey(this.key);
}
