import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import '../core/helpers/app_colors.dart';
import '../core/helpers/utils.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.child,
    required this.dismissible,
  });

  final Widget child;
  final bool dismissible;

  static Future<dynamic> show({
    required Widget child,
    bool dismissible = true, required String title,
  }) {
    return showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      barrierColor: AppColors.secondary.withOpacity(0.7),
      builder: (context) {
        return AppDialog(
          child: child,
          dismissible: dismissible,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: Utils.keyboardHeight(context),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              if (dismissible)
                Align(
                  alignment: Utils.isAR ? Alignment.centerLeft : Alignment.centerRight,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      color: AppColors.secondary,
                      size: 20,
                    ),
                  ),
                ),
              SizedBox(height: 12.height),
              child,
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
