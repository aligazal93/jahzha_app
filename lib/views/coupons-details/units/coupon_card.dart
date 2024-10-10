part of '../view.dart';
class CouponCard extends StatelessWidget {
  const CouponCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
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
                title: '20% خصم',
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              SizedBox(width: 12,),
              AppText(
                title: 'نمشي 2024 | حتى 418 ريال',
                color: AppColors.secondary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              )
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.fireFlameCurved,color: AppColors.primary,),
                    AppText(
                      title: 'Special offers'.tr(),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),
              SizedBox(width: 20,),
              Container(
                child: Row(
                  children: [
                    Icon(FontAwesomeIcons.thumbsUp,color: AppColors.primary,),
                    AppText(
                      title: 'Verified coupon'.tr(),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppColors.primary,
                    )
                  ],
                ),
              ),

            ],
          ),
          SizedBox(height: 8,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.tGray
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(title: 'ASD FDSFS'),
                InkWell(
                    onTap: () {
                      Utils.copyToClipboard(context, 'ASD FDSFS');
                    },
                    child: Icon(FontAwesomeIcons.solidCopy,color: AppColors.lightGray,))
              ],
            ),
          ),
          AppText(
            title: 'Copy the code and use it when sending a shipment',
            color: AppColors.txtGray,
            fontSize: 14,
            padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
            textAlign: TextAlign.start,
            fontWeight: FontWeight.w400,
          )

        ],
      ),
    );
  }
}
