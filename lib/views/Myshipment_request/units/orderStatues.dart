import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/Myshipment_request/units/card_circle.dart';
import 'package:jahzha_app/views/Myshipment_request/units/qr_code.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class OrderStatuesView extends StatelessWidget {
  const OrderStatuesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12,horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleCard(
                image: 'assets/images/statue-1.png',
                title: 'Confirmation'.tr(),
                activeColor: AppColors.primary,
              ),
              CircleCard(
                image: 'assets/images/statue-2.png',
                title: 'Underway'.tr(),
                activeColor: AppColors.lightGray,
              ),
              CircleCard(
                image: 'assets/images/statue-3.png',
                title: 'Implemented'.tr(),
                activeColor: AppColors.lightGray,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                 fontSize: 14,
                 title: 'Order ID'.tr(),
                 color: AppColors.secondary,
                 fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 8,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 4),
                  padding: EdgeInsets.all(12),
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
                      AppText(title: '#53455345',fontSize: 14,color: AppColors.secondary,),
                       InkWell(
                          onTap: () {
                            Utils.copyToClipboard(context, '#53455345');
                          },
                          child: Image.asset('assets/images/copy.png'),)
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                AppText(
                  fontSize: 14,
                  title: 'request is done'.tr(),
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      ),
                      color: AppColors.whiteBk
                  ),
                  child: AppText(
                    title: 'يوم ٠٥ أبريل ٢٠٢٤',
                    color: AppColors.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10,),
                AppText(
                  fontSize: 14,
                  title: 'Implementation number'.tr(),
                  color: AppColors.secondary,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 14,),
                Container(
                  padding: EdgeInsets.all(12),
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
                      AppText(title: '#45656346346346436346346',fontSize: 14,color: AppColors.secondary,),
                      InkWell(
                        onTap: () {
                          Utils.copyToClipboard(context, '#53455345');
                        },
                        child: Image.asset('assets/images/copy.png'),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Image.asset('assets/images/code.png'),),
                      SizedBox(height: 12,),
                      AppText(
                        textAlign: TextAlign.center,
                        title: 'The tracking code will appear here after the order is executed'.tr(),
                        fontSize: 14,
                        color: AppColors.secondary,

                      )
                    ],
                  ),
                ),
                QrCode(),
                AppButton(
                 title: 'Retrieve the request'.tr(),
                 color: AppColors.primary,
                 margin: EdgeInsets.symmetric(vertical: 16),
                 constrainedAxis: Axis.horizontal,
                 onTap: () {},
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Image.asset('assets/images/cancel.png'),),
                      SizedBox(height: 12,),
                      AppText(
                        textAlign: TextAlign.center,
                        title: 'Order canceled'.tr(),
                        fontSize: 14,
                        color: AppColors.secondary,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
