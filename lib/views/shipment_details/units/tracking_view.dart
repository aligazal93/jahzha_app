part of '../view.dart';

class _TrackingView extends StatelessWidget {
  const _TrackingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ShipmentDetailsCubit.of(context);
    final details = cubit.details!;
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.tGray),
      ),
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
          SizedBox(height: 20),
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
          SizedBox(height: 8),
          ListView.builder(
            itemCount: details.trackingSteps.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final step = details.trackingSteps[index];
              return _trackingInfo(
                time: step.time,
                title: step.statusText,
                circleColor: step.active ? AppColors.green : AppColors.red,
                colorBk: index.isEven ? AppColors.tGray : AppColors.white,
              );
            },
          ),
          if (details.careemTrackingURL != null)
            AppButton(
              margin: EdgeInsets.only(top: 12),
              title: 'track_order_via_careem'.tr(),
              onTap: () => Launcher.openUrl(details.careemTrackingURL!),
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
