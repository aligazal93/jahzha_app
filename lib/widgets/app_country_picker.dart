import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';

import '../core/helpers/app_colors.dart';
import 'app_text.dart';

class AppCountryPicker extends StatelessWidget {
  const AppCountryPicker({
    Key? key,
    this.initialPhoneCode = '+966',
    required this.onSelect,
  }) : super(key: key);

  final String initialPhoneCode;
  final Function(String country, String code) onSelect;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedDirectional(
          end: 4.width,
          bottom: 0,
          top: 0,
          child: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.primary,
            size: 24,
          ),
        ),
        CountryCodePicker(
          initialSelection: CountryCode.fromDialCode(initialPhoneCode).code,
          hideMainText: true,
          onChanged: (value) => onSelect(value.code!, value.dialCode!),
          flagDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          dialogSize: Size(
            MediaQuery.of(context).size.width - 40.width,
            MediaQuery.of(context).size.height / 2,
          ),
          closeIcon: Icon(
            FontAwesomeIcons.xmark,
            color: AppColors.secondary.theme,
            size: 20.width,
          ),
          searchPadding: EdgeInsets.fromLTRB(
            16.width,
            6.height,
            16.width,
            12.height,
          ),
          searchDecoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            hintStyle: TextStyle(
              color: AppColors.secondary.theme,
              fontSize: 14.font,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.width,
              vertical: 6.height,
            ),
            prefixIconColor: AppColors.primary,
            border: _border(
              AppColors.darkGrayBlue,
              radius: _searchRadius,
            ),
            enabledBorder: _border(
              AppColors. darkGrayBlue,
              radius: _searchRadius,
            ),
            focusedBorder: _border(
              AppColors.primary,
              width: 1,
              radius: _searchRadius,
            ),
            errorBorder: _border(
              AppColors.red,
              radius: _searchRadius,
            ),
            focusedErrorBorder: _border(
              AppColors.primary,
              width: 1,
              radius: _searchRadius,
            ),
          ),
          flagWidth: 40.width,
          padding: EdgeInsets.zero,
          margin: EdgeInsetsDirectional.only(
            end: 24.width,
            start: 8.width,
          ),
          barrierColor: AppColors.black.withOpacity(0.8),
          dialogItemPadding: EdgeInsets.symmetric(
            vertical: 8.height,
            horizontal: 12.width
          ),
          emptySearchBuilder: (context) => Center(
            child: AppText(
              padding: EdgeInsets.only(top: 24.height),
              title: 'no_results_found'.tr(),
            ),
          ),
          dialogTextStyle: TextStyle(
            fontSize: 12.font,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  InputBorder _border(Color color, {double? radius, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 16.radius),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _searchRadius => 10.radius;
}
