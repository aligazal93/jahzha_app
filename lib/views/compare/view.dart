import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/views/shipping_offers/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../shipping_offers/view.dart';

part 'units/line-v.dart';

part 'units/company_card.dart';

part 'units/compare_card.dart';

class ComparingView extends StatefulWidget {
  const ComparingView({Key? key, required this.cubit}) : super(key: key);

  final ShippingOffersCubit cubit;

  @override
  State<ComparingView> createState() => _ComparingViewState();
}

class _ComparingViewState extends State<ComparingView> {
  PickupType pickupType = PickupType.myself;

  void changePickupType(PickupType type) {
    pickupType = type;
    setState(() {});
  }

  num priceWithFees(ShippingOffer offer) {
    final price = offer.price;
    switch (pickupType) {
      case PickupType.myself:
        return price;
      case PickupType.careem:
        return price + offer.pickupByCareemFees;
      case PickupType.company:
        return price + offer.pickupByCompanyFees;
    }
  }

  void order(ShippingOffer offer) {
    final userDropOffMethodCheck = pickupType == PickupType.myself && !offer.dropOffByUser;
    final companyMethodCheck = pickupType == PickupType.company && !offer.pickupByCompany;
    final careemMethodCheck = pickupType == PickupType.careem && !offer.pickupByCareem;
    if (userDropOffMethodCheck || companyMethodCheck || careemMethodCheck) {
      showSnackBar(
        'deliveryMethodNotAvailable',
        errorMessage: true,
      );
      return;
    }
    offer.pickupType = pickupType;
    if (pickupType == PickupType.careem) {
      final originCountryCode = widget.cubit.dto.origin!.countryCode!;
      final destinationCountryCode = widget.cubit.dto.origin!.countryCode!;
      PickLocationForCareemView(
        cubit: widget.cubit,
        originCountryCode: originCountryCode,
        destinationCountryCode: destinationCountryCode,
        onPickLocation: (origin, destination) {
          widget.cubit.orderOffer(
            offer: offer,
            origin: origin,
            destination: destination,
          );
        },
      ).show();
    } else {
      widget.cubit.orderOffer(offer: offer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: widget.cubit,
      builder: (context, state) {
        final firstOffer = widget.cubit.comparisonOffers.first;
        final secondOffer = widget.cubit.comparisonOffers.last;
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
                    color: AppColors.tGray,
                  ),
                ),
                child: Row(
                  children: [
                    _CompanyCard(offer: firstOffer),
                    LineVertical(height: 100),
                    _CompanyCard(offer: secondOffer),
                  ],
                ),
              ),
              CompareCard(
                titleCard: 'Delivery time'.tr(),
                value1: firstOffer.estimatedDeliveryTime ?? 'unknown'.tr(),
                value2: secondOffer.estimatedDeliveryTime ?? 'unknown'.tr(),
              ),
              CompareCard(
                titleCard: 'Protection cover'.tr(),
                value1: firstOffer.insuranceText,
                value2: secondOffer.insuranceText,
              ),
              // CompareCard(
              //   titleCard: 'Maximum weight'.tr(),
              //   value1: '50 كيلو جرام',
              //   value2: '50 كيلو جرام',
              // ),
              CompareCard(
                titleCard: 'tracking'.tr(),
                value1: 'tracking available - in the app'.tr(),
                value2: 'tracking available - in the app'.tr(),
              ),
              if (firstOffer.dropOffByUser || secondOffer.dropOffByUser)
                InkWell(
                onTap: () => changePickupType(PickupType.myself),
                child: CompareCard(
                  isSelected: pickupType == PickupType.myself,
                  titleCard: "Deliver to the nearest branch".tr(),
                  value1: !firstOffer.dropOffByUser
                      ? 'unavailable'.tr()
                      : ' ${0.0} ' + ' ' + ' ${firstOffer.currency} ',
                  value2: !secondOffer.dropOffByUser
                      ? 'unavailable'.tr()
                      : ' ${0.0} ' + ' ' + ' ${secondOffer.currency} ',
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              if (firstOffer.pickupByCompany || secondOffer.pickupByCompany)
                InkWell(
                onTap: () => changePickupType(PickupType.company),
                child: CompareCard(
                  isSelected: pickupType == PickupType.company,
                  titleCard: "Deliver to the representative".tr(),
                  value1: !firstOffer.pickupByCompany
                      ? 'unavailable'.tr()
                      : ' ${firstOffer.pickupByCompanyFees} ' +
                          ' ' +
                          ' ${firstOffer.currency} ',
                  value2: !secondOffer.pickupByCompany
                      ? 'unavailable'.tr()
                      : ' ${secondOffer.pickupByCompanyFees} ' +
                          ' ' +
                          ' ${secondOffer.currency} ',
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              if (firstOffer.pickupByCareem || secondOffer.pickupByCareem)
                InkWell(
                onTap: () => changePickupType(PickupType.careem),
                child: CompareCard(
                  isSelected: pickupType == PickupType.careem,
                  titleCard: "Delivery via Careem".tr(),
                  value1: !firstOffer.pickupByCareem
                      ? 'unavailable'.tr()
                      : ' ${firstOffer.pickupByCareemFees} ' +
                          ' ' +
                          ' ${firstOffer.currency} ',
                  value2: !secondOffer.pickupByCareem
                      ? 'unavailable'.tr()
                      : ' ${secondOffer.pickupByCareemFees} ' +
                          ' ' +
                          ' ${secondOffer.currency} ',
                  fontSize: 16,
                  color: AppColors.primary,
                ),
              ),
              CompareCard(
                titleCard: 'total_price'.tr(),
                fontSize: 18,
                color: AppColors.primary,
                value1:
                    ' ${priceWithFees(firstOffer)} ' + ' ' + ' ${firstOffer.currency} ',
                value2: ' ${priceWithFees(secondOffer)} ' +
                    ' ' +
                    ' ${secondOffer.currency} ',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        color: AppColors.primary,
                        padding: EdgeInsets.all(12),
                        constrainedAxis: Axis.horizontal,
                        onTap: () => order(firstOffer),
                        title: 'order now'.tr(),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: AppButton(
                        color: AppColors.primary,
                        padding: EdgeInsets.all(12),
                        constrainedAxis: Axis.horizontal,
                        onTap: () => order(secondOffer),
                        title: 'order now'.tr(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
