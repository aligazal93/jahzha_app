import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_dialog.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

part 'states.dart';

class CompanyRequestsCubit extends Cubit<CompanyRequestsStates> {
  CompanyRequestsCubit() : super(CompanyRequestsInit());

  static CompanyRequestsCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();
  String? firstName,
      lastName,
      email,
      mobile,
      country,
      companyName,
      goodsType;
  ShipmentType? shipmentType;
  dynamic averageShipmentsPerMonth,
      averageShipmentWeight,
      averageDimensionsPerShipment;
  File? file;

  bool get isStateLoading {
    return state is CompanyRequestsLoading;
  }

  Future<void> sendCompanyRequest() async {
    formKey.currentState?.save();
    if (formKey.currentState?.validate() == false) return;
    if (file == null) {
      showSnackBar('Select PDF File'.tr(), errorMessage: true);
      return;
    }
    emit(CompanyRequestsLoading());
    final formData = await _convertDataToFormData();
    try {
      final response = await NetworkUtils.post(
        'company-request',
        formData: formData,
      );
      final data = response.data;
      if (data['status_code'] == 200) {
        showSnackBar(data['message']);
        AppDialog.show(
          child: Column(
            children: [
              Icon(
                FontAwesomeIcons.solidCircleCheck,
                size: 120,
                color: AppColors.green,
              ),
              AppText(
                title: 'Your request has been received successfully.'.tr(),
                fontWeight: FontWeight.w700,
                color: AppColors.green,
                padding: EdgeInsets.symmetric(vertical: 20),
                fontSize: 18,
              ),
              AppText(
                title:
                    'You will be contacted as soon as possible to get a quote. Thank you.'
                        .tr(),
                fontSize: 14,
                textAlign: TextAlign.center,
                color: AppColors.green,
                fontWeight: FontWeight.w500,
              ),
              AppButton(
                title: 'Home'.tr(),
                constrainedAxis: Axis.horizontal,
                color: AppColors.primary,
                margin: EdgeInsets.symmetric(vertical: 14),
                onTap: () {
                  RouteUtils.navigateTo(NavBarView());
                },
              )
            ],
          ),
        );
        // RouteUtils.navigateAndPopAll(NavBarView());
      } else {
        showSnackBar(data['message'], errorMessage: true);
      }
    } catch (e) {
      handleGenericException(e);
    }
    emit(CompanyRequestsInit());
  }

  Future<FormData> _convertDataToFormData() async {
    final data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'mobile_number': mobile,
      'country': country,
      'shipment_type': shipmentType!.id,
      'company_name': companyName,
      'average_shipments_per_month': averageShipmentsPerMonth,
      'average_shipment_weight': averageShipmentWeight,
      'goods_type': goodsType,
      'average_dimensions_per_shipment': averageDimensionsPerShipment
    };
    final formData = FormData.fromMap(data);
    if (file != null)
    formData.files
        .addAll({MapEntry('file', await MultipartFile.fromFile(file!.path))});
    return formData;
  }

  void selectMedicalHistory() async {
    final pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: [
        'pdf',
        'PDF',
      ],
    );
    if (pickedFiles == null || pickedFiles.count == 0) {
      return;
    }
    file = File(pickedFiles.files.first.path!);
    emit(CompanyRequestsInit());
  }

  void removeFile() {
    file = null;
    emit(CompanyRequestsInit());
  }
}

enum ShipmentType {
  airFreight('Air_freight'),
  seaShipping('Sea_shipping'),
  landShipping('Land_shipping');

  const ShipmentType(this.id);
  final String id;
  String get name => id.tr();
}
