import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_text.dart';

part 'units/line-v.dart';
part 'units/company_card.dart';
part 'units/compare_card.dart';

class ComparingView extends StatelessWidget {
  const ComparingView({Key? key, required this.offers}) : super(key: key);

  final List<ShippingOffer> offers;

  @override
  Widget build(BuildContext context) {
    final firstOffer = offers.first;
    final secondOffer = offers.last;
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
            value1: firstOffer.estimatedDeliveryTime ?? '',
            value2: secondOffer.estimatedDeliveryTime ?? '',
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
            value1: 'available - in the app'.tr(),
            value2: 'available - in the app'.tr(),
          ),
          CompareCard(
            titleCard: 'Deliver to the representative'.tr(),
            value1: ' ${firstOffer.pickupByCompanyFees} ' + ' ' + ' ${firstOffer.currency} ',
            value2: ' ${secondOffer.pickupByCompanyFees} ' + ' ' + ' ${secondOffer.currency} ',
            fontSize: 20,
            color: AppColors.primary,
          ),
          CompareCard(
            titleCard: 'price'.tr(),
            fontSize: 20,
            color: AppColors.primary,
            value1: ' ${firstOffer.price} ' + ' ' + ' ${firstOffer.currency} ',
            value2: ' ${secondOffer.price} ' + ' ' + ' ${secondOffer.currency} ',
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
                    onTap: () {},
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
                    onTap: () {},
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
  }
}
