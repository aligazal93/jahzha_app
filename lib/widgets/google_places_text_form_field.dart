import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';

import 'app_text.dart';

class GooglePlacesTextFormField extends StatefulWidget {
  const GooglePlacesTextFormField({
    Key? key,
    this.label,
    this.fillColor = Colors.transparent,
    this.onSelected,
    this.countries,
    this.placeType = PlaceType.geocode,
    this.controller,
  }) : super(key: key);

  final String? label;
  final Color fillColor;
  final void Function(Prediction value)? onSelected;
  final List<String>? countries;
  final PlaceType placeType;
  final TextEditingController? controller;

  @override
  State<GooglePlacesTextFormField> createState() =>
      _GooglePlacesTextFormFieldState();
}

class _GooglePlacesTextFormFieldState extends State<GooglePlacesTextFormField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(bottom: 12.height, right: 8, left: 8),
            child: AppText(
              fontSize: 14,
              title: widget.label!,
              color: AppColors.secondary.theme,
              fontWeight: FontWeight.w500,
            ),
          ),
        GooglePlaceAutoCompleteTextField(
          textEditingController: controller,
          googleAPIKey: Utils.mapAPIKey,
          countries: widget.countries,
          showError: false,
          itemClick: (Prediction prediction) {
            if (prediction.description != null) {
              controller.text = prediction.description!;
              controller.selection = TextSelection.fromPosition(
                TextPosition(
                  offset: prediction.description!.length,
                ),
              );
              widget.onSelected?.call(prediction);
            }
          },
          itemBuilder: (context, index, Prediction prediction) {
            return Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 6),
                  Expanded(
                    child: AppText(
                      title: "${prediction.description ?? ""}",
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: widget.fillColor,
              ),
            );
          },
          seperatedBuilder: Container(
            width: double.infinity,
            height: 1,
            color: AppColors.darkGrayBlue,
          ),
          debounceTime: 1200,
          isLatLngRequired: true,
          isCrossBtnShown: true,
          placeType: widget.placeType,
          language: context.locale.languageCode,
          boxDecoration: BoxDecoration(),
          inputDecoration: InputDecoration(
            filled: true,
            fillColor: widget.fillColor,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.width, vertical: 19.height),
            border: _border(AppColors.darkGrayBlue),
            enabledBorder: _border(AppColors.darkGrayBlue),
            focusedBorder: _border(AppColors.primary, width: 1),
            errorBorder: _border(AppColors.red),
            focusedErrorBorder: _border(AppColors.secondary.theme, width: 1),
          ),
        ),
      ],
    );
  }


  InputBorder _border(Color color, {double width = 0.5}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }

  double get _radius => 14;
}
