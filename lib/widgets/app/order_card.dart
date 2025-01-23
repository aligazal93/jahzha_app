import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/utils.dart';
import '../../core/models/order/order.dart';
import '../app_text.dart';
import 'shipping_offer_card.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    required this.order,
  }) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 0,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrayBlue),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 12),
              AppNetworkImage(
                url: order.companyLogo,
                width: ShippingOfferCard.companyImageSize.width,
                height: ShippingOfferCard.companyImageSize.height,
                bgColor: AppColors.darkGrayBlue.withOpacity(.3),
                borderColor: AppColors.primary,
                borderRadius: 12,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppText(
                      title: order.expectedArrivalTime,
                      fontSize: 14,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(height: 8),
                    AppText(
                      title: '( ${'confirmed'.tr()} )',
                      fontSize: 12,
                      color: AppColors.green,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
              Container(
                child: Icon(
                  Utils.isAR
                      ? FontAwesomeIcons.angleLeft
                      : FontAwesomeIcons.angleRight,
                  color: AppColors.secondary,
                  size: 18,
                ),
                padding: EdgeInsets.all(12),
              ),
            ],
          ),
          Divider(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Order ID'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: order.trackingCode));
                      showSnackBar('copied'.tr(), color: AppColors.secondary,);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          FontAwesomeIcons.copy,
                          color: AppColors.txtGray,
                          size: 14,
                        ),
                        SizedBox(width: 6),
                        Flexible(
                          child: AppText(
                            title: '${order.trackingCode}',
                            color: AppColors.txtGray,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Delivery Address'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                Expanded(
                  child: AppText(
                    title: order.delivery,
                    textAlign: TextAlign.end,
                    color: AppColors.txtGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       AppText(
          //         title: 'Shipment type'.tr(),
          //         color: AppColors.txtGray,
          //         fontWeight: FontWeight.w400,
          //         fontSize: 14,
          //       ),
          //       AppText(
          //         title: order.deliveryType,
          //         color: AppColors.txtGray,
          //         fontWeight: FontWeight.w400,
          //         fontSize: 14,
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: 'Shipping method'.tr(),
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                Expanded(
                  child: AppText(
                    title: order.deliveryType,
                    textAlign: TextAlign.end,
                    color: AppColors.txtGray,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
