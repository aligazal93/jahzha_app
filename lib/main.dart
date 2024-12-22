import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jahzha_app/core/theme_utils/theme_utils.dart';
import 'core/caching_utils/caching_utils.dart';
import 'core/network_utils/network_utils.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.value([
    await NetworkUtils.init(),
    await EasyLocalization.ensureInitialized(),
    await CachingUtils.init(),
    await ThemeUtils.init(),
    // await Firebase.initializeApp(
    //   options: Platform.isIOS ? null : FirebaseOptions(
    //     apiKey: 'AIzaSyCRPMCUu_9ysjp93S9F87Dqb11okIWNPX4',
    //     appId: '1:133008109662:android:2ab51bb7bcd3f53c4d44cf',
    //     messagingSenderId: '133008109662',
    //     projectId: 'hasalt-7f93e',
    //   ),
    // ),
    // await FirebaseMessagingUtils.instance.init(),
    // await CachingUtils.clearCache(),
  ]);
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
