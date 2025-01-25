import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/edit_shipment_receiver/cubit.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';

import '../../core/helpers/app_colors.dart';
import '../../core/helpers/validator.dart';
import '../../widgets/app/app_bar.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_field.dart';

part 'units/payment_methods.dart';

class EditReceiverView extends StatelessWidget {
  const EditReceiverView({
    Key? key,
    required this.shipmentID,
  }) : super(key: key);

  final int shipmentID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditShipmentReceiverCubit(
        shipmentID: shipmentID,
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "edit_receiver_address".tr(),
        ),
        body:
            BlocBuilder<EditShipmentReceiverCubit, EditShipmentReceiverStates>(
          builder: (context, state) {
            final cubit = EditShipmentReceiverCubit.of(context);
            if (cubit.paymentMethods.isNotEmpty) {
              return _PaymentMethods();
            }
            return Form(
              key: cubit.formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                children: [
                  AppTextField(
                    label: "city".tr(),
                    showRequiredSign: true,
                    fillColor: AppColors.whiteBk,
                    validator: Validator.empty,
                    onSaved: (p0) => cubit.city = p0,
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    label: "address".tr(),
                    fillColor: AppColors.whiteBk,
                    showRequiredSign: true,
                    validator: Validator.empty,
                    onSaved: (p0) => cubit.address = p0,
                  ),
                  SizedBox(height: 16),
                  AppTextField(
                    label: "postal_code".tr(),
                    showRequiredSign: true,
                    fillColor: AppColors.whiteBk,
                    validator: Validator.empty,
                    onSaved: (p0) => cubit.postalCode = p0,
                  ),
                  SizedBox(height: 40),
                  AppButton(
                    title: "checkout".tr(),
                    height: 48,
                    constrainedAxis: Axis.horizontal,
                    onTap: cubit.submitEdit,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
