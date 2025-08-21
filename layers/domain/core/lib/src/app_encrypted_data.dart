import 'dart:convert' show jsonDecode;

import 'package:core/src/env/env.dart';
import 'package:encryptor/encryptor.dart';

final class AppEncryptedData with _Keys {
  const AppEncryptedData._();

  static AppEncryptedData? _instance;

  static AppEncryptedData get ref {
    _instance ??= AppEncryptedData._();
    return _instance!;
  }

  Future<String> get dsn => CryptoReader.decrypt(_kDsnKey);

  Future<String> get databaseName => CryptoReader.decrypt(_kDB);

  Future<String> get keychainSharing => CryptoReader.decrypt(_kKeychainSharing);

  Future<String> get iosBannerUnitId => CryptoReader.decrypt(_kIOSBannerUnitId);

  Future<String> get androidBannerUnitId =>
      CryptoReader.decrypt(_kAndroidBannerUnitId);

  Future<String> get androidInterstitialUnitId =>
      CryptoReader.decrypt(_kAndroidInterstitialUnitId);

  Future<String> get androidRewardedUnitId =>
      CryptoReader.decrypt(_kAndroidRewardedUnitId);
}

mixin _Keys {
  List<int> get _kDB => _converter(Env.database);

  List<int> get _kDsnKey => _converter(Env.dsnKey);

  List<int> get _kKeychainSharing => _converter(Env.keychainSharing);

  List<int> get _kIOSBannerUnitId => _converter(Env.iosBannerUnitId);

  List<int> get _kAndroidBannerUnitId => _converter(Env.androidBannerUnitId);

  List<int> get _kAndroidInterstitialUnitId =>
      _converter(Env.androidInterstitialUnitId);

  List<int> get _kAndroidRewardedUnitId =>
      _converter(Env.androidRewardedUnitId);

  List<int> _converter(String jsn) => List<int>.from(jsonDecode(jsn));
}
