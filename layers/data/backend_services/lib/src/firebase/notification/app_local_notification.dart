// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {}
//
// final class AppLocalNotification {
//   const AppLocalNotification._(this.localNotificationsPlugin);
//
//   static AppLocalNotification? _instance;
//
//   static AppLocalNotification get ref {
//     if (_instance != null) return _instance!;
//
//     final plugin = FlutterLocalNotificationsPlugin();
//     plugin.initialize(
//       InitializationSettings(
//         android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
//         iOS: const DarwinInitializationSettings(
//           requestAlertPermission: true,
//           requestBadgePermission: true,
//           requestSoundPermission: true,
//           notificationCategories: <DarwinNotificationCategory>[
//
//           ],
//         ),
//       ),
//
//       /// The `onDidReceiveNotificationResponse` callback is triggered when the user clicks on a notification, and can be used to handle actions like navigation.
//       onDidReceiveNotificationResponse: (NotificationResponse details) {},
//
//       /// Notification actions that don't show the application/user interface,
//       /// the `onDidReceiveBackgroundNotificationResponse` callback is invoked on
//       /// a background isolate. Functions passed to the `onDidReceiveBackgroundNotificationResponse`
//       /// callback need to be annotated with the `@pragma('vm:entry-point')`
//       /// annotation to ensure they are not stripped out by the Dart compiler.
//       onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
//     );
//     _instance = AppLocalNotification._(plugin);
//     return _instance!;
//   }
//
//   final FlutterLocalNotificationsPlugin localNotificationsPlugin;
//
//   // void showSimpleNotification() async {
//   //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//   //     'your_channel_id',
//   //     'your_channel_name',
//   //     'your_channel_description',
//   //     importance: Importance.max,
//   //     priority: Priority.high,
//   //     ticker: 'ticker',
//   //   );
//   //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
//   //   var platformChannelSpecifics = NotificationDetails(
//   //     android: androidPlatformChannelSpecifics,
//   //     iOS: iOSPlatformChannelSpecifics,
//   //   );
//   //   await flutterLocalNotificationsPlugin.show(
//   //     0,
//   //     'Hello!',
//   //     'This is a simple notification.',
//   //     platformChannelSpecifics,
//   //   );
//   // }
//   // Future<void> showFullScreenNotification() async {
//   //   const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
//   //     'full_screen_channel',
//   //     'Full Screen Notifications',
//   //     channelDescription: 'Medicine reminder channel',
//   //     importance: Importance.max,
//   //     priority: Priority.high,
//   //     fullScreenIntent: true, // 👈 enables full-screen
//   //   );
//   //
//   //   const NotificationDetails details = NotificationDetails(android: androidDetails);
//   //
//   //   await flutterLocalNotificationsPlugin.show(
//   //     0,
//   //     'Medicine Reminder 💊',
//   //     'It’s time to take your pill',
//   //     details,
//   //   );
//   // }
//
// }

import 'dart:ui' show Color;
import 'package:awesome_notifications/android_foreground_service.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:core/core.dart' show AppNavigatorKey;
import 'package:flutter/material.dart' show Colors;

final class AppAwesomeNotification {
  Future<void> requestNotificationPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) {
      // Request permission from the user
      await AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  Future<void> showFullScreenNotification() async {
    await requestNotificationPermission();
    // await AwesomeNotifications().createNotification(
    //     content: NotificationContent(
    //         id: 0,
    //         channelKey: 'basic_channel',
    //         title: 'This title is written in english',
    //         body: 'Now it is really easy to translate a notification content, '
    //             'including images and buttons!',
    //         summary: 'Awesome Notifications Translations',
    //         notificationLayout: NotificationLayout.BigPicture,
    //         bigPicture: 'asset://assets/images/awn-rocks-en.jpg',
    //         largeIcon: 'asset://assets/images/american.jpg',
    //         payload: {'uuid': 'user-profile-uuid'}),
    //     actionButtons: [
    //       NotificationActionButton(
    //           key: 'AGREED1', label: 'I agree', autoDismissible: true),
    //       NotificationActionButton(
    //           key: 'AGREED2', label: 'I agree too', autoDismissible: true),
    //     ],
    //     localizations: {
    //       'pt-br' : NotificationLocalization(
    //           title: 'Este título está escrito em português do Brasil!',
    //           body: 'Agora é muito fácil traduzir o conteúdo das notificações, '
    //               'incluindo imagens e botões!',
    //           summary: 'Traduções Awesome Notifications',
    //           bigPicture: 'asset://assets/images/awn-rocks-pt-br.jpg',
    //           largeIcon: 'asset://assets/images/brazilian.jpg',
    //           buttonLabels: {
    //             'AGREED1': 'Eu concordo!',
    //             'AGREED2': 'Eu concordo também!'
    //           }
    //       ),
    //       'zh': NotificationLocalization(
    //           title: '这个标题是用中文写的',
    //           body: '现在，轻松翻译通知内容，包括图像和按钮！',
    //           summary: '',
    //           bigPicture: 'asset://assets/images/awn-rocks-zh.jpg',
    //           largeIcon: 'asset://assets/images/chinese.jpg',
    //           buttonLabels: {
    //             'AGREED1': '我同意',
    //             'AGREED2': '我也同意'
    //           }
    //       ),
    //       'ko': NotificationLocalization(
    //           title: '이 타이틀은 한국어로 작성되었습니다',
    //           body: '이제 이미지 및 버튼을 포함한 알림 콘텐츠를 쉽게 번역할 수 있습니다!',
    //           summary: '',
    //           bigPicture: 'asset://assets/images/awn-rocks-ko.jpg',
    //           largeIcon: 'asset://assets/images/korean.jpg',
    //           buttonLabels: {
    //             'AGREED1': '동의합니다',
    //             'AGREED2': '저도 동의합니다'
    //           }
    //       ),
    //     }
    // );
    // await AndroidForegroundService.startAndroidForegroundService(
    //   foregroundStartMode: ForegroundStartMode.stick,
    //   foregroundServiceType: ForegroundServiceType.phoneCall,
    //   content: NotificationContent(
    //     id: 2341234,
    //     body: 'Service is running!',
    //     title: 'Android Foreground Service',
    //     channelKey: 'basic_channel',
    //     bigPicture: 'asset://assets/images/android-bg-worker.jpg',
    //     notificationLayout: NotificationLayout.BigPicture,
    //     category: NotificationCategory.Service,
    //   ),
    //   actionButtons: [
    //     NotificationActionButton(
    //       key: 'SHOW_SERVICE_DETAILS',
    //       label: 'Show details',
    //     ),
    //   ],
    // );
    await AwesomeNotifications().createNotification(
      // content: NotificationContent(
      //   id: 1,
      //   channelKey: 'reminder_channel',
      //   title: 'Medicine Reminder',
      //   body: 'Time to take your pills 💊',
      //   category: NotificationCategory.Navigation,
      //   wakeUpScreen: true,          // wakes screen
      //   fullScreenIntent: true,      // like Google Calendar
      //   autoDismissible: false,
      //   locked: true,
      //   // notificationLayout: NotificationLayout.Default,
      // ),
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(1<<31),
        channelKey: 'full_screen_channel',
        title: 'Medicine Reminder 💊',
        body: 'It’s time to take your pill',
        category: NotificationCategory.Alarm,  // important
        fullScreenIntent: true,                // THIS triggers full-screen
        wakeUpScreen: true,                    // turn screen on
        autoDismissible: false,                // keep it visible until action
        notificationLayout: NotificationLayout.Default,
        payload: {'route': '/reminder'},
      ),
      // schedule: NotificationCalendar.fromDate(
      //   date: DateTime.now().add(Duration(seconds: 5)),
      // ),
      actionButtons: [
        NotificationActionButton(
          key: 'TAKEN',
          label: 'Taken',
          // autoDismissible: true,
          actionType: ActionType.Default,
          isDangerousOption: false,
        ),
        NotificationActionButton(
          key: 'SNOOZE',
          label: 'Snooze',
          autoDismissible: true,
        ),
      ],
    );
    // await AwesomeNotifications().createNotification(
    //   content: NotificationContent(
    //     id: 1,
    //     channelKey: 'full_screen_channel',
    //     title: 'Medicine Reminder 💊',
    //     body: 'It’s time to take your pill',
    //     category: NotificationCategory.Email,
    //     fullScreenIntent: true,
    //     // 👈 key part
    //     wakeUpScreen: true,
    //     // wake screen if off
    //     autoDismissible: false,
    //     // force user to interact
    //     locked: true, // don’t allow swipe dismiss
    //   ),
    // );
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // AppNavigatorKey.navigatorKey.currentState?.pushNamedAndRemoveUntil(
    //   '/notification-page',
    //   (route) => (route.settings.name != '/notification-page') || route.isFirst,
    //   arguments: receivedAction,
    // );
  }

  Future<bool> init() {
    return AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null, // null = default app icon | 'resource://drawable/res_app_icon',
      [
        // NotificationChannel(
        //   channelGroupKey: 'basic_channel_group',
        //   channelKey: 'basic_channel',
        //   channelName: 'Basic notifications',
        //   channelDescription: 'Notification channel for basic tests',
        //   defaultColor: Color(0xFF9D50DD),
        //   ledColor: Colors.white,
        // ),
        // NotificationChannel(
        //   channelKey: 'full_screen_channel',
        //   channelName: 'Full Screen Notifications',
        //   channelDescription: 'Used for full screen medicine reminders',
        //   importance: NotificationImportance.Max,
        //   channelShowBadge: true,
        //   locked: true,
        //   defaultRingtoneType: DefaultRingtoneType.Alarm,
        // ),
        // NotificationChannel(
        //   channelKey: 'reminder_channel',
        //   channelName: 'Reminders',
        //   channelDescription: 'Full-screen reminders like Google Calendar',
        //   importance: NotificationImportance.Max,
        //   // defaultPrivacy: NotificationPrivacy.Public,
        //   // defaultRingtoneType: DefaultRingtoneType.Ringtone,
        //   locked: true,
        //   // playSound: true,
        //   defaultColor: Colors.teal,
        //   channelShowBadge: true,
        //   criticalAlerts: true,
        //   // soundSource: 'resource://raw/alarm_sound', // put alarm_sound.mp3 in android/app/src/main/res/raw
        // ),
        NotificationChannel(
          channelGroupKey: 'reminders',
          channelKey: 'full_screen_channel',
          channelName: 'Reminders & Alarms',
          channelDescription: 'Time-sensitive reminders',
          importance: NotificationImportance.Max,
          defaultRingtoneType: DefaultRingtoneType.Alarm,
          playSound: true,
          enableVibration: true,
          criticalAlerts: true,
          defaultPrivacy: NotificationPrivacy.Public,
          locked: true, // prevents swipe-away on lock screen
          channelShowBadge: false,
          // Category matters for OEMs
          // channelNameLocalized: null,
        ),
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group',
        ),
      ],
      debug: true,
    );
  }
}
