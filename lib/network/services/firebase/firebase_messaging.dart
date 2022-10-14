import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCMService {
  // FCMService._();

  // static final FCMService _instance = FCMService._();

  // static Future<FCMService> get instance async {
  //   return _instance;
  // }

  static bool _isFlutterLocalNotificationsInitialized = false;
  static late AndroidNotificationChannel _channel;
  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  @pragma('vm:entry-point')
  static Future<void> fcmBackgroundHandler(RemoteMessage message) async {
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await setupFlutterNotifications();
    showFlutterNotification(message);
  }

  @pragma('vm:entry-point')
  static Future<void> fcmForgroundHandler(RemoteMessage message) async {
    // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    await setupFlutterNotifications();
    showFlutterNotification(message);
  }

  static Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) return;

    _channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(_channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _isFlutterLocalNotificationsInitialized = true;
  }

  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            icon: 'bell',
          ),
        ),
      );
    }
  }
}
