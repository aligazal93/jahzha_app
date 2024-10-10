// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:hasalt_app/core/notifications/notification_dialog.dart';
// import 'package:hasalt_app/core/route_utils/route_utils.dart';
// import 'package:hasalt_app/views/shared/notifications/view.dart';
//
// class FirebaseMessagingUtils {
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//
//   static FirebaseMessagingUtils instance = FirebaseMessagingUtils();
//
//   Future<void> init() async {
//     onMessage();
//     onMessageOpenedApp();
//     checkIfUserClickedNotificationFromBackground();
//     getFCM().then((value) => print(value));
//   }
//
//   void onMessage() {
//     FirebaseMessaging.onMessage.listen((notification) {
//       FlutterRingtonePlayer.play(
//         android: AndroidSounds.notification,
//         ios: IosSounds.glass,
//         looping: false,
//       );
//       _handleNotificationReceiver(notification);
//     });
//   }
//
//   void onMessageOpenedApp() {
//     FirebaseMessaging.onMessageOpenedApp.listen((notification) {
//       RouteUtils.navigateTo(NotificationsView());
//       // RouteUtils.navigateAndPopAll(NavBarView(initialIndex: 2));
//     });
//   }
//
//   void checkIfUserClickedNotificationFromBackground() async {
//     final notification = await _firebaseMessaging.getInitialMessage();
//     if (notification == null) {
//       return;
//     }
//     _handleNotificationReceiver(notification);
//     // RouteUtils.navigateAndPopAll(NavBarView(initialIndex: 2));
//   }
//
//   Future<String?> getFCM() async {
//     try {
//       requestPermission();
//       final fcm = await _firebaseMessaging.getToken();
//       return fcm;
//     } catch (_) {
//       return '';
//     }
//   }
//
//   Future<void> requestPermission() async {
//     _firebaseMessaging.requestPermission();
//   }
//
//   Future<void> _handleNotificationReceiver(RemoteMessage notification) async {
//     showNotificationDialog(
//       title: notification.notification?.title ?? '',
//       body: notification.notification?.body ?? '',
//     );
//     // if (notification.data['type'] == 'finished trip') {
//     //   showFinishedTripDialog(
//     //     title: notification.notification?.title ?? '',
//     //     tripID: notification.data['trip_id'] ?? '',
//     //     body: notification.notification?.body ?? '',
//     //     cost: notification.data['trip_cost'] ?? '',
//     //     distance: notification.data['trip_distance'] ?? '',
//     //   );
//     // } else {
//     //   showNotificationDialog(
//     //     title: notification.notification?.title ?? '',
//     //     body: notification.notification?.body ?? '',
//     //     tripID: notification.data['trip_id'] ?? '',
//     //     type: notification.data['type'] ?? '',
//     //   );
//     // }
//   }
//
// }