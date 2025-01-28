import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/views/jahzha_company/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class JahzhaForCompaniesView extends StatelessWidget {
  const JahzhaForCompaniesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CompanyRequestsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Jahzha for businesses'.tr(),
        ),
        body: BlocBuilder<CompanyRequestsCubit, CompanyRequestsStates>(
          builder: (context, state) {
            final cubit = CompanyRequestsCubit.of(context);
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                AppText(
                  title: 'Do you have more than one shipment? You can contact us to get a price quote that suits you'.tr(),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 25,
                  color: AppColors.txtGray,
                ),
                SizedBox(
                  height: 12,
                ),
                Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        label: 'first name'.tr(),
                        fillColor: AppColors.tGray,
                        onSaved: (v) => cubit.firstName = v,
                        validator: Validator.name,
                      ),
                      AppTextField(
                        label: 'last name'.tr(),
                        fillColor: AppColors.tGray,
                        onSaved: (v) => cubit.lastName = v,
                        validator: Validator.name,
                      ),
                      AppTextField(
                        label: 'email'.tr(),
                        inputType: TextInputType.emailAddress,
                        fillColor: AppColors.tGray,
                        onSaved: (v) => cubit.email = v,
                        validator: Validator.email,
                      ),
                      AppTextField(
                        label: 'mobile number'.tr(),
                        fillColor: AppColors.tGray,
                        inputType: TextInputType.number,
                        onSaved: (v) => cubit.mobile = v,
                        validator: Validator.phone,
                      ),
                      AppTextField(
                        label: 'country'.tr(),
                        fillColor: AppColors.tGray,
                        onSaved: (v) => cubit.country = v,
                        validator: Validator.name,
                      ),
                      AppDropDownMenu(
                        label: 'shipment type'.tr(),
                        fillColor: AppColors.tGray,
                        hint: 'shipment type'.tr(),
                        validator: (v) => Validator.empty(v),
                        onChange: (v) => cubit.shipmentType = v,
                        modeling: true,
                        items: ShipmentType.values.map((e) => e).toList(),
                        value: cubit.shipmentType,
                      ),
                      AppTextField(
                        label: 'company Name'.tr(),
                        fillColor: AppColors.tGray,
                        onSaved: (v) => cubit.companyName = v,
                        validator: Validator.name,
                      ),
                      AppTextField(
                        label: 'average shipments per month'.tr(),
                        fillColor: AppColors.tGray,
                        inputType: TextInputType.number,
                        onSaved: (v) => cubit.averageShipmentsPerMonth = v,
                        validator: Validator.empty,
                      ),
                      AppTextField(
                        label: 'average shipment weight'.tr(),
                        fillColor: AppColors.tGray,
                        inputType: TextInputType.number,
                        onSaved: (v) => cubit.averageShipmentWeight = v,
                        validator: Validator.empty,
                      ),
                      AppTextField(
                        label: 'goods type'.tr(),
                        fillColor: AppColors.tGray,
                        inputType: TextInputType.name,
                        onSaved: (v) => cubit.goodsType = v,
                        validator: Validator.empty,
                      ),
                      AppTextField(
                        label: 'average dimensions per shipment'.tr(),
                        fillColor: AppColors.tGray,
                        inputType: TextInputType.number,
                        onSaved: (v) => cubit.averageDimensionsPerShipment = v,
                        validator: Validator.empty,
                      ),
                      AppText(
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                        title: 'upload File (PDF)'.tr(),
                        color: AppColors.secondary,
                        fontSize: 16,
                        textAlign: TextAlign.right,
                      ),
                      InkWell(
                        onTap: cubit.selectMedicalHistory,
                        child: Container(margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.tGray,
                              border: Border.all(color: AppColors.tGray)),
                          child: Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.upload,
                                color: AppColors.txtGray,
                                size: 20,
                              ),
                              SizedBox(width: 10,),
                              AppText(
                                title: 'Upload File'.tr(),
                                fontSize: 16,
                                color: AppColors.txtGray,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (cubit.file != null)
                      Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                children: [
                                  AppText(
                                    title: 'recent uploaded'.toUpperCase().tr(),
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.secondary,
                                ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                 Icon(FontAwesomeIcons.filePdf,color: AppColors.white,),
                                  Expanded(
                                    child: AppText(
                                      textAlign: TextAlign.left,
                                      title:Utils.getFileNameFromURL(cubit.file?.path  ?? '' , "/"),
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w700,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  if (cubit.file != null)
                                    InkWell(
                                        onTap: () => cubit.removeFile(),
                                        child:Icon(FontAwesomeIcons.trashCan,color: AppColors.red,)
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      AppButton(
                        title: 'Get a quote'.tr(),
                        color: AppColors.primary,
                        constrainedAxis: Axis.horizontal,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        isLoading: state is CompanyRequestsLoading ? true : false,
                        titleFontSize: 14,
                        onTap: cubit.sendCompanyRequest
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

}
