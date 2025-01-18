import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/models/shipping/get_offers_dto.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/core/models/shipping_lat_lng.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/shipping_offers/units/accordion.dart';
import 'package:jahzha_app/views/compare/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/shipping_offer_card.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_sheet.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/empty_view.dart';
import 'package:jahzha_app/widgets/google_places_text_form_field.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import 'cubit.dart';

part 'units/pick_location_for_careem.dart';

part 'units/info.dart';

part 'units/result_button.dart';

part 'units/result_bottom_sheet.dart';

part 'units/info_bottom_sheet.dart';

class ShippingOffersView extends StatelessWidget {
  const ShippingOffersView({
    Key? key,
    required this.isLocal,
    required this.dto,
  }) : super(key: key);

  final bool isLocal;
  final GetOffersDTO dto;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShippingOffersCubit(
        dto: dto,
        isLocal: isLocal,
      )..getOffers(),
      child: BlocBuilder<ShippingOffersCubit, ShippingOffersStates>(
        builder: (context, state) {
          final cubit = ShippingOffersCubit.of(context);
          return Scaffold(
            appBar: CustomAppBar(
              title: 'Offers available'.tr(),
              actions: [
                if (!cubit.isStateLoading)
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.sliders,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    onPressed: () => AppSheet.show(
                      child: ResultBottomSheetView(cubit: cubit),
                    ),
                  ),
              ],
            ),
            body: Builder(
              builder: (context) {
                final offers = cubit.filteredOffers.isNotEmpty
                    ? cubit.filteredOffers
                    : cubit.offers;
                if (cubit.isStateLoading) {
                  return AppLoadingIndicator();
                } else if (offers.isEmpty) {
                  return EmptyView();
                }
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: [
                    OffersInfo(),
                    SizedBox(height: 20),
                    // ResultButton(),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        return ShippingOfferCard(
                          offer: offer,
                          onComparisonTap: (v) =>
                              cubit.toggleComparison(offer),
                          onOrder: () {
                            if (offer.pickupType == PickupType.careem) {
                              PickLocationForCareemView(
                                cubit: cubit,
                                originCountryCode: dto.origin!.countryCode!,
                                destinationCountryCode:
                                    dto.destination!.countryCode!,
                                onPickLocation: (origin, destination) {
                                  cubit.orderOffer(
                                    offer: offer,
                                    origin: origin,
                                    destination: destination,
                                  );
                                },
                              ).show();
                            } else {
                              cubit.orderOffer(offer: offer);
                            }
                          },
                        );
                      },
                    ),
                    if (cubit.comparisonOffers.length == 2)
                      AppButton(
                        title: 'Compare'.tr(),
                        onTap: () => RouteUtils.navigateTo(
                            ComparingView(cubit: cubit)),
                        color: AppColors.primary,
                        margin: EdgeInsets.symmetric(vertical: 22),
                        constrainedAxis: Axis.horizontal,
                      ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
