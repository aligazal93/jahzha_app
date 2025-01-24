import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/models/shipping/shipping_drop_down_item.dart';
import 'package:world_zipcode_validator/world_zipcode_validator.dart';

class ShippingInput {
  final controller = TextEditingController();
  final String name;
  final String? icon;
  final bool enableDropDownSearch;
  final ShippingInputType type;
  final ShippingValidation validation;
  String? phoneCode;
  ShippingDropDownItem? selectedValue;
  Prediction? selectedPrediction;

  /// For Getting DropDownItems
  final String? id;

  /// For sending data to api
  final String requestKey;

  /// For only displaying under field
  final String? note;

  /// required if type is read_only
  final String? defaultValue;
  final List<String> inputLang;

  ShippingInput({
    required this.id,
    required this.name,
    required this.icon,
    required this.requestKey,
    required this.note,
    required this.defaultValue,
    required this.enableDropDownSearch,
    required this.type,
    required this.validation,
    required this.inputLang,
  });

  factory ShippingInput.fromJson(Map<String, dynamic> json) {
    final input = ShippingInput(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      requestKey: json['request_name'],
      note: json['input_note'],
      defaultValue: json['value']?.toString(),
      enableDropDownSearch: json['using_search'] ?? false,
      inputLang: List.from((json['input_lang'] ?? ['ar', 'en'])),
      validation: ShippingValidation.fromJson(json['validation']),
      type: ShippingInputType.values.firstWhere(
            (e) => e.id == json['type'],
        orElse: () => ShippingInputType.textField,
      ),
    );
    input.controller.text = json['value']?.toString() ?? '';
    return input;
  }

  String? validate([String? countryCode]) {
    final value = controller.text.trim();
    if (validation.required || value.isNotEmpty) {
      final type = validation.type;
      final languageValidation = Validator.language(value: value, lang: inputLang.first);
      final emailValidation = Validator.email(value);
      final phoneValidation = Validator.phone(value);
      if (value.isEmpty) {
        return 'required'.tr();
      } else if ((this.type == ShippingInputType.textField || this.type == ShippingInputType.textFieldArea)
          && inputLang.length == 1
          && languageValidation != null) {
        return languageValidation;
      } else if (validation.minLength != null && value.length < validation.minLength!) {
        return 'min_length_is'.tr() + ' ${validation.minLength}';
      } else if (validation.maxLength != null && value.length > validation.maxLength!) {
        return 'max_length_is'.tr() + ' ${validation.maxLength}';
      } else if (type == ShippingInputValidationType.email && emailValidation != null) {
        return emailValidation;
      } else if (type == ShippingInputValidationType.number && num.tryParse(value) == null) {
        return 'invalid_number'.tr();
      } else if (type == ShippingInputValidationType.double && double.tryParse(value) == null) {
        return 'invalid_number'.tr();
      } else if (type == ShippingInputValidationType.phone && phoneValidation != null) {
        return phoneValidation;
      } else if (type == ShippingInputValidationType.postalCode &&
          !WorldZipcodeValidator.isValid(
              countryCode?.toLowerCase() ?? 'sa', value)) {
        return 'invalid_postal_code'.tr();
      } else if (this.type == ShippingInputType.map && selectedPrediction == null) {
        return 'required'.tr();
      }
    }
    return null;
  }

  ShippingInput copy() {
    return ShippingInput(
      id: id,
      name: name,
      requestKey: requestKey,
      note: note,
      defaultValue: defaultValue,
      enableDropDownSearch: enableDropDownSearch,
      type: type,
      validation: validation,
      inputLang: inputLang,
      icon: icon,
    );
  }

  Map<String, dynamic> toJson({required String replaceAsteriskWith}) {
    return {
      '${requestKey.replaceFirst('*', replaceAsteriskWith)}': type == ShippingInputType.dropdown
          ? selectedValue!.id
          : controller.text.trim(),
      if (requestKey.contains('phone'))
        '${requestKey.replaceFirst('[phone]', '')}[dial_code]':
            phoneCode?.replaceFirst('+', ''),
      if (type == ShippingInputType.map)
        ...{
          requestKey: selectedPrediction!.description,
          requestKey.replaceFirst('[street]', '[careem_location][lat]'): selectedPrediction!.lat,
          requestKey.replaceFirst('[street]', '[careem_location][lng]'): selectedPrediction!.lng,
        },
    };
  }
}

class ShippingValidation {
  final bool required;
  final ShippingInputValidationType? type;
  // final double? minDouble;
  // final double? maxDouble;
  final int? minLength;
  final int? maxLength;
  final double? maxMapRadiusInKM;

  ShippingValidation({
    required this.required,
    required this.type,
    required this.minLength,
    required this.maxLength,
    required this.maxMapRadiusInKM,
  });

  factory ShippingValidation.fromJson(Map<String, dynamic> json) {
    return ShippingValidation(
      required: json['required'] ?? false,
      type: ShippingInputValidationType.values.firstWhere(
        (e) => e.id == json['validation_type'],
        orElse: () => ShippingInputValidationType.byLength,
      ),
      minLength: int.tryParse(json['min_length'].toString()),
      maxLength: int.tryParse(json['max_length'].toString()),
      // minDouble: json['min_float'],
      // maxDouble: json['max_float'],
      maxMapRadiusInKM: double.tryParse(json['max_radius'].toString()),
    );
  }

  TextInputType get inputType {
    if (type == ShippingInputValidationType.number) {
      return TextInputType.numberWithOptions();
    } else if (type == ShippingInputValidationType.phone) {
      return TextInputType.numberWithOptions();
    } else if (type == ShippingInputValidationType.email) {
      return TextInputType.emailAddress;
    } else if (type == ShippingInputValidationType.double) {
      return TextInputType.numberWithOptions(decimal: true);
    }
    return TextInputType.text;
  }
}

enum ShippingInputType {
  textField('input'),
  dropdown('select'),
  readOnlyField('read_only'),
  radio('radios'),
  googlePlacesField('google_places_field'),
  map('map'),
  textFieldArea('textarea');

  const ShippingInputType(this.id);

  final String id;
}

enum ShippingInputValidationType {
  email('email'),
  number('number'),
  double('float'),
  phone('phone'),
  postalCode('postal_code'),
  byLength('byLength');

  const ShippingInputValidationType(this.id);

  final String id;
}

/*
{
                "id": "SPL_CITIES", //nullable to get dropdown items
                "name": "اسم المرسل",
                "request_name": "shipper[name]",
                "validation": {
                    "required": true, //default false
                    "input_type": "string" //string, email, int, radio, null
                    "validation_type": "postal_code" //nullable
                    "min_length": 10, //nullable
                    "max_length": 50 //nullable
                    "max_radius": 15 //nullable
                },
                "type": "input", //input, select, map, read_only, radios, textarea
                "input_note": "", //nullable
                "value": "Riyadh" // required if type is read_only
                "using_search": false, // default false
            },
 */
