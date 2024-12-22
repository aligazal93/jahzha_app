import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/cubit.dart';
import 'package:jahzha_app/views/otp/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
class ViaEmailForm extends StatelessWidget {
  const ViaEmailForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthStates>(
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
              title: 'Enter your Email Address to create an account or log in.'.tr(),
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              color: AppColors.txtGray,
              fontSize: 14,
            ),
            AppTextField(
              fillColor: AppColors.tGray,
              vMargin: 20,
              hint: 'Enter Email Address'.tr(),
              validator: Validator.email,
              inputType: TextInputType.emailAddress,
              suffixIcon: Icon(FontAwesomeIcons.envelope,color: AppColors.primary,),
              onSaved: (v) => cubit.email = v,
            ),
            AppButton(
              title: 'Continue'.tr(),
              color: AppColors.primary,
              isLoading: state is AuthLoading ? true : false,
              constrainedAxis: Axis.horizontal,
              margin: EdgeInsets.symmetric(vertical: 12),
              onTap: () {
                cubit.loginByEmail();
                // RouteUtils.navigateAndPopAll(OtpView());
              },
            ),
            AppText(
              title: 'It will provide a message to the input number on the code to continue... Make sure your number is correct.'.tr(),
              textAlign: TextAlign.center,
              fontSize: 14,
              height: 25,
              color: AppColors.txtGray,
              padding: EdgeInsets.symmetric(vertical: 18,horizontal: 12),
            ),
          ],
        );
      },
    );
  }
}
