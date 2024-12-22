import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/cubit.dart';
import 'package:jahzha_app/views/otp/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
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
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      child: AppTextField(
                        fillColor: AppColors.tGray,
                        hint: '5xxxxxxxx',
                        textAlign: TextAlign.left,
                        inputType: TextInputType.number,
                        onSaved: (v) => cubit.phone = v,
                        validator: Validator.phone,
                        // TODO 9 NUMBER -- Not 10
                        maxLength: 10,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                        width: 70,
                        height: 60,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            border: Border.all(
                              color: AppColors.darkGrayBlue,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: AppText(
                            title: '966+',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                ],
              ),
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
