import 'package:flutter/services.dart';

abstract class AppTextFieldFormatters {
  AppTextFieldFormatters._();

  static final phone = FilteringTextInputFormatter.digitsOnly;

  static final english = FilteringTextInputFormatter.allow(
    RegExp(r'^[a-zA-Z\s]*$'),
  );

  static final arabic = FilteringTextInputFormatter.allow(
    RegExp(r'^[\u0600-\u06FF\s]*$'),
  );
}
