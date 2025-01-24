import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:upgrader/upgrader.dart';

import '../../widgets/app_button.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/app_text.dart';
import 'app_colors.dart';
import 'utils.dart';

class AppStatusUtils {

  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://quickclean-27487-default-rtdb.firebaseio.com/',
    ),
  );

  static bool _isAppProduction = true;
  static bool _isUpdateAvailable = false;

  static bool get isAppProduction => _isAppProduction;
  static bool get isUpdateAvailable => _isUpdateAvailable;

  static final _upgrader = Upgrader();

  static Future<void> getAppStatus() async {
    try {
      await _isVersionProduction();
      Future.delayed(Duration(seconds: 3), showUpdateVersionDialog);
    } catch (e) {
      _isAppProduction = true;
    }
    print(_isAppProduction);
  }

  static Future<bool> _isVersionProduction() async {
    final path = 'app_version_${Platform.isIOS ? 'ios' : 'android'}';
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final installedVersion = packageInfo.version;
    final appVersion = (await _dio.get(path + '.json')).data ?? '';
    final comparedVersions = installedVersion.compareTo(appVersion);
    if (comparedVersions != -1) {
      if (comparedVersions == 1) {
        /// if installed version higher than app version on database
        await _dio.patch('.json', data: {path: installedVersion});
      }
      _isAppProduction = (await _dio.get('is_${Platform.isIOS ? 'ios' : 'android'}_production.json')).data;
    } else {
      /// if installed version lower than app version on database
      _isAppProduction = true;
    }
    return _isAppProduction;
  }

  static Future<bool> showUpdateVersionDialog() async {
    await _upgrader.initialize();
    final isUpdateAvailable = await _upgrader.isUpdateAvailable();
    if (isUpdateAvailable) {
      AppDialog.show(
        dismissible: false,
        child: Column(
          children: [
            Icon(
              FontAwesomeIcons.wrench,
              color: AppColors.primary,
              size: 64.height,
            ),
            SizedBox(height: 40.height),
            AppText(
              title: Utils.isAR ? 'يتوفر تحديث جديد' : 'New update available',
              fontSize: 18.font,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 12.height),
            AppText(
              title: 'V(${_upgrader.currentAppStoreVersion})',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 12.height),
            AppText(
              title: Utils.isAR ? 'من فضلك قم بتحديث التطبيق للمتابعة' : 'Please update the app to continue',
              padding: EdgeInsets.symmetric(horizontal: 32.width),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.height),
            AppButton(
              title: Utils.isAR ? 'تحديث' : 'Update',
              height: 48,
              onTap: _upgrader.sendUserToAppStore,
            ),
          ],
        ),
      );
    }
    return isUpdateAvailable;
  }
}