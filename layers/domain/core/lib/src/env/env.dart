import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Env {
  static String get database => _database;

  static String get keychainSharing => _keychainSharing;

  @EnviedField(varName: 'database', obfuscate: true)
  static final String _database = _Env._database;

  @EnviedField(varName: 'keychainSharing', obfuscate: true)
  static final String _keychainSharing = _Env._keychainSharing;
}
