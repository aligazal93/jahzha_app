part of '../view.dart';

class _Coupon extends StatelessWidget {
  const _Coupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CartCubit.of(context);
    final isCouponApplied = cubit.cart?.couponCode != null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'Discount coupons'.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: AppTextField(
                  hint: 'Enter the discount code from the coupons'.tr(),
                  fillColor: AppColors.tGray,
                  controller: cubit.couponTXController,
                ),
              ),
              SizedBox(width: 10),
              AppButton(
                title: (isCouponApplied ? 'cancel' : 'apply').tr(),
                color: isCouponApplied ? AppColors.red : AppColors.primary,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                onTap: () {
                  if (isCouponApplied) {
                    cubit.removeCoupon();
                  } else {
                    cubit.applyCoupon();
                  }
                },
              )
            ],
          ),
        ),
        if (isCouponApplied)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.orangeLight),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    title: "coupon_applied_with_value"
                            .tr(args: [cubit.cart!.couponCode!]) +
                        ' ${cubit.cart?.couponDiscount} ${"SAR".tr()}',
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.percent,
                  size: 16,
                ),
              ],
            ),
          ),
        AppButton(
          title: 'Completion of payment'.tr(),
          onTap: () {},
          color: AppColors.primary,
          constrainedAxis: Axis.horizontal,
          margin: EdgeInsets.symmetric(vertical: 16),
        )
      ],
    );
  }
}
