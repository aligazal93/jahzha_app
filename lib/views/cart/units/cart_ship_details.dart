part of '../view.dart';

class CartShipDetails extends StatelessWidget {
  const CartShipDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Shipment details'.tr(),
                      color: AppColors.txtGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title:
                      'Super conductivity'.tr() + '(same day)'.tr(),
                      color: AppColors.secondary,
                      fontSize: 12,
                      padding: EdgeInsets.symmetric(
                          vertical: 8),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'Delivery Address'.tr(),
                      color: AppColors.txtGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      title:
                      'السعودية , الرياض ',
                      color: AppColors.secondary,
                      fontSize: 12,
                      padding: EdgeInsets.symmetric(
                          vertical: 8),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                  BorderRadius.circular(12)),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Receipt details'.tr(),
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 6),
                    color: AppColors.darkBlue,
                  ),
                  AppText(
                    title: 'السعودية , الرياض ',
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 4),
                    color: AppColors.secondary,
                  ),
                  AppText(
                    title: '+966 546 546 456',
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 4),
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Delivery details'.tr(),
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 6),
                    color: AppColors.txtGray,
                  ),
                  AppText(
                    title: 'الامارات , دبي',
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 4),
                    color: AppColors.secondary,
                  ),
                  AppText(
                    title: '+966 546 546 456',
                    fontSize: 12,
                    padding: EdgeInsets.symmetric(
                        vertical: 4),
                    color: AppColors.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
