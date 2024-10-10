import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/otp/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
class ViaMobileForm extends StatelessWidget {
  const ViaMobileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppText(
          title: 'Hey, you !'.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w700,
          padding: EdgeInsets.symmetric(vertical: 8),
        ),
        AppText(
          title: 'Enter your mobile number to create an account or log in.'.tr(),
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.center,
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          color: AppColors.txtGray,
          fontSize: 14,
        ),
        Stack(
          children: [
            Container(
              child: AppTextField(
                fillColor: AppColors.tGray,
                vMargin: 20,
                inputType: TextInputType.number,
              ),
            ),
            Positioned(
                left: 10,
                top: 16,
                child: Container(
                  height: 70,
                  width: 90,
                  child: AppDropDownMenu(
                    fillColor: Colors.transparent,
                    items: [
                      '966',
                      '050',
                      '002'
                    ],
                    hint: '966+',
                    onChange: (p0) {},
                  ),
                ))
          ],
        ),
        AppButton(
          title: 'Continue'.tr(),
          color: AppColors.primary,
          constrainedAxis: Axis.horizontal,
          margin: EdgeInsets.symmetric(vertical: 12),
          onTap: () {
            RouteUtils.navigateAndPopAll(OtpView());
          },
        ),
        AppText(
          title: 'It will provide a message to the input number on the code to continue... Make sure your number is correct.'.tr(),
          textAlign: TextAlign.center,
          fontSize: 14,
          height: 25,
          color: AppColors.txtGray,
          padding: EdgeInsets.symmetric(vertical: 18,horizontal: 12),
        ),
      ],
    );
  }
}
