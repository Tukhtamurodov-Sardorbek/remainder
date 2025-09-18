import 'dart:async';
import 'dart:isolate' show Isolate;

import 'package:core/core.dart';
import 'package:backend_services/backend_services.dart';

// import 'package:core/core.dart' show AndroidAlarmManager;
import 'package:design_system/design_system.dart' show ScreenUtilInit;
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:remainder/app.dart';

// Be sure to annotate your callback function to avoid issues in release mode on Flutter >= 3.3.0
@pragma('vm:entry-point')
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

Future<void> template({bool enableDevicePreview = false}) async {
  await runZonedGuarded(
    () async {
      await Future.microtask(RemainderApp.setup);
      runApp(
        DevicePreview(
          enabled: enableDevicePreview,
          builder: (context) {
            return ScreenUtilInit(
              minTextAdapt: true,
              splitScreenMode: true,
              useInheritedMediaQuery: true,
              designSize: const Size(390, 844),
              child: const RemainderApp(),
              builder: (context, child) {
                FlutterNativeSplash.remove();
                return EasyLocalization(
                  useOnlyLangCode: true,
                  useFallbackTranslations: true,
                  path: AppLocaleConfig.localePath,
                  fallbackLocale: const Locale(AppLocaleConfig.fallbackLocale),
                  supportedLocales: AppLocale.values
                      .map((e) => Locale(e.languageCode))
                      .toList(),
                  child: child!,
                );
              },
            );
          },
        ),
      );
      // final int helloAlarmID = 0;
      // await AndroidAlarmManager.periodic(
      //   const Duration(seconds: 4),
      //   helloAlarmID,
      //   printHello,
      // );
    },
    (error, stack) {
      AppBackendService.instance.recordError(error, stack);
      debugPrintStack(label: error.toString(), stackTrace: stack);
    },
  );
}
