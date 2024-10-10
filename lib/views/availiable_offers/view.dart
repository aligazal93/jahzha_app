import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/availiable_offers/cubit/cubit.dart';
import 'package:jahzha_app/views/availiable_offers/cubit/states.dart';
import 'package:jahzha_app/views/availiable_offers/units/accordion.dart';
import 'package:jahzha_app/views/compare/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/info.dart';
part 'units/result_button.dart';
part 'units/result_bottom_sheet.dart';
part 'units/info_bottom_sheet.dart';

class AvailableOffersView extends StatefulWidget {
  const AvailableOffersView({Key? key}) : super(key: key);

  @override
  State<AvailableOffersView> createState() => _AvailableOffersViewState();
}

class _AvailableOffersViewState extends State<AvailableOffersView> {
  bool isChecked = false;
  bool isCompared = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AvailableOffersCubit(),
      child: Scaffold(
        appBar:CustomAppBar(
          title: 'Offers available'.tr(),
        ),
        body:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                OffersInfo(),
                ResultButton(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: AppColors.tGray
                            )
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Image.asset('assets/images/logo-h.png'),
                                ),
                                InkWell(child: Icon(FontAwesomeIcons.circleInfo,size: 22,color: AppColors.txtGray,),
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    context: RouteUtils.context,
                                    builder: (context) {
                                      return InfoBottomSheetView();
                                    },
                                  );
                                },
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(FontAwesomeIcons.print,size: 18,color: AppColors.primary,),
                                    AppText(
                                      color: AppColors.txtGray,
                                      fontSize: 12,
                                      title: 'Printing required'.tr(),
                                      fontWeight: FontWeight.w700,
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: AppColors.orangeLight
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.ticket,size: 20,color: AppColors.primary,),
                                          AppText(
                                            title: 'saving'.tr(),
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: AppColors.blueLight
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.rocket,size: 20,color: AppColors.blue,),
                                          AppText(
                                            title: 'fastest'.tr(),
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 4),
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(50),
                                          color: AppColors.orangeLight
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(FontAwesomeIcons.star,size: 20,color: AppColors.primary,),
                                          AppText(
                                            title: 'new'.tr(),
                                            padding: EdgeInsets.symmetric(horizontal: 8),
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      title: 'service type'.tr(),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
                                      color: AppColors.txtGray,
                                    ),
                                    AppText(
                                      title: 'استلام من المكتب',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      padding: EdgeInsets.symmetric(horizontal: 12,),
                                      color: AppColors.secondary,
                                    ),

                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      title: 'Expected arrival date'.tr(),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 14),
                                      color: AppColors.txtGray,
                                    ),
                                    AppText(
                                      title: 'يوم الخميس 04/04 ',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      padding: EdgeInsets.symmetric(horizontal: 12,),
                                      color: AppColors.secondary,
                                    ),

                                  ],
                                ),

                              ],
                            ),
                            SizedBox(height: 12,),
                            Divider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap:() {
                                      setState(() {
                                        isChecked = !isChecked;
                                      });
                                    },
                                    child: AnimatedContainer(duration: Duration(microseconds: 5000),
                                      height: 30,
                                      width: 30,
                                      curve: Curves.bounceInOut,
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors.darkGray.theme,
                                          ),
                                          color: isChecked ? AppColors.primary : AppColors.darkGray
                                      ),
                                      child: Icon(FontAwesomeIcons.check,color: AppColors.white.theme,size: 12,) ,
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Row(
                                    children: [
                                      AppText(
                                        title:'Home delivery'.tr(),
                                        color: AppColors.secondary,
                                        fontSize: 14,
                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                      ),
                                      AppText(
                                        title: '( 50 ريال )',
                                        color: AppColors.primary,
                                        padding: EdgeInsets.symmetric(horizontal: 4),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 14,
                                      )
                                    ],
                                  )


                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.tGray
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppText(
                                        title: 'price'.tr(),
                                        color: AppColors.secondary,
                                        fontSize: 16,
                                      ),
                                      AppText(
                                        title: '400',
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                      AppText(
                                        title: 'SAR'.tr(),
                                        color: AppColors.secondary,
                                        fontSize: 16,
                                      ),

                                    ],
                                  ),
                                  AppButton(
                                      color: AppColors.primary,
                                      constrainedAxis: Axis.horizontal,
                                      padding: EdgeInsets.all(14),
                                      onTap: () {},
                                      margin: EdgeInsets.symmetric(vertical: 8),
                                      title: 'Order now'.tr())
                                ],
                              ),
                            ),
                            SizedBox(height: 12,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap:() {
                                      setState(() {
                                        isCompared = !isCompared;

                                      });
                                    },
                                    child: AnimatedContainer(duration: Duration(microseconds: 5000),
                                      height: 30,
                                      width: 30,
                                      curve: Curves.bounceInOut,
                                      margin: EdgeInsets.symmetric(vertical: 20),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            color: AppColors.darkGray.theme,
                                          ),
                                          color: isCompared ? AppColors.primary : AppColors.darkGray
                                      ),
                                      child: Icon(FontAwesomeIcons.check,color: AppColors.white.theme,size: 12,) ,
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  AppText(
                                    title: 'Add to compare'.tr(),
                                    color: AppColors.secondary,
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                  Spacer(),
                                  Icon(FontAwesomeIcons.lifeRing,color: AppColors.primary,size: 22,)


                                ],
                              ),
                            ),
                            

                          ],
                        ),
                      );
                    },
                  ),
                ),
                AppButton(
                 title: 'Compare'.tr(),
                 onTap: () {
                   RouteUtils.navigateTo(ComparingView());
                 },
                 color: AppColors.primary,
                  margin: EdgeInsets.symmetric(vertical: 22),
                 constrainedAxis: Axis.horizontal,

                )
              ],
            )
        ),
      ),
    );
  }
}
