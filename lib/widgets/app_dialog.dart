import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import '../core/route_utils/route_utils.dart';

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
    bool dismissible = true,
  }) {
    return showDialog(
      context: RouteUtils.context,
      barrierDismissible: false,
      // barrierColor: AppColors.secondary.withOpacity(0.7),
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
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return Material(
      color: Colors.transparent,
      child: UnconstrainedBox(
        constrainedAxis: Axis.horizontal,
        child: Container(
          margin: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: keyboardHeight,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  if (dismissible)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: UnconstrainedBox(
                        child: InkWell(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            height: 32.height,
                            width: 32.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: AppColors.darkGrayBlue,
                            ),
                            child: Icon(
                              FontAwesomeIcons.xmark,
                              color: AppColors.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: dismissible ? 16 : 0),
                    child: child,
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
