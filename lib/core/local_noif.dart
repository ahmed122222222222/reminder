//-setuplocalnotifaction

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class localnotiftion {
  //1-inhialize
  static ontap(NotificationResponse notificationResponse) {}
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Future inti() async {
    InitializationSettings settings = const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: DarwinInitializationSettings());
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: ontap,
      onDidReceiveBackgroundNotificationResponse: ontap,
    );
  }

  //2-bais notifaction
  static void ShowNotifaction() async {
    flutterLocalNotificationsPlugin.show(
        0,
        "base notifaction",
        'welcome frist notifaction',
        const NotificationDetails(
            android: AndroidNotificationDetails("id 1", "baise",
                importance: Importance.max, priority: Priority.high)));
  }

  // repate notifaction

  static void repNotifaction() async {
    flutterLocalNotificationsPlugin.periodicallyShow(
        0,
        "rep notifaction",
        'welcome frist notifaction',
        RepeatInterval.everyMinute,
        const NotificationDetails(
            android: AndroidNotificationDetails("id 1", "repa")));
  }
//cancel notifaction
   void cancel(id)async {
    flutterLocalNotificationsPlugin.cancel(id);
   }
}
