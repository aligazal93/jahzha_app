import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';
import '../core/route_utils/route_utils.dart';
import 'app_text.dart';

class AppSheet extends StatelessWidget {
  const AppSheet({
    Key? key,
    required this.child,
    required this.title,
    required this.subtitle,
    this.backgroundColor = AppColors.background,
  }) : super(key: key);

  final Widget child;
  final String? title;
  final String? subtitle;
  final Color backgroundColor;

  static Future<void> show({
    required Widget child,
    String? title,
    String? subtitle,
    Color backgroundColor = AppColors.background,
  }) async {
    return showModalBottomSheet(
      context: RouteUtils.context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return AppSheet(
          child: child,
          title: title,
          subtitle: subtitle,
          backgroundColor: backgroundColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      duration: Duration(milliseconds: 500),
      child: BottomSheet(
        enableDrag: false,
        backgroundColor: Colors.transparent,
        onClosing: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.radius)),
        ),
        builder: (context) {
          return Container(
            // margin: EdgeInsets.only(top: Utils.topDevicePadding + 64.height),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.radius)),
            ),
            padding: EdgeInsets.fromLTRB(
              16,
              24.height,
              16,
              Utils.keyboardHeight(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Container(
                //   height: 4,
                //   width: 48,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8),
                //     color: AppColors.neutral300,
                //   ),
                // ),
                if (title != null) ...[
                  AppText(
                    title: title!,
                    fontSize: 16.font,
                    fontWeight: FontWeight.w500,
                  ),
                ],
                if (subtitle != null) ...[
                  if (title != null)
                    SizedBox(height: 12),
                  AppText(
                    title: subtitle!,
                    fontSize: 12.font,
                    color: AppColors.secondary,
                  ),
                ],
                // SizedBox(height: 24.height),
                child,
              ],
            ),
          );
        },
      ),
    );
  }
}
