import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:jahzha_app/core/models/logged_user.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/splash.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firebase_messaging_utils/firebase_messaging_utils.dart';

class CachingUtils {
  static const String _cachingUserKey = 'logged_user';
  static const String _cachingTokenKey = 'access_token';

  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static LoggedUser? get user {
    if (_sharedPreferences.containsKey(_cachingUserKey)) {
      return LoggedUser.fromJson(jsonDecode(_sharedPreferences.getString(_cachingUserKey)!));
    }
    return null;
  }

  static Future<void> cacheUser(Map<String, dynamic> value) async {
    await _sharedPreferences.setString(_cachingUserKey, jsonEncode(value));
  }

  static Future<void> cacheToken(String value) async {
    await _sharedPreferences.setString(_cachingTokenKey, value);
  }

  static Future<void> clearCache() async {
    await _sharedPreferences.remove(_cachingUserKey);
    await _sharedPreferences.remove(_cachingTokenKey);
  }

  static Future<void> signOut() async {
    try {
      final response = await NetworkUtils.post(
        'logout',
        data: {
          'device_token': await FirebaseMessagingUtils.instance.getFCM(),
        },
      );
      if (response.statusCode == 200) {
        showSnackBar(response.data['message']);
        await CachingUtils.clearCache();
        RouteUtils.navigateAndPopAll(SplashView());
      } else {
        showSnackBar('something_went_wrong'.tr(), errorMessage: true);
      }
    } catch (e) {
      handleGenericException(e);
    }
  }

  static bool get isLogged {
    return user != null;
  }

  static String? get token {
    if (_sharedPreferences.containsKey(_cachingTokenKey)) {
      return _sharedPreferences.getString(_cachingTokenKey)!;
    }
    return null;
  }
}


Future<bool> getUserAndCache(String token) async {
  try {
    final response = await NetworkUtils.get(
      'user-profile',
      headers: {
        'API-TOKEN':  '$token',
      },
    );
    final data = response.data as Map<String, dynamic>;
    await CachingUtils.cacheToken(token);
    await CachingUtils.cacheUser(data);
    return true;
  } catch (e, s) {
    print(e);
    print(s);
    showSnackBar('Session Expired', errorMessage: true);
    //AppStorage.clearCache();
    //RouteUtils.navigateAndPopAll(SplashView());
  }
  return false;
}