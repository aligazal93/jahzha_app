// import 'dart:developer';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// import '../caching_utils/caching_utils.dart';
// import '../helpers/utils.dart';
//
// class NetworkUtils {
//   static final String _baseUrl = "https://hasalt.com.sa/api/";
//
//   static late Dio _dio;
//
//   static String get baseURL => _baseUrl.replaceAll('/api/', '');
//
//   static Future<void> init() async {
//     if (kDebugMode) {
//       HttpOverrides.global = _MyHttpOverrides();
//     }
//     _dio = Dio()..options.baseUrl = _baseUrl;
//     _dio.options.validateStatus = (status) => true;
//   }
//
//   static Future<Response<dynamic>> get(String path, {Map<String, dynamic>? headers, Map<String, dynamic>? queryParams}) async {
//     _setHeaders(headers: headers);
//     final response = await _dio.get(path, queryParameters: queryParams);
//     _logResponse(response);
//     return response;
//   }
//
//   static Future<Response<dynamic>> post(String path, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? headers}) async {
//     _setHeaders(headers: headers);
//     final response = await _dio.post(path, data: formData ?? data);
//     _logResponse(response);
//     return response;
//   }
//
//   static Future<Response<dynamic>> patch(String path, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? headers}) async {
//     _setHeaders(headers: headers);
//     final response = await _dio.patch(path, data: formData ?? data);
//     _logResponse(response);
//     return response;
//   }
//
//   static Future<Response<dynamic>> delete(String path, {Map<String, dynamic>? data, FormData? formData, Map<String, dynamic>? headers}) async {
//     _setHeaders(headers: headers);
//     final response = await _dio.delete(path, data: formData ?? data);
//     _logResponse(response);
//     return response;
//   }
//
//   static void _setHeaders({required Map<String, dynamic>? headers}) {
//     _dio.options.headers = {
//       if(CachingUtils.isLogged)
//         'ApiToken': "Bearer " + (CachingUtils.token ?? ''),
//         'Api-Secure-Key' :  "\$2y\$12\$N2zFrcVOTIzwCxF4Y0CPseAhdi3hs12Hg3w41zvM.sz/p6asveIh.",
//         'App-Language' : Utils.isAR ?  'sa' : 'en'
//     };
//     if (headers != null) {
//       _dio.options.headers.addAll(headers);
//     }
//   }
//
//   static void _logResponse(Response response) {
//     if (!kDebugMode) {
//       return;
//     }
//     log('='*100);
//     log('Path : ${response.requestOptions.baseUrl + response.requestOptions.path}');
//     log('-'*100);
//     log('Headers : ${response.requestOptions.headers}');
//     log('-'*100);
//     log('Body : ${response.requestOptions.data}');
//     log('-'*100);
//     log('Response : ${response.data}');
//     log('='*100);
//   }
// }
//
// class _MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }