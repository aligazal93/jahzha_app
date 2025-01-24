import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class ChangeMobileNumber extends StatelessWidget {
  const ChangeMobileNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.sizeFromHeight(2),
      padding: EdgeInsets.only(
          bottom:  MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                SizedBox(height: 22,),
                AppText(
                  textAlign: TextAlign.center,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  title: 'Enter the new mobile number'.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  textAlign: TextAlign.center,
                  title: 'An activation code will be sent to the new mobile number'.tr(),
                  fontSize: 14,
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  fontWeight: FontWeight.w500,
                ),
                Stack(
                  children: [
                    Container(
                      child: AppTextField(
                        fillColor: AppColors.tGray,
                        label: 'New mobile number'.tr(),
                        vMargin: 20,
                        inputType: TextInputType.number,
                      ),
                    ),
                    Positioned(
                        left: 10,
                        top: 44,
                        child: Container(
                          height: 70,
                          width: 90,
                          child: AppDropDownMenu(
                            fillColor: Colors.transparent,
                            items: ['966', '050', '002'],
                            hint: '966+',
                            onChange: (p0) {},
                          ),
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: AppButton(
                          title: 'Change mobile number'.tr(),
                          color: AppColors.primary,
                          constrainedAxis: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          titleFontSize: 16,
                          onTap: () {
                            // RouteUtils.navigateAndPopAll(OtpView());
                          },
                        ),
                        flex: 2,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: AppButton(
                          title: 'cancel'.tr(),
                          color: AppColors.txtGray,
                          constrainedAxis: Axis.horizontal,
                          titleFontSize: 16,
                          padding: EdgeInsets.zero,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
