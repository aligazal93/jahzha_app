import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
part 'units/details_order.dart';
part 'units/coupons_card.dart';
part 'units/cart_ship_details.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'the cart'.tr(),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            children: [
              Row(
                children: [
                  AppText(
                    title: '2',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.txtGray,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  AppText(
                    title: 'Order available in cart'.tr(),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                            color: AppColors.blueLight,
                            border: Border.all(color: AppColors.GrayLight),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(isOpen
                                    ? FontAwesomeIcons.angleUp
                                    : FontAwesomeIcons.angleDown),
                                SizedBox(
                                  width: 12,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        title: 'Order ID'.tr(),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        fontSize: 14,
                                        color: AppColors.txtGray,
                                      ),
                                      AppText(
                                        title: '#53455345',
                                        fontSize: 16,
                                        color: AppColors.secondary,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        title: 'Shipment cost'.tr(),
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6),
                                        fontSize: 14,
                                        color: AppColors.txtGray,
                                      ),
                                      AppText(
                                        title: '700' + ' ' + 'SAR'.tr(),
                                        fontSize: 16,
                                        color: AppColors.secondary,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Icon(
                                    FontAwesomeIcons.trashCan,
                                    color: AppColors.red,
                                  ),
                                )
                              ],
                            ),
                            Visibility(
                              visible: isOpen,
                              child: Container(
                                child: CartShipDetails()
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 16),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.darkGray),
                              borderRadius: BorderRadius.circular(12)),
                          child: DetailsOrder()),
                      CouponsCard()
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
