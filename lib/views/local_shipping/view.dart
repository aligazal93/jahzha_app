import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/availiable_offers/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/solid_appbar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

import '../../widgets/google_places_text_form_field.dart';
import 'cubit.dart';

class LocalShippingView extends StatelessWidget {
  const LocalShippingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocalShippingCubit(),
      child: BlocBuilder<LocalShippingCubit, LocalShippingStates>(
        builder: (context, state) {
          final cubit = LocalShippingCubit.of(context);
          return Scaffold(
            appBar: SolidAppBar(
              currentPage: cubit.currentPage,
              title: 'Local shipping'.tr(),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: cubit.pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 12,
                              ),
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
                                controller: cubit.weightTXController,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            children: [
                              SizedBox(height: 12),
                              GooglePlacesTextFormField(
                                label: 'Transmitting destination'.tr(),
                                fillColor: AppColors.whiteBk,
                                controller: cubit.senderTXController,
                                countries: ['SA'],
                                placeType: PlaceType.cities,
                                onSelected: (value) => cubit.senderPrediction = value,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            children: [
                              SizedBox(height: 12),
                              GooglePlacesTextFormField(
                                label: 'Receiving destination'.tr(),
                                fillColor: AppColors.whiteBk,
                                controller: cubit.receiverTXController,
                                countries: ['SA'],
                                placeType: PlaceType.cities,
                                onSelected: (value) => cubit.receiverPrediction = value,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (cubit.currentPage < 2)
                        Expanded(
                          child: AppButton(
                            titleFontSize: 14,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            constrainedAxis: Axis.horizontal,
                            title: 'Next'.tr(),
                            onTap: cubit.nextPage,
                          ),
                        ),
                      if (cubit.currentPage == 2)
                        Expanded(
                          child: AppButton(
                            titleFontSize: 14,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            constrainedAxis: Axis.horizontal,
                            title: 'Get offers'.tr(),
                            onTap: cubit.getOffers,
                          ),
                        ),
                      if (cubit.currentPage > 0)
                        Expanded(
                          child: AppButton(
                            titleFontSize: 14,
                            padding: EdgeInsets.zero,
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            constrainedAxis: Axis.horizontal,
                            color: AppColors.darkGrayBlue,
                            titleColor: AppColors.txtGray,
                            title: 'Previous'.tr(),
                            onTap: cubit.previousPage,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
