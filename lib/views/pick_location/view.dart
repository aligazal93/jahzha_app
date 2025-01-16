// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import '../../core/helpers/utils.dart';
// import '../../core/route_utils/route_utils.dart';
// import '../../widgets/app_text.dart';
// import '../../widgets/basic_card_decoration.dart';
//
// class PickLocationView extends StatefulWidget {
//   const PickLocationView({
//     Key? key,
//     this.value,
//     this.onSubmit,
//   }) : super(key: key);
//
//   final PickedLocation? value;
//   final void Function(PickedLocation v)? onSubmit;
//
//   Future<void> show() {
//     return RouteUtils.navigateTo(this);
//   }
//
//   @override
//   State<PickLocationView> createState() => _PickLocationViewState();
// }
//
// class _PickLocationViewState extends State<PickLocationView> {
//   GoogleMapController? googleMapController;
//   final txController = TextEditingController();
//   LatLng? initialLocation;
//   LatLng? location;
//
//   @override
//   void initState() {
//     LocationUtils.getCurrentLocation().then((value) {
//       initialLocation = widget.value?.location ?? value;
//       onLocationSelected(initialLocation!);
//       if (widget.value?.address != null) {
//         txController.text = widget.value!.address ?? '';
//       }
//     });
//     super.initState();
//   }
//
//   void onLocationSelected(LatLng v) {
//     location = v;
//     setState(() {});
//   }
//
//   @override
//   void dispose() {
//     txController.dispose();
//     googleMapController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (initialLocation == null) {
//       return Scaffold(
//         appBar: _appBar(),
//         body: AppLoadingIndicator(),
//       );
//     }
//     return Scaffold(
//       appBar: _appBar(),
//       body: Stack(
//         children: [
//           GoogleMap(
//             markers: {
//               if (widget.onSubmit == null)
//                 Marker(
//                   markerId: const MarkerId('1'),
//                   position: location ?? initialLocation!,
//                   icon: BitmapDescriptor.defaultMarker,
//                 ),
//             },
//             initialCameraPosition: CameraPosition(
//               target: initialLocation!,
//               zoom: LocationUtils.defaultZoom,
//             ),
//             onMapCreated: (v) => setState(() => googleMapController = v),
//             myLocationEnabled: true,
//             zoomControlsEnabled: false,
//             myLocationButtonEnabled: false,
//             onCameraMove: (position) => location = position.target,
//             onCameraIdle: widget.onSubmit == null
//                 ? null
//                 : () => onLocationSelected(location!),
//           ),
//           if (widget.onSubmit != null)
//             Positioned(
//               left: 0,
//               right: 0,
//               top: 0,
//               bottom: 0,
//               child: IgnorePointer(
//                 ignoring: true,
//                 child: UnconstrainedBox(
//                   child: Container(
//                     padding: EdgeInsets.all(32.width),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           Utils.getAssetPNGPath('marker'),
//                           height: 32.width,
//                           width: 32.width,
//                         ),
//                         SizedBox(height: 10.height),
//                         AppText(
//                           title: 'move_map'.tr(),
//                           fontSize: 10.font,
//                           fontWeight: FontWeight.w500,
//                           color: AppColors.primary,
//                         ),
//                       ],
//                     ),
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: AppColors.primary.withValues(
//                         alpha: widget.onSubmit == null ? 0 : 0.15,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           if (googleMapController != null)
//             PositionedDirectional(
//               bottom: 20.height,
//               start: 16.width,
//               child: BasicCard(
//                 radius: 100,
//                 onTap: () async {
//                   final latLng = await LocationUtils.getCurrentLocation();
//                   googleMapController!.animateCamera(CameraUpdate.newLatLngZoom(
//                     latLng,
//                     LocationUtils.defaultZoom,
//                   ));
//                 },
//                 child: Image.asset(
//                   Utils.getAssetPNGPath('gps'),
//                   width: 24.width,
//                   height: 24.width,
//                 ),
//               ),
//             ),
//         ],
//       ),
//       bottomNavigationBar: Builder(
//         builder: (context) {
//           if (widget.onSubmit == null) {
//             return SizedBox();
//           }
//           return BasicCard(
//             child: SafeArea(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // AppTextField(
//                   //   label: 'enter_address'.tr(),
//                   //   hint: 'location'.tr(),
//                   //   controller: txController,
//                   //   trailing: Image.asset(
//                   //     Utils.getAssetPNGPath('marker'),
//                   //     height: 20,
//                   //     width: 20,
//                   //   ),
//                   // ),
//                   // SizedBox(height: 16.height),
//                   AppButton(
//                     title: 'confirm'.tr(),
//                     onTap: () {
//                       // if (txController.text.isEmpty) {
//                       //   showSnackBar(
//                       //     'enter_address'.tr(),
//                       //     type: SnackBarType.error,
//                       //   );
//                       //   return;
//                       // }
//                       widget.onSubmit!(PickedLocation(
//                         location: location,
//                         address: txController.text.isEmpty
//                             ? 'location_has_been_determined'.tr()
//                             : txController.text,
//                       ));
//                       RouteUtils.pop();
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   PreferredSizeWidget _appBar() {
//     return AppAppBar(
//       title: (widget.onSubmit == null ? "location" : 'select_location').tr(),
//     );
//   }
// }
//
// class PickedLocation {
//   final LatLng? location;
//   final String? address;
//
//   PickedLocation({
//     required this.location,
//     required this.address,
//   });
// }
