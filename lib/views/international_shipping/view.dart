import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/shipping_offers/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/solid_appbar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class InterNationalShippingView extends StatefulWidget {
  const InterNationalShippingView({Key? key}) : super(key: key);

  @override
  State<InterNationalShippingView> createState() => _InterNationalShippingViewState();
}

class _InterNationalShippingViewState extends State<InterNationalShippingView> {
  PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SolidAppBar(
        currentPage: currentPage,
        title: 'international shipping'.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                children: [
                  Container(
                    child: ListView(
                      children: [
                        SizedBox(height: 12,),
                        AppTextField(
                          fillColor: AppColors.whiteBk,
                          suffixIcon: AppText(
                            title: 'kg'.tr(),
                            color: AppColors.txtGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            padding: EdgeInsets.symmetric(vertical: 14),
                          ),
                          label: 'Approximate weight'.tr(),
                          inputType: TextInputType.number,
                        ),
                        AppDropDownMenu(
                          fillColor: AppColors.whiteBk,
                            onChange:(p0) {},
                            items: [
                              'Box'.tr(),
                              'Documents'.tr()
                            ],
                          hint: '',
                        label: 'Shipment type'.tr(),
                        ),
                        Row(
                          children: [
                            Expanded(child: AppTextField(
                              fillColor: AppColors.whiteBk,
                              suffixIcon: Align(
                                alignment: Alignment.bottomLeft,
                                child: AppText(
                                  title: 'cm'.tr(),
                                  color: AppColors.txtGray,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                ),
                              ),
                              label: 'height'.tr(),
                              inputType: TextInputType.number,
                            ),),
                            Expanded(child: AppTextField(
                              fillColor: AppColors.whiteBk,
                              suffixIcon: Align(
                                alignment: Alignment.bottomLeft,
                                child: AppText(
                                  title: 'cm'.tr(),
                                  color: AppColors.txtGray,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                ),
                              ),
                              label: 'width'.tr(),
                              inputType: TextInputType.number,
                            ),),
                            Expanded(child: AppTextField(
                              fillColor: AppColors.whiteBk,
                              suffixIcon: Align(
                                alignment: Alignment.bottomLeft,
                                child: AppText(
                                  title: 'cm'.tr(),
                                  color: AppColors.txtGray,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                                ),
                              ),
                              label: 'height'.tr(),
                              inputType: TextInputType.number,
                            ),)

                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        SizedBox(height: 12,),
                        AppDropDownMenu(
                          fillColor: AppColors.whiteBk,
                          onChange:(p0) {},
                          items: [
                            'السعودية',
                            'السعودية',
                          ],
                          hint: 'Select country'.tr(),
                          label: 'Transmitting destination'.tr(),
                        ),
                        AppDropDownMenu(
                          fillColor: AppColors.whiteBk,
                          onChange:(p0) {},
                          items: [
                            'السعودية',
                            'السعودية',
                          ],
                          hint: 'Select city'.tr(),
                          label: 'city'.tr(),
                        ),
                        AppTextField(
                          fillColor: AppColors.whiteBk,
                          label: 'Postal code'.tr(),
                          inputType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: ListView(
                      children: [
                        SizedBox(height: 12,),
                        AppDropDownMenu(
                          fillColor: AppColors.whiteBk,
                          onChange:(p0) {},
                          items: [
                            'السعودية',
                            'السعودية',
                          ],
                          hint: 'Select country'.tr(),
                          label: 'Receiving destination'.tr(),
                        ),
                        AppDropDownMenu(
                          fillColor: AppColors.whiteBk,
                          onChange:(p0) {},
                          items: [
                            'السعودية',
                            'السعودية',
                          ],
                          hint: 'Select city'.tr(),
                          label: 'city'.tr(),
                        ),
                        AppTextField(
                          fillColor: AppColors.whiteBk,
                          label: 'Postal code'.tr(),
                          inputType: TextInputType.number,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentPage < 2)
                  Expanded(
                    child: AppButton(
                      titleFontSize: 14,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      constrainedAxis: Axis.horizontal,
                      title: 'Next'.tr(),
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      },

                    ),
                  ),
                if (currentPage ==  2)
                  Expanded(
                    child: AppButton(
                      titleFontSize: 14,
                      padding: EdgeInsets.zero,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      constrainedAxis: Axis.horizontal,
                      title: 'Get offers'.tr(),
                      onTap: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                        // RouteUtils.navigateTo(AvailableOffersView());
                      },

                    ),
                  ),
                if (currentPage > 0)
                Expanded(
                  child: AppButton(
                    titleFontSize: 14,
                    padding: EdgeInsets.zero,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    constrainedAxis: Axis.horizontal,
                    color: AppColors.darkGrayBlue,
                    titleColor:AppColors.txtGray,
                    title: 'Previous'.tr(),
                    onTap: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
