import 'dart:async';
import 'package:backend_services/backend_services.dart';
import 'package:flutter/material.dart';
import 'package:remainder/app.dart';

void main() async {
  await runZonedGuarded(
    () async {
      await RemainderApp.setup();
      runApp(const RemainderApp());
    },
    (error, stack) {
      AppBackendService.instance.recordError(error, stack);
      debugPrintStack(label: error.toString(), stackTrace: stack);
    },
  );
}
