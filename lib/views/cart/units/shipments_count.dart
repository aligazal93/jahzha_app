part of '../view.dart';

class _ShipmentsCount extends StatelessWidget {
  const _ShipmentsCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final length = CartCubit.of(context).cart!.totalShipmentsCount;
    return Row(
      children: [
        AppText(
          title: '$length',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: AppColors.txtGray,
        ),
        SizedBox(width: 4),
        Expanded(
          child: AppText(
            title: 'Order available in cart'.tr(),
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.txtGray,
          ),
        ),
        AppButton.outline(
          title: 'add_another_order'.tr(),
          titleColor: AppColors.primary,
          titleFontSize: 12,
          padding: EdgeInsets.symmetric(horizontal: 24),
          height: 40,
          onTap: () => RouteUtils.navigateAndPopAll(NavBarView()),
        ),
      ],
    );
  }
}
