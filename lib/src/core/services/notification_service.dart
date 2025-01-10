import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
InitializationSettings initializationSettings = const InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(),
);

sealed class NotificationService {
  const NotificationService._();

  static Future<void> initialize() async {
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    // unawaited(
    //   FirebaseMessaging.instance.getToken().then(
    //         (token) => log('FCM TOKEN: $token'),
    //       ),
    // );
    await setupFlutterNotifications();
    // await foregroundNotification();
    // backgroundNotification();
    // await terminateNotification();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> setupFlutterNotifications() async {
    // if (Platform.isIOS) {
    //   await FirebaseMessaging.instance.requestPermission(
    //     criticalAlert: true,
    //     announcement: true,
    //     provisional: true,
    //   );
    // }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // await FirebaseMessaging.instance
    //     .setForegroundNotificationPresentationOptions(
    //   alert: true,
    //   badge: true,
    //   sound: true,
    // );
  }

  static void showFlutterNotification(String message) {
    flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message,
      message,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          styleInformation: BigTextStyleInformation(
            message,
            contentTitle: message,
          ),
          icon: '@mipmap/ic_launcher',
          priority: Priority.high,
          importance: Importance.high,
          visibility: NotificationVisibility.public,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          sound: 'default',
        ),
      ),
      payload: message,
    );
  }
}

// static Future<void> foregroundNotification() async {
//   FirebaseMessaging.onMessage.listen(showFlutterNotification);
//
//   ///When tapped
//   await flutterLocalNotificationsPlugin.initialize(
//     initializationSettings,
//     onDidReceiveNotificationResponse: (response) async {
//       debugPrint('foreground notification tapped');
//       debugPrint('$response');
//     },
//   );
// }

// static void backgroundNotification() {
//   FirebaseMessaging.onMessageOpenedApp.listen(
//     (message) {
//       debugPrint('A new onMessageOpenedApp event was published!');
//       showFlutterNotification(message);
//     },
//   );
// }
//
// static Future<void> terminateNotification() async {
//   final remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
//   if (remoteMessage == null) {
//     FirebaseMessaging.onBackgroundMessage(
//       _firebaseMessagingBackgroundHandler,
//     );
//   } else {
//     showFlutterNotification(remoteMessage);
//   }
// }
// }

// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await NotificationService.setupFlutterNotifications();
//   NotificationService.showFlutterNotification(message);
// }
