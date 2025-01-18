import 'package:easy_localization/easy_localization.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';

class Validator {
  static String? empty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    }
    return null;
  }

  static String? carNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    } else if (value.length < 3) {
      return "car_number_length_validation".tr();
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_name");
    } else if (value.length < 2 || value.length > 30) {
      return tr("write_correct_name");
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_password");
    } else if (value.length < 6) {
      return tr("password_must_be_at_least_6_char");
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_email");
    } else if (!RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""").hasMatch(value)) {
      return tr("write_correct_email");
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("write_phone");
    }
    final cleanedPhoneNumber = value.replaceAll(RegExp(r'[^0-9]'), '');
    final phonePattern = RegExp(r'^[0-9]{7,15}$');
    if (!phonePattern.hasMatch(cleanedPhoneNumber)) {
      return tr("write_correct_phone");
    }
    return null;
  }

  static String? passwordConfirmation({required String? password, required String? value}) {
    if (value == null || value.trim().isEmpty) {
      return tr("please_confirm_password");
    } else if (value != password) {
      return tr("password_dose_not_match");
    }
    return null;
  }

  static String? iban(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    }
    final RegExp ibanPattern = RegExp(r'^[A-Z]{2}\d{2}[A-Z0-9]{1,30}$');
    if (!ibanPattern.hasMatch(value)) {
      return 'invalid_iban'.tr();
    }
    return null;
  }

  static String? bankAccountNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    }
    final RegExp accountNumberPattern = RegExp(r'^[0-9]{9,20}$');
    if (!accountNumberPattern.hasMatch(value)) {
      return 'invalid_bank_account_number'.tr();
    }
    return null;
  }

  static String? weight(String? value) {
    if (value == null || value.trim().isEmpty) {
      return tr("empty_field");
    } else if (num.tryParse(value) == null) {
      return 'invalid_weight'.tr();
    } else if (num.tryParse(value)! < 1) {
      return 'minimum_weight_must_be_1_kg'.tr();
    }
    return null;
  }

  static String? language({
    required String? value,
    required String lang,
  }) {
    if (value == null || value.isEmpty) {
      return Utils.isAR ? 'مطلوب' : "Required";
    }
    final englishRegex = RegExp('^[a-zA-Z0-9!@#\\\$%\\^&\\*\\(\\)_\\+\\-=\\[\\]\\{\\};:\'",<>\\.\\?/\\\\|`~\\s]*\$');
    final arabicRegex = RegExp('^[\\u0600-\\u06FF\\u0750-\\u077F\\u08A0-\\u08FF0-9!@#\\\$%\\^&\\*\\(\\)_\\+\\-=\\[\\]\\{\\};:\'",<>\\.\\?/\\\\|`~\\s]*\$');
    if (lang == 'en' && englishRegex.hasMatch(value)) {
      return null;
    } else if (lang == 'ar' && arabicRegex.hasMatch(value)) {
      return null;
    } else {
      return Utils.isAR ? "استخدم الحروف ال${lang == 'en' ? 'انجليزية' : 'عربية'} فقط" : 'Use ${lang == 'en' ? 'English' : 'Arabic'} characters only';
    }
  }
}
