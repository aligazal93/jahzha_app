import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeField extends StatelessWidget {
  final void Function(String?)? onSave;
  final void Function(String) onChanged;

  PinCodeField({this.onSave, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:10.width),
      child: Column(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: PinCodeTextField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'empty_field'.tr();
                } else if (value.length != 4) {
                  return "otp_code_validation".tr();
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.disabled,
              cursorColor: AppColors.primary,
              autoDisposeControllers: true,
              autoDismissKeyboard: true,
              enablePinAutofill: true,
              keyboardType: TextInputType.number,
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
              pastedTextStyle: const TextStyle(color: AppColors.primary),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                selectedColor: AppColors.primary,
                fieldWidth: 60,
                fieldHeight: 60,
                borderRadius: BorderRadius.circular(8),
                activeColor: AppColors.primary,
                inactiveColor: AppColors.tGray,
                activeFillColor: Colors.transparent,
                inactiveFillColor: AppColors.tGray,
                selectedFillColor: AppColors.primary,
                selectedBorderWidth: 1,
                disabledBorderWidth: 1,
                inactiveBorderWidth: 1,
                activeBorderWidth: 1,
                errorBorderWidth: 1,
                borderWidth: 1,
              ),
              enableActiveFill: true,
              appContext: context,
              length: 4,
              onSaved: onSave,
              onChanged: onChanged,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ],
      ),
    );
  }
}
