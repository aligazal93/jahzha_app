import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_sheet.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/route_utils/route_utils.dart';
import '../../views/shipping_offers/view.dart';
import '../app_button.dart';
import '../app_text.dart';

class ShippingOfferCard extends StatefulWidget {
  const ShippingOfferCard({
    Key? key,
    required this.offer,
    required this.onComparisonTap,
    required this.onOrder,
  }) : super(key: key);

  final ShippingOffer offer;
  final void Function(bool v) onComparisonTap;
  final void Function() onOrder;

  @override
  State<ShippingOfferCard> createState() => _ShippingOfferCardState();
}

class _ShippingOfferCardState extends State<ShippingOfferCard> {
  bool isExpanded = false;

  void toggleExpansion() {
    isExpanded = !isExpanded;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final offer = widget.offer;
    return GestureDetector(
      onTap: toggleExpansion,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.tGray),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AppNetworkImage(
                        url: offer.company.logo,
                        width: 64,
                        height: 64,
                      ),
                    ),
                    SizedBox(width: 8),
                    Flexible(
                      child: AppText(
                        title: offer.company.name,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Icon(
                        FontAwesomeIcons.circleInfo,
                        size: 22,
                        color: AppColors.txtGray,
                      ),
                      onTap: () {
                        AppSheet.show(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              UnconstrainedBox(
                                child: AppNetworkImage(
                                  url: offer.company.logo,
                                  height: 64,
                                  width: 64,
                                ),
                              ),
                              SizedBox(height: 12),
                              AppText(
                                title: offer.company.name,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(height: 12),
                              if (offer.estimatedDeliveryTime != null) ...[
                                AppText(
                                  title: 'Delivery time'.tr() +
                                      ': ' +
                                      offer.estimatedDeliveryTime!,
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 12),
                              ],
                              AppText(
                                title: offer.price.toString() +
                                    ' ' +
                                    offer.currency,
                                textAlign: TextAlign.center,
                                color: AppColors.primary,
                              ),
                              SizedBox(height: 12),
                              Html(data: offer.company.description),
                              SizedBox(height: 12),
                              AppButton(
                                title: 'Order now'.tr(),
                                onTap: () {},
                              ),
                              if (Platform.isAndroid) SizedBox(height: 16),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 16),
                    // Spacer(),
                    // Row(
                    //   children: [
                    //     Icon(
                    //       FontAwesomeIcons.print,
                    //       size: 18,
                    //       color: AppColors.primary,
                    //     ),
                    //     AppText(
                    //       color: AppColors.txtGray,
                    //       fontSize: 12,
                    //       title: 'Printing required'.tr(),
                    //       fontWeight: FontWeight.w700,
                    //       padding: EdgeInsets.symmetric(horizontal: 8),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                PositionedDirectional(
                  bottom: 0,
                  top: 0,
                  end: 16,
                  child: Icon(
                    isExpanded
                        ? FontAwesomeIcons.chevronUp
                        : FontAwesomeIcons.chevronDown,
                    size: 20,
                    color: AppColors.lightGray,
                  ),
                ),
              ],
            ),
            if (offer.isCheapest || offer.isFastest || offer.isNew)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (offer.isCheapest)
                      Expanded(
                        child: UnconstrainedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.orangeLight,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.ticket,
                                  size: 12,
                                  color: AppColors.primary,
                                ),
                                AppText(
                                  title: 'saving'.tr(),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (offer.isFastest)
                      Expanded(
                        child: UnconstrainedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.blueLight,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.rocket,
                                  size: 12,
                                  color: AppColors.blue,
                                ),
                                AppText(
                                  title: 'fastest'.tr(),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (offer.isNew)
                      Expanded(
                        child: UnconstrainedBox(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.orangeLight,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.star,
                                  size: 12,
                                  color: AppColors.primary,
                                ),
                                AppText(
                                  title: 'new'.tr(),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            Divider(),
            AnimatedCrossFade(
              duration: Duration(milliseconds: 400),
              crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              firstChild: SizedBox.shrink(),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (offer.estimatedDeliveryTime != null) ...[
                    AppText(
                      title: 'Expected arrival date'.tr(),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      color: isExpanded ? AppColors.txtGray : Colors.transparent,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          FontAwesomeIcons.clock,
                          color: AppColors.lightGray,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: AppText(
                            title: offer.estimatedDeliveryTime!,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.lightGray,
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ],
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        FontAwesomeIcons.lifeRing,
                        color: AppColors.lightGray,
                        size: 20,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: AppText(
                          title: offer.insuranceText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.lightGray,
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                  if (offer.rewardPoints != null) ...[
                    SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(width: 12),
                        Icon(
                          FontAwesomeIcons.ticket,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: AppText(
                            title: 'get_point_on_shipping'
                                .tr(args: [offer.rewardPoints.toString()]),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(width: 12),
                      ],
                    ),
                  ],
                  SizedBox(height: 12),
                  Divider(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pickingOption(
                    title: "Deliver to the nearest branch".tr(),
                    price: '',
                    isSelected: offer.pickupType == PickupType.myself,
                    onTap: () {
                      offer.pickupType = PickupType.myself;
                      setState(() {});
                    },
                  ),
                  if (offer.pickupByCompany)
                    _pickingOption(
                      title: "Deliver to the representative".tr(),
                      price: '${offer.pickupByCompanyFees} ${offer.currency}',
                      isSelected: offer.pickupType == PickupType.company,
                      onTap: () {
                        offer.pickupType = PickupType.company;
                        setState(() {});
                      },
                    ),
                  if (offer.pickupByCareem)
                    _pickingOption(
                      title: "Delivery via Careem".tr(),
                      price: '${offer.pickupByCareemFees} ${offer.currency}',
                      isSelected: offer.pickupType == PickupType.careem,
                      onTap: () {
                        offer.pickupType = PickupType.careem;
                        setState(() {});
                      },
                    ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.tGray,
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
                        title: '${offer.priceWithFees}',
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                      AppText(
                        title: offer.currency,
                        color: AppColors.secondary,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(
                        FontAwesomeIcons.triangleExclamation,
                        color: AppColors.primary,
                        size: 16,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: AppText(
                          title:
                              'price_may_vary_due_to_shipment_dimensions'.tr(),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(width: 12),
                    ],
                  ),
                  SizedBox(height: 8),
                  AppButton(
                    color: AppColors.primary,
                    constrainedAxis: Axis.horizontal,
                    height: 40,
                    titleFontSize: 14,
                    onTap: widget.onOrder,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    title: 'Order now'.tr(),
                  )
                ],
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: InkWell(
                onTap: () {
                  offer.addToComparison = !offer.addToComparison;
                  setState(() {});
                  widget.onComparisonTap(offer.addToComparison);
                },
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(microseconds: 5000),
                      height: 30,
                      width: 30,
                      curve: Curves.bounceInOut,
                      // margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColors.darkGray.theme,
                        ),
                        color: offer.addToComparison
                            ? AppColors.primary
                            : AppColors.darkGray,
                      ),
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: AppColors.white.theme,
                        size: 12,
                      ),
                    ),
                    SizedBox(width: 12),
                    AppText(
                      title: 'Add to compare'.tr(),
                      color: AppColors.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _pickingOption({
    required String title,
    required String price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(microseconds: 5000),
            height: 24,
            width: 24,
            curve: Curves.bounceInOut,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.darkGray.theme,
              ),
              color: isSelected ? AppColors.primary : AppColors.darkGray,
            ),
            child: Icon(
              FontAwesomeIcons.check,
              color: AppColors.white.theme,
              size: 12,
            ),
          ),
          SizedBox(width: 8),
          AppText(
            title: title,
            color: AppColors.secondary,
            fontSize: 12,
            padding: EdgeInsets.symmetric(horizontal: 4),
          ),
          if (price.isNotEmpty)
            AppText(
              title: '( ${price} )',
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 4),
              fontWeight: FontWeight.w700,
              fontSize: 10,
            )
        ],
      ),
    );
  }
}
