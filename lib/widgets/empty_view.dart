import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:lottie/lottie.dart';

import '../core/helpers/app_colors.dart';
import 'app_button.dart';
import 'app_text.dart';

class EmptyView extends StatelessWidget {
  final String? title;
  final String? retryButtonTitle;
  final VoidCallback? onTap;
  final double? height;
  final double? fontSize;

  const EmptyView({
    Key? key,
    this.title,
    this.fontSize,
    this.height,
    this.retryButtonTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          'assets/images/lottie/empty_view.json',
          height: height,
        ),
        AppText(
          title: title ?? "no_content_available".tr(),
          color: AppColors.primary,
          fontSize: fontSize ?? 18.font,
          fontWeight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        if (retryButtonTitle != null)
          AppButton(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            title: retryButtonTitle!,
            onTap: onTap,
          ),
      ],
    );
  }
}
