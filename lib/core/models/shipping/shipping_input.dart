import 'package:collection/collection.dart';

class ShippingInput {
  final String name;
  final bool getDropDownItemsBySearch;
  final bool required;
  final ShippingInputType type;
  final ShippingInputValidationType? validationType;

  /// For Getting DropDownItems
  final String? id;

  /// For sending data to api
  final String requestKey;

  /// For only displaying under field
  final String? note;

  /// required if type is read_only
  final String? defaultValue;

  ShippingInput({
    required this.id,
    required this.name,
    required this.requestKey,
    required this.note,
    required this.defaultValue,
    required this.getDropDownItemsBySearch,
    required this.required,
    required this.type,
    required this.validationType,
  });

  factory ShippingInput.fromJson(Map<String, dynamic> json) {
    return ShippingInput(
      id: json['id'],
      name: json['name'],
      requestKey: json['request_name'],
      note: json['input_note'],
      defaultValue: json['value'],
      getDropDownItemsBySearch: json['using_search'] ?? false,
      required: json['validation']?['required'] ?? false,
      validationType: ShippingInputValidationType.values.firstWhereOrNull(
        (e) => e.id == json['validation']?['validation_type'],
      ),
      type: ShippingInputType.values.firstWhere(
        (e) => e.id == json['type'],
        orElse: () => ShippingInputType.textField,
      ),
    );
  }
}

enum ShippingInputType {
  textField('input'),
  dropdown('select'),
  // map('map'),
  readOnlyField('read_only'),
  radio('radios'),
  textFieldArea('textarea');

  const ShippingInputType(this.id);

  final String id;
}

enum ShippingInputValidationType {
  email('email'),
  number('phone'),
  double('float'),
  phone('phone'),
  postalCode('postal_code'),
  byLength('by_length');

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
