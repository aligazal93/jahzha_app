import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jahzha_app/core/theme_utils/theme_utils.dart';
import 'core/caching_utils/caching_utils.dart';
import 'core/firebase_messaging_utils/firebase_messaging_utils.dart';
import 'core/network_utils/network_utils.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kDebugMode) {
    HttpOverrides.global = MyHttpOverrides();
  }
  await Future.wait([
    NetworkUtils.init(),
    EasyLocalization.ensureInitialized(),
    CachingUtils.init(),
    ThemeUtils.init(),
    Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Platform.isAndroid
            ? 'AIzaSyBK7vMdjO0BKLYPj2DblrK0Ik-uO5a8pqo'
            : 'AIzaSyCqz_QdGEb9Kn863_CrRAejB_POkm-NBX8',
        appId: Platform.isAndroid
            ? '1:1041199374111:android:101fcff755633ffd305a2a'
            : '1:1041199374111:ios:479fa32a351d4fdb305a2a',
        messagingSenderId: '1041199374111',
        projectId: 'jahzha-bbf0d',
      ),
    ),
    // await CachingUtils.clearCache(),
  ]);
  await FirebaseMessagingUtils.instance.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
