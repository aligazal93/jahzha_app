import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:jahzha_app/views/auth/login/view.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../caching_utils/caching_utils.dart';
import '../helpers/utils.dart';
import '../route_utils/route_utils.dart';

export 'package:dio/dio.dart';
export '/core/extensions/response.dart';
export '/core/helpers/utils.dart';

class NetworkUtils {
  static const String baseUrl = "https://jahzha22.web2html5.com/api/v1/";

  static late Dio _dio;

  static Future<void> init() async {
    _dio = Dio()..options.baseUrl = baseUrl;
    _dio.options.validateStatus = (status) => true;
  }

  static Future<Response<dynamic>> get(
      String path, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParams,
      }) async {
    _setHeaders(headers: headers);
    final response = await _dio.get(path, queryParameters: queryParams);
    _logResponse(response);
    return response;
  }

  static Future<Response<dynamic>> post(
      String path, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? headers,
      }) async {
    _setHeaders(headers: headers);
    final response = await _dio.post(path, data: formData ?? data);
    _logResponse(response);
    return response;
  }

  static Future<Response<dynamic>> patch(
      String path, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? headers,
      }) async {
    _setHeaders(headers: headers);
    final response = await _dio.patch(path, data: formData ?? data);
    _logResponse(response);
    return response;
  }

  static Future<Response<dynamic>> put(
      String path, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? headers,
      }) async {
    _setHeaders(headers: headers);
    final response = await _dio.put(path, data: formData ?? data);
    _logResponse(response);
    return response;
  }

  static Future<Response<dynamic>> delete(
      String path, {
        Map<String, dynamic>? data,
        FormData? formData,
        Map<String, dynamic>? headers,
      }) async {
    _setHeaders(headers: headers);
    final response = await _dio.delete(path, data: formData ?? data);
    _logResponse(response);
    return response;
  }

  static void _setHeaders({required Map<String, dynamic>? headers}) {
    _dio.options.headers = {
      'lang': RouteUtils.context.locale.languageCode,
      'Accept': 'application/json',
      if (CachingUtils.isLogged)
        'API-TOKEN': 'Bearer ${CachingUtils.token}'
    };
    if (headers != null) {
      _dio.options.headers.addAll(headers);
    }
  }

  static void _logResponse(Response response) {
    if (response.statusCode == 401) {
      showSnackBar(
        'session_expired'.tr(),
        errorMessage: true,
      );
      CachingUtils.clearCache();
      RouteUtils.navigateAndPopAll(LoginView());
    }
    if (!kDebugMode) {
      return;
    }
    Utils.log('=' * 100);
    Utils.log(
      '🌐 Path: [${response.requestOptions.method}] ${response.requestOptions.baseUrl + response.requestOptions.path}',
    );
    Utils.log('-' * 100);
    Utils.log('📋 Headers: ${response.requestOptions.headers}');
    Utils.log('-' * 100);
    Utils.log('🛠️ Query Params: ${response.requestOptions.queryParameters}');
    Utils.log('-' * 100);
    _logFormData(response.requestOptions.data);
    Utils.log('-' * 100);
    Utils.log('🛑 Status Code: ${response.statusCode}');
    Utils.log('✅ Response: ${jsonEncode(response.data)}');
    Utils.log('=' * 100);
  }

  static void _logFormData(dynamic data) {
    if (data.runtimeType != FormData) {
      Utils.log('📝 Body: $data');
      return;
    }
    StringBuffer buffer = StringBuffer();
    data.fields.forEach((field) {
      buffer.write(', Field: ${field.key}: ${field.value}');
    });
    data.files.forEach((file) {
      buffer.write(
        ', File: ${file.key}: ${file.value.filename}, ${file.value.length} bytes',
      );
    });
    Utils.log('📝 FormData: $buffer'.replaceFirst(', ', ''));
  }
}