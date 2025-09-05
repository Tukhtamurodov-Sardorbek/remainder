import 'dart:async';
import 'dart:isolate' show Isolate;
import 'package:backend_services/backend_services.dart';
// import 'package:core/core.dart' show AndroidAlarmManager;
import 'package:design_system/design_system.dart' show ScreenUtilInit;
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

void main() async {
  await runZonedGuarded(
    () async {
      await RemainderApp.setup();
      runApp(
        ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          designSize: const Size(390, 844),
          child: const RemainderApp(),
          builder: (context, child) {
            FlutterNativeSplash.remove();
            return child!;
            // return EasyLocalization(
            //   useOnlyLangCode: true,
            //   useFallbackTranslations: true,
            //   path: AppLocaleConfig.localePath,
            //   fallbackLocale: const Locale(AppLocaleConfig.fallbackLocale),
            //   supportedLocales: AppLocale.values
            //       .map((e) => Locale(e.languageCode))
            //       .toList(),
            //   child: child!,
            // );
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
