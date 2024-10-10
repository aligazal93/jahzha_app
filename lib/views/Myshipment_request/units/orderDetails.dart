import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/Myshipment_request/units/card_circle.dart';
import 'package:jahzha_app/views/Myshipment_request/units/qr_code.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: AppText(
                    fontSize: 16,
                    title: 'Order details'.tr(),
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                ),
                SizedBox(height: 12,),
                AppText(
                  fontSize: 12,
                  title: 'Receiving address'.tr(),
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(title: 'السعودية , الرياض ',fontSize: 14,color: AppColors.secondary,),
                ),
                AppText(
                  fontSize: 12,
                  title: 'Delivery Address'.tr(),
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(title: 'الامارات , دبي',fontSize: 14,color: AppColors.secondary,),
                ),
                AppText(
                  fontSize: 12,
                  title: 'The senders mobile number'.tr(),
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(
                    title: '+966 546 546 456',
                    padding: EdgeInsets.symmetric(vertical: 4),
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                AppText(
                  fontSize: 12,
                  title: 'Approximate weight'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: '12',
                        color: AppColors.secondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        title: 'kg'.tr(),
                        color: AppColors.txtGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),

                    ],
                  ),
                ),
                AppText(
                  fontSize: 12,
                  title: 'Expected arrival time'.tr(),
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(title: '12/3/2024',fontSize: 14,color: AppColors.secondary,),
                ),
                SizedBox(height: 6,),
                AppText(
                  fontSize: 12,
                  title: 'Shipment cost'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: '300',
                        color: AppColors.secondary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      AppText(
                        title: 'SAR'.tr(),
                        color: AppColors.txtGray,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                AppText(
                  fontSize: 12,
                  title: 'Shipment description'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w500,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(title: 'An example of text could be in this space'.tr(),fontSize: 12,color: AppColors.secondary,),
                ),

                AppButton(
                  title: 'Retrieve the request'.tr(),
                  color: AppColors.primary,
                  margin: EdgeInsets.symmetric(vertical: 16),
                  constrainedAxis: Axis.horizontal,
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
