// import 'package:flutter/material.dart';
//
// import '../core/helpers/app_colors.dart';
// import 'app_back_button.dart';
// import 'app_text.dart';
//
// class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const AppAppBar({Key? key, this.title, this.leading, this.actions, this.hMargin = 8}) : super(key: key);
//
//   final double hMargin;
//   final String? title;
//   final List<Widget>? actions;
//   final Widget? leading;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: hMargin),
//       child: AppBar(
//         backgroundColor: AppColors.white.theme,
//         elevation: 0.0,
//         iconTheme: IconThemeData(),
//         leading: leading ?? (Navigator.canPop(context) ? AppBackButton(color: AppColors.primary.theme,padding: EdgeInsets.symmetric(horizontal: 8)) : null),
//         centerTitle: true,
//         titleSpacing: title == null || title!.isEmpty || !Navigator.canPop(context) ? null : -16,
//         title: AppText(
//           title: title ?? '',
//           fontSize: 18,
//           color: AppColors.secondary.theme,
//           fontWeight: FontWeight.w700,
//         ),
//         actions: actions,
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => AppBar().preferredSize;
// }
