import 'dart:io';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart' show md5;
import 'package:path_provider/path_provider.dart';
import 'package:database/src/database/app_database.dart';

@module
abstract class DatabaseModule {
  @singleton
  QueryExecutor provideQueryExecutor() {
    return LazyDatabase(() async {
      final dbName = await AppEncryptedData.ref.databaseName;
      final dbFolder = await getApplicationDocumentsDirectory();
      final hash = md5.convert(utf8.encode(dbName));
      final file = File(p.join(dbFolder.path, '$hash.sqlite'));

      return NativeDatabase(
        file,
        logStatements: kDebugMode,
        setup: (database) {
          // Check that we're actually running with SQLCipher by quering the cipher_version pragma.
          final result = database.select('pragma cipher_version');
          if (result.isEmpty && Platform.isAndroid) {
            throw UnsupportedError(
              'This database needs to run with SQLCipher, but that library is '
              'not available!',
            );
          }

          final escapedKey = dbName.replaceAll("'", "''");
          database.execute("pragma key = '$escapedKey'");

          // Test that the key is correct by selecting from a table
          database.execute('select count(*) from sqlite_master');
        },
      );
    });
  }

  @singleton
  AppDatabase provideAppDatabase(QueryExecutor executor) =>
      AppDatabase(executor);

  @preResolve
  @singleton
  Future<FlutterSecureStorage> secureStorage() async {
    final keychain = await AppEncryptedData.ref.keychainSharing;
    return FlutterSecureStorage(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        groupId: keychain,
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }
}
