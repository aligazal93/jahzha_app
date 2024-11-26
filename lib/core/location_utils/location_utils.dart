// import 'package:dio/dio.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:jahzha_app/core/helpers/dimensions.dart';
// import '../../widgets/app_button.dart';
// import '../../widgets/app_dialog.dart';
// import '../../widgets/app_text.dart';
// import '../helpers/utils.dart';
// import '../route_utils/route_utils.dart';
//
// class LocationUtils {
//   static LatLng currentLocation = Utils.defaultLatLng;
//
//   // static bool _isInitialized = false;
//   //
//   // static Future<void> init() async {
//   //   if (_isInitialized) {
//   //     return;
//   //   }
//   //   await updateDriverLocation();
//   //   Geolocator.getPositionStream(
//   //     locationSettings: LocationSettings(
//   //       accuracy: LocationAccuracy.bestForNavigation,
//   //       distanceFilter: 1000,
//   //     ),
//   //   ).listen((event) => updateDriverLocation());
//   //   _isInitialized = true;
//   // }
//
//   static Stream<Position> getCurrentLocationStream() {
//     return Geolocator.getPositionStream(
//       locationSettings: LocationSettings(
//         accuracy: LocationAccuracy.bestForNavigation,
//         distanceFilter: 1000,
//       ),
//     );
//   }
//
//   static Future<String> getCityByLatLng({required double latitude,required double longitude, String divider = ' - '})async{
//     String location = "";
//     final String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=${Utils.MAP_API_KEY}&language=${RouteUtils.context.locale.languageCode}';
//     final response = await Dio().post(url);
//     print(response.data);
//     if(response.statusCode == 200){
//       final data = response.data;
//       final result = data['results'][0]['address_components'] as List;
//       int counter = 0;
//       for (var i in result) {
//         if (i['types'].join("").contains("administrative_area_level_1") || i['types'].join("").contains("administrative_area_level_2") || i['types'].join("").contains("sublocality_level_1")) {
//           if (counter < 2) {
//             location =  i['long_name'] + (location.isNotEmpty ? divider : '') + location;
//           }
//           counter++;
//         }
//       }
//       // location = result[1]['short_name'] ?? '';
//       // location = location! + (location.isNotEmpty ? '\n' : '') + result[2]['short_name'];
//       return location;
//     }else
//       throw Exception('Cannot get City by LatLng');
//   }
//
//
//   static Future<LatLng> getCurrentLocation() async {
//     LocationPermission status = await Geolocator.requestPermission();
//     while (!_isLocationDetermined(status)) {
//       await AppDialog.show(
//         dismissible: false,
//         child: Column(
//           children: [
//             AppText(
//               title: "location_can_not_be_determined".tr(),
//               fontWeight: FontWeight.w700,
//               fontSize: 18,
//               textAlign: TextAlign.center,
//             ),
//             Center(
//               child: AppText(
//                 padding: EdgeInsets.symmetric(vertical: 12.height),
//                 title: "enable_location_and_try_again".tr(),
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             AppButton(
//               title: 'enable'.tr(),
//               onTap: () async {
//                 LocationPermission status =
//                     await Geolocator.requestPermission();
//                 if (_isLocationDetermined(status)) {
//                   Navigator.pop(RouteUtils.context);
//                   return;
//                 }
//                 Geolocator.openLocationSettings();
//               },
//             ),
//           ],
//         ), title: '',
//       );
//       status = await Geolocator.requestPermission();
//     }
//     final position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.bestForNavigation,
//     );
//     currentLocation = LatLng(position.latitude, position.longitude);
//     return currentLocation;
//   }
//
//   static bool _isLocationDetermined(LocationPermission status) {
//     return status == LocationPermission.always ||
//         status == LocationPermission.whileInUse;
//   }
//
//   static Future<String> getAddressFromLatLng(LatLng value, double longitude) async {
//     try {
//       List<Placemark> placeMarks = await placemarkFromCoordinates(value.latitude, value.longitude);
//       return "${placeMarks.first.street}, ${placeMarks.first.subLocality}, ${placeMarks.first.administrativeArea}, ${placeMarks.first.country}";
//     } catch (e) {
//       handleGenericException(e);
//     }
//     return '';
//   }
//
//   // static Future<Set<Polyline>> getPolyline(LatLng from,LatLng to) async {
//   //   List<LatLng> polylineCoordinates = [];
//   //   Polyline? polyline;
//   //   PolylineResult result = await PolylinePoints().getRouteBetweenCoordinates(
//   //     Utils.googleAPIKey,
//   //     PointLatLng(from.latitude, from.longitude),
//   //     PointLatLng(to.latitude, to.longitude),
//   //     travelMode: TravelMode.driving,
//   //   );
//   //   if (result.points.isNotEmpty) {
//   //     result.points.forEach((PointLatLng point) {
//   //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//   //     });
//   //     polyline = Polyline(
//   //       polylineId: PolylineId("${from.latitude}, ${from.longitude} - ${to.latitude}, ${to.longitude}"),
//   //       color: AppColors.orange,
//   //       points: polylineCoordinates,
//   //       width: 3,
//   //     );
//   //     return {polyline};
//   //   }
//   //   return {};
//   // }
//
//   static Future<BitmapDescriptor> getMarkerIcon({String image = 'marker_dot'}) {
//     return BitmapDescriptor.fromAssetImage(ImageConfiguration(), Utils.getAssetPNGPath(image));
//   }
// }
