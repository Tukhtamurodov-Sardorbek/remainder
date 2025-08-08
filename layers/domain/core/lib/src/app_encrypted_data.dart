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

  Future<String> get dsn => CryptoReader.decrypt(_dsnKey);

  Future<String> get databaseName => CryptoReader.decrypt(_kDB);

  Future<String> get keychainSharing => CryptoReader.decrypt(_kKeychainSharing);
}

mixin _Keys {
  List<int> get _kDB => _converter(Env.database);

  List<int> get _dsnKey => _converter(Env.dsnKey);

  List<int> get _kKeychainSharing => _converter(Env.keychainSharing);

  List<int> _converter(String jsn) => List<int>.from(jsonDecode(jsn));
}
