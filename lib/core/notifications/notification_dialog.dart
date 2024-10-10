// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hasalt_app/core/helpers/app_colors.dart';
// import 'package:hasalt_app/core/helpers/utils.dart';
// import 'package:hasalt_app/core/network_utils/network_utils.dart';
// import 'package:hasalt_app/core/route_utils/route_utils.dart';
// import 'package:hasalt_app/views/shared/notifications/view.dart';
// import 'package:hasalt_app/widgets/app_text.dart';
//
//
// bool _isNotificationDialogVisible = false;
//
// showNotificationDialog({
//   required String title,
//   required String body,
// }) {
//   if (_isNotificationDialogVisible) {
//     RouteUtils.pop();
//   }
//   _isNotificationDialogVisible = true;
//   showDialog(
//     context: RouteUtils.context,
//     barrierDismissible: false,
//     barrierColor: Colors.transparent,
//     builder: (context) => _Dialog(
//       title,
//       body,
//     ),
//   );
// }
//
// class _Dialog extends StatefulWidget {
//   final String title, body;
//
//   _Dialog(this.title, this.body);
//
//   @override
//   State<_Dialog> createState() => _DialogState();
// }
//
// class _DialogState extends State<_Dialog> {
//   Timer? timer;
//
//   @override
//   void initState() {
//     FlutterRingtonePlayer.playNotification();
//     timer = Timer(Duration(seconds: 3), () {
//       _isNotificationDialogVisible = false;
//       RouteUtils.pop();
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     _isNotificationDialogVisible = false;
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         _isNotificationDialogVisible = false;
//         RouteUtils.pop();
//         RouteUtils.navigateTo(NotificationsView());
//       },
//       onVerticalDragEnd: (details) => RouteUtils.pop(),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             margin: EdgeInsets.fromLTRB(16, Utils.topDevicePadding + 20, 16, 0),
//             width: Utils.sizeFromWidth(1),
//             padding: const EdgeInsets.all(12.0),
//             child: Material(
//               color: Colors.transparent,
//               child: Row(
//                 children: [
//                   Icon(
//                     FontAwesomeIcons.solidBell,
//                     color: AppColors.white.theme,
//                   ),
//                   SizedBox(width: 12),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         AppText(
//                           title: widget.title,
//                           color: AppColors.white.theme,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                         SizedBox(height: 8),
//                         AppText(
//                           title: widget.body,
//                           color: AppColors.white.theme,
//                           fontSize: 12,
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: AppColors.primary.theme,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: AppColors.black.withOpacity(0.1),
//                   spreadRadius: 2,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
