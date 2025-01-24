import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

part 'units/tracking-info.dart';
part 'units/tracking_circle.dart';

class OrderTrackingView extends StatelessWidget {
  const OrderTrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       title: 'order tracking'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        children: [
          AppTextField(
            label: 'Enter the fulfillment code to track the current status of your order'.tr(),
          ),
          AppButton(
            title: 'order tracking'.tr(),
            constrainedAxis: Axis.horizontal,
            color: AppColors.primary,
            onTap: () {},
            height: 50,
            titleFontSize: 16,
            margin: EdgeInsets.symmetric(vertical: 12),
          ),
          Divider(
            height: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.tGray
                )
            ),
            child: Column(
              children: [
                AppText(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                  title: 'Tracking details'.tr(),
                  textAlign: TextAlign.center,
                ),
                AppText(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  color: AppColors.txtGray,
                  title: 'View and update your shipment delivery information'.tr(),
                  textAlign: TextAlign.center,

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      TrackingCircle(
                        image: 'assets/images/tr-1.png',
                        color: AppColors.green,
                      ),
                      Expanded(
                        child: Icon(FontAwesomeIcons.solidCircle,size: 8,color: AppColors.tGray,),
                      ),
                      TrackingCircle(
                        image: 'assets/images/tr-2.png',
                        color: AppColors.green,
                      ),
                      Expanded(
                        child: Icon(FontAwesomeIcons.solidCircle,size: 8,color: AppColors.tGray,),
                      ),
                      TrackingCircle(
                        image: 'assets/images/tr-3.png',
                        color: AppColors.primary,
                      ),
                      Expanded(
                        child: Icon(FontAwesomeIcons.solidCircle,size: 8,color: AppColors.tGray,),
                      ),
                      TrackingCircle(
                        image: 'assets/images/tr-4.png',
                        color: AppColors.txtGray,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                    padding: EdgeInsets.symmetric(horizontal: 14,vertical: 10),
                    title: 'Your shipments journey'.tr(),
                  ),
                ),
                SizedBox(height: 8,),
                TrackingInfo(
                  time: '4/5/2024 - 12:12 PM',
                  title: 'تم أستلام الشحنة - المملكة العربية السعودية',
                  circleColor: AppColors.green,
                  colorBk: AppColors.tGray,
                ),
                TrackingInfo(
                  time: '4/5/2024 - 12:12 PM',
                  title: 'تم أستلام معومات الشحنه بنجاح',
                  circleColor: AppColors.green,
                  colorBk: AppColors.white,
                ),
                TrackingInfo(
                  time: '4/5/2024 - 12:12 PM',
                  title: 'تم نقل الشحنة إلى الاردن',
                  circleColor: AppColors.primary,
                  colorBk: AppColors.tGray,
                ),
                TrackingInfo(
                  time: '4/5/2024 - 12:12 PM',
                  title: ' تم شحن الشحنة بنجاح إلى الأمارات',
                  circleColor: AppColors.darkGrayBlue,
                  colorBk: AppColors.white,
                ),
                TrackingInfo(
                  time: '4/5/2024 - 12:12 PM',
                  title: 'تم توصيل الشحنة بنجاح',
                  circleColor: AppColors.darkGrayBlue,
                  colorBk: AppColors.white,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
