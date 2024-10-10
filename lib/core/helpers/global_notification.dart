// import 'dart:async';
// import 'dart:convert';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class GlobalNotification {
//   static final StreamController<Map<String, dynamic>> _onMessageStreamController = StreamController.broadcast();
//
//   late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//   static late BuildContext context;
//
//   // static GlobalNotification instance =GlobalNotification._();
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;
//
//   // GlobalNotification._();
//
//   GlobalNotification();
//
//   setupNotification(BuildContext cxt) async {
//     context = cxt;
//     _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     const android = AndroidInitializationSettings("@mipmap/launcher_icon");
//     const ios = IOSInitializationSettings();
//     const initSettings = InitializationSettings(android: android, iOS: ios);
//     _flutterLocalNotificationsPlugin.initialize(
//       initSettings,
//       onSelectNotification: flutterNotificationClick,
//     );
//     // await Firebase.initializeApp();
//     final settings = await messaging.requestPermission(provisional: true);
//     print('User granted permission: ${settings.authorizationStatus}');
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       messaging.getToken().then((token) {
//         print(token);
//       });
//       messaging.setForegroundNotificationPresentationOptions();
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         print("_____________________Message data:${message.data}");
//         print("____________notification:${message.notification?.toMap()}");
//         _showLocalNotification(message);
//         _onMessageStreamController.add(message.data);
//         if (int.parse(message.data["type"] ?? "0") == -1) {
//           // AutoRouter.of(context).push(const LoginRoute());
//         }
//       });
//       FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//         print('AonMessageOpenedApp event was published!');
//         // _showLocalNotification(message);
//         flutterNotificationClick(json.encode(message.data));
//       });
//     }
//     FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   }
//
//   static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//     await Firebase.initializeApp();
//
//     print("local notification");
//     // SharedPreferenceManager().writeData(CachingKey.FCM_DATA, json.encode(message.data));
//   }
//
//   StreamController<Map<String, dynamic>> get notificationSubject {
//     return _onMessageStreamController;
//   }
//
//   _showLocalNotification(RemoteMessage? message) async {
//     if (message == null) return;
//
//     final android = AndroidNotificationDetails(
//       "${DateTime.now()}",
//       "Default",
//       priority: Priority.high,
//       importance: Importance.max,
//       shortcutId: DateTime.now().toIso8601String(),
//     );
//     const ios = IOSNotificationDetails();
//     final _platform = NotificationDetails(android: android, iOS: ios);
//
//     _flutterLocalNotificationsPlugin.show(
//         DateTime.now().microsecond,
//         message.notification?.toMap()["title"],
//         message.notification?.toMap()["body"],
//         // "${Platform.isAndroid ? message.notification?.toMap()["title"] : message.notification?.title}",
//         // "${Platform.isAndroid ? message.notification?.toMap()["body"] : message.notification?.body}",
//         _platform,
//         payload: json.encode(message.notification?.toMap()));
//     // if (int.parse(message.data["NotifyType"] ?? "0").isBlockAccount) {
//     //   // await SharedHelper().logout();
//     //   await SharedHelper().removeData(CachingKey.TOKEN);
//     //   await SharedHelper().removeData(CachingKey.USER);
//     //   await SharedHelper().writeData(CachingKey.BLOCKED, true);
//     //   await SharedHelper().removeData(CachingKey.IS_LOGGED);
//     //   // NamedNavigatorImpl.navigatorState.currentContext!.read<UserCubit>().removeUser();
//     //
//     //   Navigator.pushAndRemoveUntil(
//     //       NamedNavigatorImpl.navigatorState.currentContext!, MaterialPageRoute(builder: (_) => Login()), (route) => false);
//     // }
//   }
//
//   static Future flutterNotificationClick(String? payload) async {
//     print("payload $payload");
//     // if (int.parse(json.decode(payload ?? "")["NotifyType"]).isBlockAccount) {
//     //   // await SharedHelper().logout();
//     //   SharedHelper().removeData(CachingKey.TOKEN);
//     //   SharedHelper().removeData(CachingKey.USER);
//     //   await SharedHelper().writeData(CachingKey.BLOCKED, true);
//     //   print("asdasd ${await SharedHelper().readBoolean(CachingKey.BLOCKED)}");
//     //
//     //   SharedHelper().removeData(CachingKey.IS_LOGGED);
//     //   // NamedNavigatorImpl.navigatorState.currentContext!.read<UserCubit>().removeUser();
//     //
//     //   Navigator.pushAndRemoveUntil(
//     //       NamedNavigatorImpl.navigatorState.currentContext!, MaterialPageRoute(builder: (_) => Login()), (route) => false);
//   }
//   // else if (NamedNavigatorImpl.navigatorState.currentContext!
//   //     .read<UserCubit>()
//   //     .state
//   //     .userModel
//   //     .userData
//   //     ?.isAdmin ==
//   //     true) {
//   //   Navigator.push(NamedNavigatorImpl.navigatorState.currentContext!,
//   //       MaterialPageRoute(builder: (_) => TrainerHome()));
//   // } else {
//   //   Navigator.push(NamedNavigatorImpl.navigatorState.currentContext!,
//   //       MaterialPageRoute(builder: (_) => Chat()));
//   // }
//   // final _data = json.decode("$payload");
//   // }
// }
