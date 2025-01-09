import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/models/shipping/get_local_offers_dto.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/shipping_offers/units/accordion.dart';
import 'package:jahzha_app/views/compare/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/shipping_offer_card.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/empty_view.dart';

import 'cubit.dart';

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
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Offers available'.tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<ShippingOffersCubit, ShippingOffersStates>(
            builder: (context, state) {
              final cubit = ShippingOffersCubit.of(context);
              final offers = cubit.offers;
              if (cubit.isStateLoading) {
                return AppLoadingIndicator();
              } else if (offers.isEmpty) {
                return EmptyView();
              }
              return Column(
                children: [
                  OffersInfo(),
                  ResultButton(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: offers.length,
                      itemBuilder: (context, index) {
                        final offer = offers[index];
                        return ShippingOfferCard(
                          offer: offer,
                          onComparisonTap: (v) => cubit.toggleComparison(offer),
                        );
                      },
                    ),
                  ),
                  if (cubit.comparisonOffers.length == 2)
                    AppButton(
                      title: 'Compare'.tr(),
                      onTap: () => RouteUtils.navigateTo(ComparingView(
                        offers: cubit.comparisonOffers,
                      )),
                      color: AppColors.primary,
                      margin: EdgeInsets.symmetric(vertical: 22),
                      constrainedAxis: Axis.horizontal,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
