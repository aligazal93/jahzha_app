part of '../view.dart';

class _Coupon extends StatelessWidget {
  const _Coupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
              SizedBox(width: 10),
              AppButton(
                title: 'apply'.tr(),
                color: AppColors.primary,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
                onTap: () {},
              )
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

/*
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.orangeLight
              ),
              child: Row(
                children: [
                  AppText(
                    title: 'code 12',
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  Spacer(),
                  Icon(FontAwesomeIcons.circleXmark,size: 16,)
                ],
              ),
            ),

 */