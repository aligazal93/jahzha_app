import 'package:flutter/material.dart';
import 'package:jahzha_app/core/theme_utils/theme_utils.dart';

class AppColors {
  static const Color primary = Color(0xFFF05025);
  static const Color secondary = Color(0xFF0F122C);
  static const Color tGray = Color(0xFFEFF0F5);
  static const Color txtGray = Color(0xFF7B7B7B);
  static const Color GrayLight = Color(0xFFBAC0CA);
  static const Color whiteBk = Color(0xFFF7F7F7);

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);
  static const Color backGroundWhite = Color(0xffFCFCFC);
  static const Color orangeLight = Color(0xffFFE2D8);
  static const Color blueLight = Color(0xffDBECFC);



  static const Color lightGray = Color(0xFF565656);
  static const Color darkGray = Color(0xFFF4F4F4);
  static const Color darkGrayBlue = Color(0xFFD9D9D9);
  static const Color darkBlue = Color(0xFF9094B7);

  static const Color green = Color(0xFF38C67F);
  static const Color red = Color(0xFFE92424);
  static const Color yellow = Color(0xffFAB419);
  static const Color background = Color(0xffE8E7E7);
  static const Color orange = Color(0xFFF3AE27);
  static const Color blue = Color(0xFFF1583E9);



}




extension DarkTheme on Color {

  Color get theme {
    if (ThemeUtils.getAppThemeMode == AppThemeMode.light) {
      return this;
    }
    if (AppColors.primary == this) {
      return AppColors.primary;
    }
    if (AppColors.backGroundWhite == this) {
      return AppColors.secondary;
    }
    if (AppColors.secondary == this) {
      return AppColors.white;
    }
    if (AppColors.darkGray == this) {
      return AppColors.darkGray;
    }
    if (AppColors.darkGrayBlue == this) {
      return AppColors.darkGrayBlue;
    }
    if (AppColors.lightGray == this) {
      return AppColors.white;
    }
    if (AppColors.tGray == this) {
      return AppColors.white;
    }
    if (AppColors.white == this) {
      return AppColors.secondary;
    }
    if (AppColors.green == this) {
      return AppColors.green;
    }
    if (AppColors.black == this) {
      return AppColors.secondary;
    }
    return Colors.transparent;
  }

}
