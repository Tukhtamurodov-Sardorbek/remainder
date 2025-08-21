import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  static String get dsnKey => _dsnKey;

  static String get database => _database;

  static String get keychainSharing => _keychainSharing;

  static String get iosBannerUnitId => _iosBannerUnitId;

  static String get androidBannerUnitId => _androidBannerUnitId;

  static String get androidInterstitialUnitId => _androidInterstitialUnitId;

  static String get androidRewardedUnitId => _androidRewardedUnitId;

  @EnviedField(varName: 'database', obfuscate: true)
  static final String _database = _Env._database;

  @EnviedField(varName: 'keychainSharing', obfuscate: true)
  static final String _keychainSharing = _Env._keychainSharing;

  @EnviedField(varName: 'dsnKey', obfuscate: true)
  static final String _dsnKey = _Env._dsnKey;

  @EnviedField(varName: 'iosBannerUnitId', obfuscate: true)
  static final String _iosBannerUnitId = _Env._iosBannerUnitId;

  @EnviedField(varName: 'androidBannerUnitId', obfuscate: true)
  static final String _androidBannerUnitId = _Env._androidBannerUnitId;

  @EnviedField(varName: 'androidInterstitialUnitId', obfuscate: true)
  static final String _androidInterstitialUnitId = _Env._androidInterstitialUnitId;

  @EnviedField(varName: 'androidRewardedUnitId', obfuscate: true)
  static final String _androidRewardedUnitId = _Env._androidRewardedUnitId;
}
