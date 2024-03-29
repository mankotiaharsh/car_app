import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

// https://firebase.flutter.dev/docs/messaging/overview
class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance =
      PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;
  late Timer timer;

  Future<void> init() async {
    print("In FCM");
    print(_initialized);
    if (!_initialized) {

      //Android Channels
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        '1687497218170948721x8', // id
        'App Channel', // title
        description: 'App Channel Description', // description,
        importance: Importance.high,
      );

    // iOS
      NotificationSettings settings =
          await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true, // Required to display a heads up notification
        badge: true,
        sound: true,
      );

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken() ?? "";
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("device_id", token);
      print("FCM Token $token");
      _initialized = true;

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        messageHandle(message);

        print('A new onMessageOpenedApp event was published!');
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  channelDescription: channel.description,
                  icon: 'launch_background',
                ),
              ));
        }
      });
    }
  }

  Future<dynamic> messageHandle(RemoteMessage message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        new FlutterLocalNotificationsPlugin();
    RemoteNotification? notification = message.notification;
    String title = notification?.title ?? "";
    String body = notification?.body ?? "";
    Map data = message.data;

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1687497218170948721x8', 'App Channel',
        channelDescription: 'App Description.',
        icon: 'logo',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        styleInformation: BigTextStyleInformation(body,
            htmlFormatBigText: false,
            contentTitle: title,
            htmlFormatContentTitle: false,
            summaryText: '',
            htmlFormatSummaryText: true));
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('logo');

    // flutterLocalNotificationsPlugin.initialize(
    //     InitializationSettings(android: initializationSettingsAndroid),
    //     onSelectNotification: handleLocalMessage);
    // flutterLocalNotificationsPlugin.show(
    //     1, title, body, platformChannelSpecifics,
    //     payload: orderId + "|" + pos);
    flutterLocalNotificationsPlugin.initialize(
        InitializationSettings(android: initializationSettingsAndroid));
    flutterLocalNotificationsPlugin.show(
        1, title, body, platformChannelSpecifics);
  }
}