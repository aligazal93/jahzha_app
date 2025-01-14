part of '../view.dart';

class _ShipmentPage extends StatelessWidget {
  const _ShipmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = CreateShipmentCubit.of(context);

    return Container(
      child: ListView(
        children: [
          AppTextField(
            fillColor: AppColors.whiteBk,
            suffixIcon: AppText(
              title: 'kg'.tr(),
              color: AppColors.txtGray,
              fontSize: 14,
              fontWeight: FontWeight.w700,
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
            label: 'Approximate weight'.tr(),
            inputType: TextInputType.number,
          ),
          AppDropDownMenu(
            fillColor: AppColors.whiteBk,
            onChange:(p0) {},
            items: [
              'Box'.tr(),
              'Documents'.tr()
            ],
            hint: '',
            label: 'Shipment type'.tr(),
          ),
          AppTextField(
            fillColor: AppColors.whiteBk,
            label: 'Shipment description'.tr(),
            maxLines: 4,
          ),
          AppText(
            title: 'The shipment size fits'.tr(),
            color: AppColors.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(vertical: 8),
          ),
          // Row(
          //   children: [
          //     BoxTypeCard(
          //       index:0,
          //       onTap: cubit.toggleTab,
          //       image: 'bike',
          //       type: 'motorcycle'.tr(),
          //     ),
          //     BoxTypeCard(
          //       index:1,
          //       image: 'big-car',
          //       onTap: cubit.toggleTab,
          //       type: 'Truck'.tr(),
          //     ),
          //     BoxTypeCard(
          //       index:2,
          //       onTap: cubit.toggleTab,
          //       image: 'car',
          //       type: 'small car'.tr(),
          //     ),
          //
          //   ],
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
              child: Image.asset('assets/images/info-1.png')),
          AppText(
            title: 'Delivery type'.tr(),
            color: AppColors.secondary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.symmetric(vertical: 8),
          ),

          // Row(
          //   children: [
          //     Expanded(
          //       child: DeliveryCard(
          //         index: 0,
          //         price: '400',
          //         deliveryType: 'Super delivery (same day)'.tr(),
          //         onTap: cubit.toggleTabDelivery,
          //       )
          //     ),
          //     Expanded(
          //         child: DeliveryCard(
          //           index: 1,
          //           price: '200',
          //           deliveryType: 'Fast delivery (5-10) days'.tr(),
          //           onTap: cubit.toggleTabDelivery,
          //         )
          //     ),
          //   ],
          // )


        ],
      ),
    );
  }
}
