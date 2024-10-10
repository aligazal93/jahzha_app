import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/card_points.dart';
class MyPointsView extends StatelessWidget {
  const MyPointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my points'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14),
        children: [
          Container(
            width: double.infinity,
            height: 120,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.darkBlue.withOpacity(.2),
                image: DecorationImage(
                    image: AssetImage('assets/images/linear.png',),
                    fit: BoxFit.fill
                ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                     title: 'my points'.tr(),
                     color: AppColors.primary,
                     fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 12,),
                    AppText(
                      title: '42.652',
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      fontSize: 40,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppText(
           title: 'Points earned'.tr(),
           fontSize: 18,
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
          ),
          AppText(
            title: 'ديسمبر 4/4/2024'.tr(),
            fontSize: 16,
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 14),
            fontWeight: FontWeight.w400,
          ),
          MyPointsCard(
            idNumber: '#645455',
            point: '200',
          ),
          MyPointsCard(
            idNumber: '#645455',
            point: '1500',
          ),
          MyPointsCard(
            idNumber: '#56656000',
            point: '4000',
          ),
          AppText(
            title: 'ديسمبر 4/4/2024'.tr(),
            fontSize: 16,
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 14),
            fontWeight: FontWeight.w400,
          ),
          MyPointsCard(
            idNumber: '#645455',
            point: '200',
          ),
          MyPointsCard(
            idNumber: '#645455',
            point: '200',
          ),
        ],
      ),
    );
  }
}
