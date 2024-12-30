part of '../view.dart';
class MyPointsCard extends StatelessWidget {
  const MyPointsCard({Key? key, required this.idNumber, required this.point, required this.createAt,required this.type}) : super(key: key);
  final String point , createAt , type ,idNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 7),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: AppColors.tGray
          )
      ),
      child: Row(
        children: [
          Expanded(child: Icon(FontAwesomeIcons.turnDown,size: 20,color: AppColors.green,)),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: 'Points earned'.tr(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                if (type == "shipment_created") ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: AppText(
                      title:'From executing shipment no'.tr()  + ' ' + '${idNumber}',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtGray,
                    ),
                  ),
                ] else if (type == "admin_gift") ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: AppText(
                      title:'🎁 A gift from the admin'.tr(),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.txtGray,
                    ),
                  ),
                ],
                AppText(title: createAt,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  title: point,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
                SizedBox(height: 4,),
                AppText(
                  title: 'point'.tr(),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
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
