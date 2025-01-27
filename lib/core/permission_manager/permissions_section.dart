import 'package:flutter/material.dart';
import '../permission_manager/permission_model.dart' as AppPermissions;
import 'notification_box.dart';

class AppPermissionsSections extends StatefulWidget {
  const AppPermissionsSections({Key? key}) : super(key: key);

  static final List<AppPermissions.PermissionModel> _skippedPermission = [];

  @override
  State<AppPermissionsSections> createState() => _AppPermissionsSectionsState();
}

class _AppPermissionsSectionsState extends State<AppPermissionsSections> {
  List<AppPermissions.PermissionModel> permissions = [];

  bool firstCheck = true;

  @override
  void initState() {
    getPermissions();
    super.initState();
  }

  void getPermissions() async {
    final permissions = await AppPermissions.getPermissionsStatus();
    permissions.removeWhere((e) =>
        AppPermissionsSections._skippedPermission.indexWhere(
          (i) => e.permission.value == i.permission.value,
        ) !=
        -1);
    this.permissions = permissions;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: sizeFromHeight(7),
      margin: EdgeInsets.only(top: 16),
      child: Builder(
        builder: (context) {
          if (permissions.isEmpty) {
            return Container();
          }
          final e = permissions.first;
          return NotificationBox(
            text: e.title,
            icon: e.icon,
            onAccept: () {
              AppPermissions.requestPermission(e);
              removePermission(e);
            },
            onDeny: () => removePermission(e),
          );
        },
      ),
    );
  }

  void removePermission(AppPermissions.PermissionModel permissionModel) {
    AppPermissionsSections._skippedPermission.add(permissionModel);
    permissions.remove(permissionModel);
    setState(() {});
  }
}
