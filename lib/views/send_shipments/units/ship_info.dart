import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/send_shipments/cubit/cubit.dart';
import 'package:jahzha_app/views/send_shipments/units/box_type.dart';
import 'package:jahzha_app/views/send_shipments/view.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class ShipInfo extends StatelessWidget {
  const ShipInfo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final cubit = SendShipmentCubit.of(context);

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
          Row(
            children: [
              BoxTypeCard(
                index:0,
                onTap: cubit.toggleTab,
                image: 'bike',
                type: 'motorcycle'.tr(),
              ),
              BoxTypeCard(
                index:1,
                image: 'big-car',
                onTap: cubit.toggleTab,
                type: 'Truck'.tr(),
              ),
              BoxTypeCard(
                index:2,
                onTap: cubit.toggleTab,
                image: 'car',
                type: 'small car'.tr(),
              ),

            ],
          ),
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

          Row(
            children: [
              Expanded(
                child: DeliveryCard(
                  index: 0,
                  price: '400',
                  deliveryType: 'Super delivery (same day)'.tr(),
                  onTap: cubit.toggleTabDelivery,
                )
              ),
              Expanded(
                  child: DeliveryCard(
                    index: 1,
                    price: '200',
                    deliveryType: 'Fast delivery (5-10) days'.tr(),
                    onTap: cubit.toggleTabDelivery,
                  )
              ),
            ],
          )


        ],
      ),
    );
  }
}
