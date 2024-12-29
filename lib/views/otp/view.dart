import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/otp/cubit.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/pin_code_field.dart';
part 'units/resend_code_section.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key, required this.userId,  this.phone, this.email}) : super(key: key);
  final int userId;
  final String? phone;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(userId),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 100,horizontal: 22),
          child: BlocBuilder<OtpCubit,OtpStates>(
            builder: (context, state) {
              final cubit = OtpCubit.of(context);
              return ListView(
                children: [
                  SizedBox(height: 100,),
                  AppText(
                    title: 'Please enter the code to continue'.tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.secondary,
                    textAlign: TextAlign.center,
                  ),
                  AppText(
                    title: 'We have sent the code by message to the following number'.tr(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtGray,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      phone == null ? SizedBox() :
                      AppText(
                        title: phone ?? '',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                        textAlign: TextAlign.center,
                      ),
                      email == null ? SizedBox() :
                      AppText(
                        title: email ?? '',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () => RouteUtils.pop(),
                        child: AppText(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          title: 'Change'.tr(),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 22,),
                  PinCodeField(
                    onChanged: (v) => cubit.code = v,
                  ),
                  AppButton(
                    title: 'Verification'.tr(),
                    color: AppColors.primary,
                    constrainedAxis: Axis.horizontal,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    onTap: cubit.verifyCode,
                    isLoading: state is OtpLoading ? true : false,
                  ),
                  AppText(
                    title: 'Have Not received the message yet?'.tr(),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.txtGray,
                    textAlign: TextAlign.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  InkWell(
                    onTap: cubit.resetVerifyCode,
                    child: AppText(
                      title: 'Resend'.tr(),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      textAlign: TextAlign.center,
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                  _ResendCodeSection(),
                ],
              );
            },
          ),
        ),

      ),
    );
  }
}
