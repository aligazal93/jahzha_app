import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/models/cart/cart_shipment.dart';

import '../../core/helpers/app_colors.dart';
import '../app_text.dart';

class CartCard extends StatefulWidget {
  const CartCard({
    Key? key,
    required this.shipment,
    required this.onDelete,
  }) : super(key: key);

  final void Function() onDelete;
  final CartShipment shipment;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final shipment = widget.shipment;
    return GestureDetector(
      onTap: () {
        isOpen = !isOpen;
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          border: Border.all(color: AppColors.GrayLight),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 12),
                Icon(
                  isOpen
                      ? FontAwesomeIcons.angleUp
                      : FontAwesomeIcons.angleDown,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'Order ID'.tr(),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        fontSize: 12,
                        color: AppColors.txtGray,
                      ),
                      AppText(
                        title: '#${shipment.itemNumber}',
                        fontSize: 14,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'Shipment cost'.tr(),
                        padding: EdgeInsets.symmetric(vertical: 6),
                        fontSize: 12,
                        color: AppColors.txtGray,
                      ),
                      AppText(
                        title: '${shipment.totalPrice}' + ' ' + 'SAR'.tr(),
                        fontSize: 14,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: InkWell(
                    onTap: widget.onDelete,
                    child: Icon(
                      FontAwesomeIcons.trashCan,
                      color: AppColors.red,
                    ),
                  ),
                )
              ],
            ),
            Visibility(
              visible: isOpen,
              child: Column(
                children: [
                  Divider(height: 20),
                  Row(
                    children: [
                      if (shipment.arrivalTime != null)
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: 'Shipment details'.tr(),
                                  color: AppColors.txtGray,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                AppText(
                                  title: shipment.arrivalTime!,
                                  color: AppColors.secondary,
                                  fontSize: 12,
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (shipment.receiverAddress != null)
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title: 'Delivery Address'.tr(),
                                  color: AppColors.txtGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                AppText(
                                  title: shipment.receiverAddress!,
                                  color: AppColors.secondary,
                                  fontSize: 12,
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: 'Receipt details'.tr(),
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              color: AppColors.darkBlue,
                            ),
                            AppText(
                              title: shipment.shipperAddress,
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              color: AppColors.secondary,
                            ),
                            AppText(
                              title: '\u200E+${shipment.shipperPhone}',
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: 'Delivery details'.tr(),
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 6),
                              color: AppColors.txtGray,
                            ),
                            AppText(
                              title: shipment.receiverAddress ?? '',
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              color: AppColors.secondary,
                            ),
                            AppText(
                              title: '\u200E${shipment.receiverPhone}',
                              fontSize: 12,
                              padding: EdgeInsets.symmetric(vertical: 4),
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
