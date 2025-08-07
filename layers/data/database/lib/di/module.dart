import 'dart:io';
import 'dart:convert';
import 'package:core/core.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart' show md5;
import 'package:database/src/database/app_database.dart';
import 'package:database/src/storage/app_secure_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:database/src/storage/impl/app_secure_storage_impl.dart';

@module
abstract class DatabaseModule {
  @singleton
  @preResolve
  Future<QueryExecutor> injectQueryExecutor() async {
    final name = await AppEncryptedData.ref.databaseName;
    final dbFolder = await getApplicationDocumentsDirectory();
    final hash = md5.convert(utf8.encode(name));
    final file = File(FilePath.build(dbFolder.path, '$hash.sqlite'));

    final database = NativeDatabase(
      file,
      logStatements: kDebugMode,
      setup: (database) {
        try {
          // Check that we're actually running with SQLCipher by quering the cipher_version pragma.
          final result = database.select('pragma cipher_version');
          if (result.isEmpty && Platform.isAndroid) {
            throw UnsupportedError(
              'This database needs to run with SQLCipher, but that library is '
              'not available!',
            );
          }

          final escapedKey = name.replaceAll("'", "''");
          database.execute("pragma key = '$escapedKey'");

          // Test that the key is correct by selecting from a table
          database.execute('select count(*) from sqlite_master');
        } catch (e, s) {
          debugPrint('Database setup failed: $e\n$s');
          rethrow;
        }
      },
    );

    return LazyDatabase(() => database);
  }

  @singleton
  AppDatabase injectAppDatabase(QueryExecutor executor) =>
      AppDatabase(executor);

  @singleton
  @preResolve
  Future<FlutterSecureStorage> injectSecureStorage(
    AppDetails appDetails,
  ) async {
    return FlutterSecureStorage(
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(
        groupId: appDetails.groupKeychain,
        accessibility: KeychainAccessibility.first_unlock,
      ),
    );
  }

  @singleton
  AppSecureStorage injectAppSecureStorage(FlutterSecureStorage storage) {
    return AppSecureStorageImpl(storage);
  }
}
