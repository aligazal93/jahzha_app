import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/coupon_card.dart';

class CouponsDetailsView extends StatelessWidget {
  const CouponsDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'كوبونات',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: AppColors.tGray
                            )
                        ),
                        child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,)
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                           title: 'متجر نمشي',
                           color: AppColors.primary,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBox(height: 12,),
                          AppText(
                           title: 'تخفيض يتراوح ما بين 5% - 10%',
                           fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.txtGray,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            AppButton(
              title: 'Shop now'.tr(),
              constrainedAxis: Axis.horizontal,
              color: AppColors.primary,
              onTap: () {},
              height: 50,
              titleFontSize: 16,
              margin: EdgeInsets.symmetric(vertical: 12),
            ),
            AppText(
             title: 'Coupons'.tr(),
             fontWeight: FontWeight.w500,
             padding: EdgeInsets.symmetric(vertical: 14,horizontal: 8),
              color: AppColors.secondary,
              fontSize: 18,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                return CouponCard();
              },),
            )
          ],
        ),
      ),
    );
  }
}
