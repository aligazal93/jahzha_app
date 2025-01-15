part of '../view.dart';

class _Receipt extends StatelessWidget {
  const _Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.of(context);
    final cart = cubit.cart!;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: 'order summary'.tr(),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 20),
          if (cart.shippingPrice != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  AppText(
                    title: 'Shipping delivery'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                  Spacer(),
                  AppText(
                    title: cart.shippingPrice! + ' ' + 'SAR'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                ],
              ),
            ),
          if (cart.pickupPrice != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  AppText(
                    title: 'pickup cost'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                  Spacer(),
                  AppText(
                    title: cart.pickupPrice! + ' ' + 'SAR'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                ],
              ),
            ),
          if (cart.couponDiscount != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  AppText(
                    title: 'Discount coupon'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                  Spacer(),
                  AppText(
                    title: cart.couponDiscount! + ' ' + 'SAR'.tr(),
                    fontSize: 14,
                    color: AppColors.txtGray,
                  ),
                ],
              ),
            ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                AppText(
                  title: 'Total'.tr(),
                  fontSize: 14,
                  color: AppColors.txtGray,
                ),
                Spacer(),
                AppText(
                  title: cart.totalPrice! + ' ' + 'SAR'.tr(),
                  fontSize: 14,
                  color: AppColors.txtGray,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
