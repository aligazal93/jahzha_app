import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class BoxCard extends StatelessWidget {
  const BoxCard({Key? key, required this.titleDelivered, required this.statues, required this.boxId, required this.type, required this.method, required this.address, required this.colorStatue}) : super(key: key);
  final String titleDelivered , statues , type , method ,boxId , address;
  final Color colorStatue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 0),
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColors.darkGrayBlue
          ),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Image.asset('assets/images/box.png'),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.darkGrayBlue.withOpacity(.3)
                ),
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(horizontal: 12),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: titleDelivered,
                      fontSize: 14,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 8,),
                    AppText(
                      title: '( ${statues} )',
                      fontSize: 14,
                      color: colorStatue,
                      fontWeight: FontWeight.w700,
                    )

                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Icon(Utils.isAR ? FontAwesomeIcons.angleLeft : FontAwesomeIcons.angleRight,color: AppColors.secondary,size: 18,),
                padding: EdgeInsets.all(12),
              ),
            ],
          ),
          Divider(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Order ID'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                AppText(
                  title: boxId!,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Delivery Address'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                AppText(
                  title: address!,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Shipment type'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                AppText(
                  title: type,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Shipping method'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                AppText(
                  title: method,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
