import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:realm/realm.dart';
import 'package:rhymer/repositories/favourite_rhymes/favourite_rhymes.dart';
import 'package:rhymer/repositories/history_rhymes/history_rhymes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/app.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging messaging = FirebaseMessaging.instance;
  // String? token = await messaging.getToken();
  // log(token ?? 'No token');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    final notification = message.notification;
    final android = message.notification?.android;

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
              icon: 'ic_launcher',
            ),
          ));
    }
  });

  await dotenv.load(fileName: ".env");
  final realm = _initRealm();
  final prefs = await _initPrefs();
  final appConfig = AppConfig(
    realm: realm,
    preferences: prefs,
  );
  runApp(
    RhymerApp(
      appConfig: appConfig,
    ),
  );
}

Future<SharedPreferences> _initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}

Realm _initRealm() {
  final config = Configuration.local([
    HistoryRhymes.schema,
    FavouriteRhymes.schema,
  ]);
  final realm = Realm(config);
  return realm;
}
