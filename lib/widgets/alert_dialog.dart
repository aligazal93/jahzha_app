import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      title: 'تحذير',
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
      padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 24
      ),
      child: Column(
        children: [
          Icon(
            FontAwesomeIcons.trashCan,
            color: AppColors.red,
            size: 80,
          ),
          SizedBox(height: 16),
          AppText(
            title: alertTitle,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          AppButton(
            constrainedAxis: Axis.horizontal,
            title: confirmTitle,
            color: AppColors.red,
            onTap: () => Navigator.pop(context, true),
          ),
          SizedBox(height: 12),
          AppButton.outline(
            constrainedAxis: Axis.horizontal,
            title: cancelTitle ?? 'إلغاء',
            borderColor: AppColors.black,
            onTap: () => Navigator.pop(context, false),
          ),
        ],
      ),
    );
  }
}