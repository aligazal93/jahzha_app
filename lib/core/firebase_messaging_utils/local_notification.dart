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

  Future<void> show() async {
    final context = RouteUtils.context;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: this,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.down,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.fromLTRB(
          8,
          0,
          8,
          0,
        ),
      ),
    );
  }

  @override
  State<_Notification> createState() => _NotificationState();
}

class _NotificationState extends State<_Notification> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeInUp(
          duration: Duration(milliseconds: 650),
          child: InkWell(
            onTap: () {
              // dismiss();
              ScaffoldMessenger.of(RouteUtils.context).clearSnackBars();
              widget.onTap();
            },
            child: BasicCard(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      Utils.getAssetPNGPath('logo-w'),
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
                          color: AppColors.white,
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
              color: AppColors.secondary,
            ),
          ),
        ),
      ],
    );
  }
}
