import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/auth/login/cubit.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class ViaMobileForm extends StatelessWidget {
  const ViaMobileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthStates>(
      builder: (context, state) {
        final cubit = AuthCubit.of(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              title: 'Hey, you !'.tr(),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
            AppText(
              title: 'Enter your mobile number to create an account or log in.'
                  .tr(),
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: AppColors.txtGray,
              fontSize: 14,
            ),
            AppTextField(
              suffixIcon: Utils.isAR ? Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: '+966',
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
              ) : null,
              prefixIcon: !Utils.isAR ? Padding(
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      title: '+966',
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
              ) : null,
              fillColor: AppColors.tGray,
              hint: '5XXXXXXXXX',
              textAlign: TextAlign.left,
              inputType: TextInputType.number,
              onSaved: (v) => cubit.phone = v,
              validator: Validator.phone,
              maxLength: 9,
            ),
            AppButton(
                title: 'Continue'.tr(),
                color: AppColors.primary,
                constrainedAxis: Axis.horizontal,
                isLoading: state is AuthLoading ? true : false,
                margin: EdgeInsets.symmetric(vertical: 12),
                onTap: () {
                  cubit.loginByPhone();
                },
            ),
            AppText(
              title:
                  'It will provide a message to the input number on the code to continue... Make sure your number is correct.'
                      .tr(),
              textAlign: TextAlign.center,
              fontSize: 14,
              height: 25,
              color: AppColors.txtGray,
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            ),
          ],
        );
      },
    );
  }
}
