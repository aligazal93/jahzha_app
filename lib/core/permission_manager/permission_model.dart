import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionModel {
  late Permission permission;
  late bool isGranted;
  late String title;
  late IconData icon;
  late bool seen;

  PermissionModel({
    required this.permission,
    this.isGranted = true,
    required this.title,
    required this.icon,
    this.seen = false,
  });
}

List<PermissionModel> _permissions = [
  // PermissionModel(
  //   permission: Permission.location,
  //   title: Utils.isAR ? 'يجب تفعيل بيانات الموقع' : 'Location permission is required',
  //   icon: FontAwesomeIcons.camera,
  // ),
  PermissionModel(
    permission: Permission.camera,
    title: Utils.isAR ? 'فعل الكاميرا لتتمكن من تحديث صورة الحساب' : 'Enable camera to update profile picture',
    icon: FontAwesomeIcons.camera,
  ),
  if (Platform.isIOS)
    PermissionModel(
      permission: Permission.photos,
      title: Utils.isAR ? 'فعل الوصول الي الجاليري لتتمكن من تحديث صورة الحساب' : 'Enable photos to update profile picture',
      icon: FontAwesomeIcons.solidImage,
    ),
  PermissionModel(
    permission: Permission.notification,
    title: Utils.isAR ? 'فعل الاشعارات لتتمكن من تلقي جميع تحديثاتنا' : 'Enable notifications to receive all updates',
    icon: FontAwesomeIcons.solidBell,
  ),
];

Future<List<PermissionModel>> getPermissionsStatus() async {
  List<PermissionModel> permissions = [];
  for (int i = 0; i < _permissions.length; i++) {
    final status = await _permissions[i].permission.status;
    if (!(status == PermissionStatus.granted || status == PermissionStatus.restricted)) {
      permissions.add(_permissions[i]);
    }
  }
  return permissions;
}

Future<void> requestPermission(PermissionModel permissionModel) async {
  final status = await permissionModel.permission.request();
  if (status != PermissionStatus.granted) {
    openAppSettings();
  }
}
