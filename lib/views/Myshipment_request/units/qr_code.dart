import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class QrCode extends StatelessWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          fontSize: 14,
          title: 'Implementation code'.tr(),
          color: AppColors.secondary,
          fontWeight: FontWeight.w500,
        ),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              color: AppColors.tGray,
              borderRadius: BorderRadius.circular(8)
          ),
          child: Center(child: Image.asset('assets/images/qr.png'),),),
      ],
    );
  }
}
