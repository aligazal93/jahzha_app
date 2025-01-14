import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import 'app_button.dart';
import 'app_dialog.dart';
import 'app_text.dart';

class AlertingDialog extends StatelessWidget {
  const AlertingDialog({
    Key? key,
    required this.alertTitle,
    required this.confirmTitle,
    this.cancelTitle,
  }) : super(key: key);

  final String alertTitle;
  final String confirmTitle;
  final String? cancelTitle;

  static Future<bool> show({
    required String alertTitle,
    required String confirmTitle,
    String? cancelTitle,
  }) async {
    final result = await AppDialog.show(
      child: AlertingDialog(
        alertTitle: alertTitle,
        confirmTitle: confirmTitle,
        cancelTitle: cancelTitle,
      ),
      dismissible: false,
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.width,
        vertical: 24.height,
      ),
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.exclamation,
            color: AppColors.red,
            size: 90.width,
          ),
          SizedBox(height: 24.height),
          AppText(
            title: alertTitle,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            fontSize: 16.font,
            height: 28.height,
            padding: EdgeInsets.symmetric(horizontal: 20.width),
          ),
          SizedBox(height: 32.height),
          AppButton(
            constrainedAxis: Axis.horizontal,
            title: confirmTitle,
            color: AppColors.red,
            onTap: () => Navigator.pop(context, true),
          ),
          SizedBox(height: 12.height),
          AppButton.outline(
            constrainedAxis: Axis.horizontal,
            title: cancelTitle ?? 'close'.tr(),
            borderColor: AppColors.black,
            titleColor: AppColors.black,
            onTap: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
  }
}
