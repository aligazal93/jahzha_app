import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/pin_code_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100,horizontal: 22),
        child: ListView(
          children: [
            AppText(
             title: 'Please enter the code to continue'.tr(),
             fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.secondary,
              textAlign: TextAlign.center,
            ),
            AppText(
              title: 'We have sent the code by message to the following number'.tr(),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.txtGray,
              textAlign: TextAlign.center,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  title: '(96664645400+)',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondary,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  child: AppText(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    title: 'Change'.tr(),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                )
              ],
            ),
            SizedBox(height: 22,),
            PinCodeField(onChanged: (p0) {},),
            AppButton(
              title: 'Verification'.tr(),
              color: AppColors.primary,
              constrainedAxis: Axis.horizontal,
              margin: EdgeInsets.symmetric(vertical: 12),
              onTap: () {
                RouteUtils.navigateTo(NavBarView());
              },
            ),
            AppText(
              title: 'Have Not received the message yet?'.tr(),
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.txtGray,
              textAlign: TextAlign.center,
              padding: EdgeInsets.symmetric(vertical: 16),
            ),
            InkWell(
              onTap: () {
              },
              child: AppText(
                title: 'Resend'.tr(),
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
                textAlign: TextAlign.center,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
