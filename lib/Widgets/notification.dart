// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notificationa {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> InitNotification() async {
//     AndroidInitializationSettings AndroidInitializasions =
//         const AndroidInitializationSettings("logo.png");

//     var InitializasionsSettings =
//         InitializationSettings(android: AndroidInitializasions);
//     await notificationsPlugin.initialize(InitializasionsSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }

//   NotificationDetails() {
//     return AndroidNotificationDetails('channelId', "channelName");
//   }

//   Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(
//         id, title, body, await NotificationDetails());
//   }
// }
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class notificationWidget {
  static final _notification = FlutterLocalNotificationsPlugin();

  static Future init({bool sheduled = false}) async {
    var initAndroidSettings = AndroidInitializationSettings('logo');

    final settings = InitializationSettings(android: initAndroidSettings);
    await _notification.initialize(settings);
  }

  static Future showNotification({
    var id = 0,
    var title,
    var body,
    var payload,
  }) async =>
      _notification.show(id, title, body, await notificationDetails());

  static Future showscheduledNotification(
          {var id = 1,
          var title,
          var body,
          var payload,
          required DateTime ScheduleTime}) async =>
      _notification.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(ScheduleTime, tz.local),
        await notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );

  static notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
      icon: 'logo',
      playSound: true,
    ));
  }
}
