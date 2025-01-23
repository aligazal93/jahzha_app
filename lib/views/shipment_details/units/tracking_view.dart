part of '../view.dart';

class _TrackingView extends StatelessWidget {
  const _TrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.tGray)),
      child: Column(
        children: [
          AppText(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(vertical: 12),
            color: AppColors.txtGray,
            title: 'View and update your shipment delivery information'.tr(),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _trackingCard(
                  image: 'assets/images/tr-1.png',
                  color: AppColors.green,
                ),
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: AppColors.tGray,
                  ),
                ),
                _trackingCard(
                  image: 'assets/images/tr-2.png',
                  color: AppColors.green,
                ),
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: AppColors.tGray,
                  ),
                ),
                _trackingCard(
                  image: 'assets/images/tr-3.png',
                  color: AppColors.primary,
                ),
                Expanded(
                  child: Icon(
                    FontAwesomeIcons.solidCircle,
                    size: 8,
                    color: AppColors.tGray,
                  ),
                ),
                _trackingCard(
                  image: 'assets/images/tr-4.png',
                  color: AppColors.txtGray,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppText(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.secondary,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              title: 'Your shipments journey'.tr(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          _trackingInfo(
            time: '4/5/2024 - 12:12 PM',
            title: 'تم أستلام الشحنة - المملكة العربية السعودية',
            circleColor: AppColors.green,
            colorBk: AppColors.tGray,
          ),
          _trackingInfo(
            time: '4/5/2024 - 12:12 PM',
            title: 'تم أستلام معومات الشحنه بنجاح',
            circleColor: AppColors.green,
            colorBk: AppColors.white,
          ),
          _trackingInfo(
            time: '4/5/2024 - 12:12 PM',
            title: 'تم نقل الشحنة إلى الاردن',
            circleColor: AppColors.primary,
            colorBk: AppColors.tGray,
          ),
          _trackingInfo(
            time: '4/5/2024 - 12:12 PM',
            title: ' تم شحن الشحنة بنجاح إلى الأمارات',
            circleColor: AppColors.darkGrayBlue,
            colorBk: AppColors.white,
          ),
          _trackingInfo(
            time: '4/5/2024 - 12:12 PM',
            title: 'تم توصيل الشحنة بنجاح',
            circleColor: AppColors.darkGrayBlue,
            colorBk: AppColors.white,
          ),
        ],
      ),
    );
  }

  Widget _trackingCard({
    required String image,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            border: Border.all(color: color)),
        child: Image.asset(
          image,
          width: 30,
        ),
      ),
    );
  }

  Widget _trackingInfo({
    required Color colorBk,
    required Color circleColor,
    required String title,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: colorBk, border: Border.all(color: AppColors.tGray)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Icon(
                  FontAwesomeIcons.solidCircle,
                  size: 8,
                  color: AppColors.darkGrayBlue,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    FontAwesomeIcons.solidCircleCheck,
                    color: circleColor,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.solidCircle,
                  size: 8,
                  color: AppColors.darkGrayBlue,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title: title,
                  color: AppColors.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(
                  height: 10,
                ),
                AppText(
                  title: time,
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
