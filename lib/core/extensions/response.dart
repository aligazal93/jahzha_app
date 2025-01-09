import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

extension ResponseExtension on Response {
  String get getMessage {
    if (data.runtimeType == String) {
      data = jsonDecode(data);
    }
    if (data.containsKey('errors') && data['errors'].isNotEmpty) {
      var firstErrorField = data['errors'].keys.first;
      var firstErrorMessage = data['errors'][firstErrorField][0];
      return firstErrorMessage;
    }
    return data['message'] ?? data['data']?['message'] ?? data['data']['error'] ?? 'something_went_wrong'.tr();
  }
}