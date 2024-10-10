part of '../view.dart';

class CouponsCard extends StatelessWidget {
  const CouponsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'Discount coupons'.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        AppText(
          title: 'Enter the discount code from the coupons'.tr(),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          padding: EdgeInsets.symmetric(vertical: 10),
          color: AppColors.txtGray,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                fillColor: AppColors.tGray,
              ),
            ),
            AppButton(
              title: 'apply'.tr(),
              color: AppColors.primary,
              onTap: () {},
            )
          ],
        ),
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
