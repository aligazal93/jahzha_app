import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import '../../widgets/app_text.dart';
import '../../widgets/basic_card_decoration.dart';
import '../caching_utils/caching_utils.dart';
import '../helpers/app_colors.dart';
import '../helpers/utils.dart';
import '../route_utils/route_utils.dart';

class LocalNotification {
  static final instance = LocalNotification();
  //
  // final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  //
  // Future<void> init() async {
  //   const AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('notification_icon');
  //   final DarwinInitializationSettings initializationSettingsDarwin =
  //       DarwinInitializationSettings(
  //     requestAlertPermission: true,
  //     requestBadgePermission: true,
  //     requestSoundPermission: true,
  //   );
  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //     iOS: initializationSettingsDarwin,
  //   );
  //   await _flutterLocalNotificationsPlugin.initialize(
  //     initializationSettings,
  //     onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
  //   );
  //   if (Platform.isAndroid) {
  //     await _flutterLocalNotificationsPlugin
  //         .resolvePlatformSpecificImplementation<
  //             AndroidFlutterLocalNotificationsPlugin>()
  //         ?.requestNotificationsPermission();
  //   }
  // }
  //
  // void _onDidReceiveNotificationResponse(
  //     NotificationResponse notificationResponse) {
  //   RouteUtils.navigateTo(NotificationsView());
  // }

  void show({
    required String title,
    required String body,
  }) {
    _Notification(
      title: title,
      body: body,
      onTap: () {
        if (!CachingUtils.isLogged) {
          return;
        }
        // RouteUtils.navigateTo(NotificationsView());
      },
    ).show();
    // final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    // _flutterLocalNotificationsPlugin.show(
    //   id,
    //   title,
    //   body,
    //   NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'com.asparagus.user.app',
    //       'Main',
    //       // category: AndroidNotificationCategory.message,
    //       importance: Importance.max,
    //       playSound: true,
    //       priority: Priority.high,
    //     ),
    //     iOS: DarwinNotificationDetails(
    //       interruptionLevel: InterruptionLevel.timeSensitive,
    //       presentSound: true,
    //       presentList: true,
    //       presentAlert: true,
    //       presentBadge: true,
    //       presentBanner: true,
    //     ),
    //   ),
    // );
  }
}

class _Notification extends StatefulWidget {
  const _Notification({
    Key? key,
    required this.title,
    required this.body,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String body;
  final VoidCallback onTap;

  Future<void> show() {
    return showDialog(
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      context: RouteUtils.context,
      builder: (context) => this,
    );
  }

  @override
  State<_Notification> createState() => _NotificationState();
}

class _NotificationState extends State<_Notification> {
  Timer? timer;

  @override
  void initState() {
    timer = Timer(
      Duration(milliseconds: 4000),
      dismiss,
    );
    super.initState();
  }

  void dismiss() {
    if (mounted) {
      RouteUtils.pop();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: RouteUtils.pop,
      child: Material(
        color: Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.width,
              vertical: 16.height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FadeInDown(
                  duration: Duration(milliseconds: 650),
                  child: InkWell(
                    onTap: () {
                      dismiss();
                      widget.onTap();
                    },
                    child: BasicCard(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.height,
                        horizontal: 16.width
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              Utils.getAssetPNGPath('logo'),
                              width: 40.width,
                              height: 40.width,
                            ),
                          ),
                          SizedBox(width: 16.width),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: widget.title,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(height: 4.height),
                                AppText(
                                  title: widget.body,
                                  fontSize: 12.font,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkGrayBlue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      enableShadow: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
