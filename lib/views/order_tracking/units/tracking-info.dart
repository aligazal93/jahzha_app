part of '../view.dart';
class TrackingInfo extends StatelessWidget {
  const TrackingInfo({Key? key, required this.colorBk, required this.circleColor, required this.title, required this.time}) : super(key: key);
  final Color colorBk,circleColor;
  final String title,time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorBk,
          border: Border.all(
              color: AppColors.tGray
          )
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(FontAwesomeIcons.solidCircle,size: 8,color: AppColors.darkGrayBlue,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(FontAwesomeIcons.solidCircleCheck,color:circleColor,),
                ),
                Icon(FontAwesomeIcons.solidCircle,size: 8,color: AppColors.darkGrayBlue,),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title:title,
                  color: AppColors.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(height: 10,),
                AppText(
                  title:time,
                  color: AppColors.txtGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
