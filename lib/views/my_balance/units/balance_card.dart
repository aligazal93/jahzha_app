part of '../view.dart';
class MyBalanceCard extends StatelessWidget {
  const MyBalanceCard({Key? key, required this.statue, required this.point, }) : super(key: key);
  final String statue , point;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: AppColors.tGray
          )
      ),
      child: Row(
        children: [
          Expanded(child: Icon(statue == 'Return balance'.tr() ? FontAwesomeIcons.turnDown : FontAwesomeIcons.turnUp,
            size: 20,
            color:statue == 'Return balance'.tr() ? AppColors.green : AppColors.blue)),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: statue.tr(),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondary,
                ),
                SizedBox(height: 8,),
                AppText(
                  title: 'ديسمبر 4/4/2024',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.txtGray,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppText(
                  title: point,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color:statue == 'Return balance'.tr() ?  AppColors.primary : AppColors.blue,
                ),
                SizedBox(width: 8,),
                AppText(
                  title: 'SAR'.tr(),
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
