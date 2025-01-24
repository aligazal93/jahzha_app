import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import '../route_utils/route_utils.dart';
import 'local_notification.dart';

class FirebaseMessagingUtils {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static FirebaseMessagingUtils instance = FirebaseMessagingUtils();

  Future<void> init() async {
    // await LocalNotification.instance.init();
    onMessage();
    onMessageOpenedApp();
    checkIfUserClickedNotificationFromBackground();
  }

  void onMessage() {
    FirebaseMessaging.onMessage.listen((notification) {
      // NotificationButton.refreshCount();
      FlutterRingtonePlayer().play(
        android: AndroidSounds.notification,
        ios: IosSounds.glass,
        looping: false,
      );
      _handleNotificationReceiver(notification);
    });
  }

  void onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((notification) {
      // if (!CachingUtils.isLogged) {
      //   return;
      // }
      // RouteUtils.navigateTo(NotificationsView());
    });
  }

  void checkIfUserClickedNotificationFromBackground() async {
    final notification = await _firebaseMessaging.getInitialMessage();
    // if (notification == null || !CachingUtils.isLogged) {
    //   return;
    // }
    // RouteUtils.navigateTo(NotificationsView());
  }

  Future<String?> getFCM() async {
    try {
      requestPermission();
      final fcm = await _firebaseMessaging.getToken();
      return fcm;
    } catch (e) {
      return '';
    }
  }

  Future<void> requestPermission() async {
    _firebaseMessaging.requestPermission();
  }

  Future<void> _handleNotificationReceiver(RemoteMessage notification) async {
    LocalNotification.instance.show(
      title: notification.notification?.title ?? "جهزها",
      body: notification.notification?.body ?? 'New Notification'.tr(),
    );
  }
}
