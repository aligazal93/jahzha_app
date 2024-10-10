part of '../view.dart';
class OffersInfo extends StatelessWidget {
  const OffersInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.tGray
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.locationDot,size:20,color: AppColors.primary,),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'from'.tr(),
                      fontSize: 12,
                      color: AppColors.txtGray,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: 'السعودية',
                      fontSize: 12,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.locationDot,size: 20,color: AppColors.primary,),
                SizedBox(width: 12,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'to'.tr(),
                      fontSize: 12,
                      color: AppColors.txtGray,
                      fontWeight: FontWeight.w700,
                    ),
                    AppText(
                      title: 'الامارات',
                      fontSize: 12,
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w700,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Icon(FontAwesomeIcons.bagShopping,size: 20,color: AppColors.primary,),
                SizedBox(width: 8,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      title: 'weight'.tr(),
                      fontSize: 12,
                      color: AppColors.txtGray,
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          title: '20',
                          fontSize: 12,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                          padding: EdgeInsets.symmetric(vertical: 8),
                        ),
                        SizedBox(width: 12,),
                        AppText(
                          title: 'kgm'.tr(),
                          fontSize: 10,
                          color: AppColors.txtGray,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    )

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
