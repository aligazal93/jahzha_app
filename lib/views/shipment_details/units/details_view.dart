part of '../view.dart';

class _DetailsView extends StatelessWidget {
  const _DetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ShipmentDetailsCubit.of(context);
    final details = cubit.details!;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (AppStatusUtils.isAppProduction)
            AppButton(
            title: (details.canEditReceiverAddress
                ? 'edit_receiver_address'
                : 'editing_address_pending')
                .tr(),
            constrainedAxis: Axis.horizontal,
            height: 48,
            titleFontSize: details.canEditReceiverAddress ? 14 : 12,
            padding: EdgeInsets.zero,
            onTap: details.canEditReceiverAddress
                ? () => RouteUtils.navigateTo(EditReceiverView(shipmentID: cubit.id))
                : null,
          ),
          SizedBox(height: 12),
          Center(
            child: AppText(
              fontSize: 16,
              title: 'Order details'.tr(),
              color: AppColors.secondary,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(height: 12),
          AppText(
            fontSize: 12,
            title: 'Receiving address'.tr(),
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 4),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: AppText(
              title: details.shipper.address,
              fontSize: 14,
              color: AppColors.secondary,
            ),
          ),
          AppText(
            fontSize: 12,
            title: 'Delivery Address'.tr(),
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 4),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: AppText(
              title: details.receiver.address,
              fontSize: 14,
              color: AppColors.secondary,
            ),
          ),
          AppText(
            fontSize: 12,
            title: 'The senders mobile number'.tr(),
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 4),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    title: details.shipper.phone,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Utils.copyToClipboard(details.shipper.phone),
                  child: Image.asset(
                    'assets/images/copy.png',
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          AppText(
            fontSize: 12,
            title: 'The receiver mobile number'.tr(),
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 4),
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 4),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: Row(
              children: [
                Expanded(
                  child: AppText(
                    title: details.receiver.phone,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Utils.copyToClipboard(details.receiver.phone),
                  child: Image.asset(
                    'assets/images/copy.png',
                    width: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          AppText(
            fontSize: 12,
            title: 'Approximate weight'.tr(),
            color: AppColors.txtGray,
            fontWeight: FontWeight.w500,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: details.shipment.weight,
                  color: AppColors.secondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  title: 'kg'.tr(),
                  color: AppColors.txtGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          AppText(
            fontSize: 12,
            title: 'Expected arrival time'.tr(),
            color: AppColors.txtGray,
            padding: EdgeInsets.symmetric(vertical: 8),
            fontWeight: FontWeight.w500,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.tGray),
              color: AppColors.whiteBk,
            ),
            child: AppText(
              title: details.shipment.expectedArrivalText,
              fontSize: 14,
              color: AppColors.secondary,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          AppText(
            fontSize: 12,
            title: 'Shipment cost'.tr(),
            color: AppColors.txtGray,
            fontWeight: FontWeight.w500,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.tGray),
                color: AppColors.whiteBk),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: details.shipment.shippingPrice,
                  color: AppColors.secondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  title: 'SAR'.tr(),
                  color: AppColors.txtGray,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
