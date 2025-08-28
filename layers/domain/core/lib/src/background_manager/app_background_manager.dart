import 'dart:math';

import 'package:flutter/services.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/services.dart' show PlatformException;
import 'package:flutter_full_screen_intent/flutter_full_screen_intent.dart';
import 'package:receive_intent/receive_intent.dart';
import 'dart:convert'; // for jsonDecode

// Future func() async {
//   final receivedIntent = await ReceiveIntent.getInitialIntent();
//   if (receivedIntent.action == "android.intent.action.MAIN") {
//     final paramsExtra = receivedIntent.extra?["params"];
//     if (paramsExtra != null) {
//       // The received params is a string, so we need to convert it into a json map
//       final params = jsonDecode(params);
//       // use params
//       // params['param1']
//       // params['param2']
//     }
//     final id = receivedIntent.extra?["id"];
//     // navigate user to alarm with given id
//   }
// }

@pragma('vm:entry-point')
void backgroundTask() async {
  await FlutterFullScreenIntent().openFullScreenWidget('/fullScreenTest');
}

final class AppBackgroundManager {
  static Future<void> scheduleOpen() async {
    final duration = const Duration(seconds: 10);
    DateTime time = DateTime.now().add(duration);

    int id = time.hour * 100 + time.minute;
    print('LOOK HERE: $id');
    await Future.wait([
      AndroidAlarmManager.oneShotAt(time, id, backgroundTask, alarmClock: true, wakeup: true),
      printer(duration),
    ]);
    // await AndroidAlarmManager.cancel(id);
  }

  static Future<void> printer(Duration d) async {
    await Future.delayed(d, () {
      print('>>> Fininsh');
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  static Future<String> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await FlutterFullScreenIntent().getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    return platformVersion;
  }
}


