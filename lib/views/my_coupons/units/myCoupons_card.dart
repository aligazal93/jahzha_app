part of '../view.dart';
class MyCouponsCard extends StatelessWidget {
  const MyCouponsCard({Key? key, required this.discount, required this.status, required this.code, required this.discountType}) : super(key: key);
  final String code, discount,discountType;
  final CouponsStatus status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: AppColors.tGray
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                title: 'Discount coupon'.tr(),
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.secondary,
              ),
              SizedBox(width: 10,),
              AppText(
                title: '( ${status.title.tr()} )',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: status == CouponsStatus.notUsed ? AppColors.green : (status == CouponsStatus.inactive
                    ? AppColors.red
                    : AppColors.primary),
              ),
            ],
          ),
          Row(
            children: [
              AppText(
                title: 'discount'.tr(),
                color: AppColors.secondary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              SizedBox(width: 7,),
              AppText(
                title: '${discount}',
                color: AppColors.txtGray,
                fontWeight: FontWeight.w700,
                fontSize: 18,
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              discountType == "percent" ?
              AppText(
                title: '%',
                color: AppColors.txtGray,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
              ) :
              AppText(
                title: 'SAR'.tr(),
                color: AppColors.txtGray,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 4),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.tGray
                ),
                color: AppColors.whiteBk
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(title:code,fontWeight: FontWeight.w400,fontSize: 14,),
                status.title.tr() == CouponsStatus.notUsed.title.tr() ? InkWell(
                    onTap: () {
                      Utils.copyToClipboard(context, code);
                    },
                    child: Image.asset('assets/images/copy.png'),) : SizedBox()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
