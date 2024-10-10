part of '../view.dart';
class DetailsOrder extends StatelessWidget {
  const DetailsOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'تفاصيل الطلب',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 20,),
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
                title: '400' + ' ' + 'SAR'.tr(),
                fontSize: 14,
                color: AppColors.txtGray,
              ),

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              AppText(
                title: 'Extra charge'.tr(),
                fontSize: 14,
                color: AppColors.txtGray,
              ),
              Spacer(),
              AppText(
                title: '200' + ' ' + 'SAR'.tr(),
                fontSize: 14,
                color: AppColors.txtGray,
              ),

            ],
          ),
        ),
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
                title: '100' + ' ' + 'SAR'.tr(),
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
                title: '700' + ' ' + 'SAR'.tr(),
                fontSize: 14,
                color: AppColors.txtGray,
              ),

            ],
          ),
        ),


      ],
    );
  }
}
