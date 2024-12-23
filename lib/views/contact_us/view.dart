import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/views/contact_us/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'call us'.tr(),
        ),
        body: BlocBuilder<ContactUsCubit,ContactUsStates>(
          builder: (context, state) {
            final cubit = ContactUsCubit.of(context);
            return Form(
              key: cubit.formKey,
              child: ListView(
                padding: EdgeInsets.all(14),
                children: [
                  Image.asset('assets/images/contact.png',height: 70,),
                  AppText(
                    title: 'If you have any questions or suggestions, do not hesitate to contact us'.tr(),
                    color: AppColors.secondary,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    textAlign: TextAlign.center,
                  ),
                  AppTextField(
                    label: 'full name'.tr(),
                    fillColor: AppColors.whiteBk,
                    onSaved: (v) => cubit.fullName = v,
                    validator: Validator.name,
                  ),
                  AppTextField(
                    label: 'Email Address'.tr(),
                    fillColor: AppColors.whiteBk,
                    onSaved: (v) => cubit.email = v,
                    validator: Validator.email,
                  ),
                  AppTextField(
                    inputType: TextInputType.number,
                    fillColor: AppColors.whiteBk,
                    label: 'mobile number'.tr(),
                    onSaved: (v) => cubit.phone = v,
                    maxLength: 10,
                    validator: Validator.phone,
                  ),
                  AppTextField(
                    label: 'message'.tr(),
                    fillColor: AppColors.whiteBk,
                    onSaved: (v) => cubit.message = v,
                    validator: Validator.empty,
                    maxLines: 5,
                  ),
                  AppButton(
                    title: 'send'.tr(),
                    color: AppColors.primary,
                    constrainedAxis: Axis.horizontal,
                    onTap: cubit.contactUs,
                    isLoading: state is ContactUsLoading ? true : false,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
