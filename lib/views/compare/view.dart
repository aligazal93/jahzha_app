import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/line-v.dart';
part 'units/compare_card.dart';

class ComparingView extends StatelessWidget {
  const ComparingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Compare'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14),
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppColors.tGray
                )
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logo-h.png'),
                        AppText(
                          title: 'شركة جهزها للشحن',
                          fontSize: 12,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.ticket,color: AppColors.primary,size: 12,),
                                AppText(
                                  title: 'saving'.tr(),
                                  fontSize: 10,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,

                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.rocket,color: AppColors.blue,size: 12,),
                                AppText(
                                  title: 'fastest'.tr(),
                                  fontSize: 10,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blue,

                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                LineVertical(height: 100),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/zagel.png'),
                        AppText(
                          title: 'شركة زاجل للشحن',
                          fontSize: 12,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,

                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.ticket,color: AppColors.primary,size: 12,),
                                AppText(
                                  title: 'saving'.tr(),
                                  fontSize: 10,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,

                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          CompareCard(
            titleCard: 'service type'.tr(),
            value1: 'التوصيل خلال 14 إلى 20 يوم',
            value2: 'التوصيل خلال 14 إلى 20 يوم',
          ),
          CompareCard(
            titleCard: 'Delivery time'.tr(),
            value1: 'التوصيل خلال 14 إلى 20 يوم',
            value2: 'التوصيل خلال 14 إلى 20 يوم',
          ),
          CompareCard(
            titleCard: 'Protection cover'.tr(),
            value1: 'على الطرود بقيمة 1000 ريال',
            value2: 'على الطرود بقيمة 1000 ريال',
          ),
          CompareCard(
            titleCard: 'Maximum weight'.tr(),
            value1: '50 كيلو جرام',
            value2: '50 كيلو جرام',
          ),
          CompareCard(
            titleCard: 'tracking'.tr(),
            value1: 'متاح - من خلال الموقع',
            value2: 'متاح - من خلال الموقع',
          ),
          CompareCard(
            titleCard: 'Home delivery'.tr(),
            value1: ' 50 ' + ' ' + ' ر.س ',
            value2: ' 50 ' + ' ' + 'ر.س',
            fontSize: 20,
            color: AppColors.primary,
          ),
          CompareCard(
            titleCard: 'price'.tr(),
            fontSize: 20,
            color: AppColors.primary,
            value1: ' 700 ' + ' ' + ' ر.س ',
            value2: ' 700 ' + ' ' + 'ر.س',

          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 6),
            child: Row(
              children: [
                Expanded(
                  child: AppButton(
                    color: AppColors.primary,
                    padding: EdgeInsets.all(12),
                    constrainedAxis: Axis.horizontal,
                    onTap: () {},
                    title: 'order now'.tr(),
                  ),
                ),
                SizedBox(width: 12,),
                Expanded(
                  child: AppButton(
                    color: AppColors.primary,
                    padding: EdgeInsets.all(12),
                    constrainedAxis: Axis.horizontal,
                    onTap: () {},
                    title: 'order now'.tr(),
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
