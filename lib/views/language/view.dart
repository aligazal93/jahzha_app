import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/splash.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'select_language'.tr(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.setLocale(Locale('ar'));
                RouteUtils.navigateAndPopAll(SplashView());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.tGray
                  )
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                              color: AppColors.secondary
                          ),
                          borderRadius: BorderRadius.circular(150)
                      ),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            color:Utils.isAR ? AppColors.primary.theme : Colors.transparent,
                            borderRadius: BorderRadius.circular(150)
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    AppText(
                     title: 'Arabic'.tr(),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary.theme,
                    ),

                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.setLocale(Locale('en'));
                RouteUtils.navigateAndPopAll(SplashView());
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: AppColors.tGray
                    )
                ),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          border: Border.all(
                              color: AppColors.secondary
                          ),
                          borderRadius: BorderRadius.circular(150)
                      ),
                      child: Container(
                        margin: EdgeInsets.all(3),
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                            color:!Utils.isAR ? AppColors.primary.theme : Colors.transparent,
                            borderRadius: BorderRadius.circular(150)
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    AppText(
                      title: 'English'.tr(),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.secondary.theme,

                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
