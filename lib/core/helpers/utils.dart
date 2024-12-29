import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jahzha_app/core/extensions/string.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/snack_bar.dart';
import '../route_utils/route_utils.dart';
import 'app_colors.dart';

class Utils {

  static const double DEFAULT_MAP_ZOOM = 16.0;

  static Color getColor(String color) {
    final myColor = "0xff${color.replaceFirst("#", "")}";
    return Color(int.parse(myColor));
  }

  static void log(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

 static void closeKeyboard() => FocusScope.of(RouteUtils.context).unfocus();

  static String getAssetPNGPath(String image) {
    return 'assets/images/$image.png';
  }

  static String getAssetSVGPath(String image) {
    return 'assets/images/svg/$image.svg';
  }

  static double get bottomDevicePadding {
    final bottom = MediaQuery.of(RouteUtils.context).padding.bottom;
    if (bottom < 34) {
      return 34.height;
    }
    return bottom;
  }

  static Map<String, dynamic> getParamFromURL(String url) {
    final uri = Uri.parse(url);
    Map<String, dynamic> data = {};
    uri.queryParameters.forEach((key, value) {
      data[key] = value;
    });
    return data;
  }

  static Future<File?> getFileFromUrl(String url) async {
    try {
      final documentDirectory = await getApplicationDocumentsDirectory();
      final fileName = documentDirectory.path + '/' + getFileNameFromURL(url, '/');
      final file = File(fileName);
      if (await file.exists()) {
        return file;
      }
      await Dio().download(
        url,
        fileName,
      );
      return file;
    } catch (e) {
      handleGenericException(e);
      return null;
    }
  }

  static double get topDevicePadding {
    final top = MediaQuery.of(RouteUtils.context).padding.top;
    if (top < 44) {
      return 44.height;
    }
    return top;
  }

  static double get appBarHeight {
    return AppBar().preferredSize.height;
  }

  static double keyboardHeight(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    print(keyboardHeight);
    if (keyboardHeight == 0) {
      return keyboardHeight;
    }
    return keyboardHeight + 16.height;
  }

  static bool get isAR {
    return RouteUtils.context.locale.languageCode == 'ar';
  }

  static void dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static String getFileNameFromURL(String url, String symbol) =>
      url.substring(url.lastIndexOf(symbol) + 1);

  static String formatDate(DateTime? value) {
    if (value == null) {
      return "";
    }
    return "${value.year}/${value.month.toString().padLeft(2, '0')}/${value.day.toString().padLeft(2, '0')}";
  }

  static String formatTime(TimeOfDay? value) {
    if (value == null) {
      return "";
    }
    final hours = value.hour;
    return '${((hours > 12) ? hours - 12 : hours == 0 ? 12 : hours).toString().padLeft(2, '0')}:${(value.minute).toString().padLeft(2, '0')} ${value.period.name.toUpperCase()}';
  }

  static copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          title: 'Copied'.tr(),
          fontSize: 22,
          color: AppColors.white.theme,
          fontWeight: FontWeight.w700,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  static TimeOfDay convertToTimeOfDay(String value) {
    List<String> timeParts = value.split(':');
    int hours = int.parse(timeParts[0]);
    int minutes = int.parse(timeParts[1].split(' ')[0]);
    String period = timeParts[1].split(' ')[1];
    if (period == 'PM' && hours != 12) {
      hours += 12;
    } else if (period == 'AM' && hours == 12) {
      hours = 0;
    }
    return TimeOfDay(hour: hours, minute: minutes);
  }

  static ThemeData get datePickerTheme {
    return Theme.of(RouteUtils.context).copyWith(
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.secondary,
        onSurface: AppColors.secondary,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 10,
        ),
        bodyLarge: TextStyle(
          color: AppColors.primary,
        ),
        labelSmall: TextStyle(
          color: AppColors.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w700
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
        ),
      ),
    );
  }

  static double getFileSizeInMB(File file) {
    int fileSizeInBytes = file.lengthSync();
    double fileSizeInKB = fileSizeInBytes / 1024;
    double fileSizeInMB = fileSizeInKB / 1024;
    return fileSizeInMB;
  }
  //
  // static Future<int> getVideoLengthInSeconds(File file) async {
  //   VideoPlayerController? controller;
  //   try {
  //     controller = VideoPlayerController.file(file);
  //     await controller.initialize();
  //     final length = controller.value.duration.inSeconds;
  //     await controller.dispose();
  //     return length;
  //   } catch (e, s) {
  //     debugPrint(e.toString());
  //     debugPrintStack(stackTrace: s);
  //   }
  //   await controller?.dispose();
  //   return 0;
  // }

  // static Future<bool> validateVideoSizeAndLength(File file) async {
  //   final size = getFileSizeInMB(file);
  //   if (size > 11) {
  //     return false;
  //   }
  //   final length = await getVideoLengthInSeconds(file);
  //   if (length > 30) {
  //     return false;
  //   }
  //   return true;
  // }

  // static const LatLng defaultLatLng = LatLng(
  //   24.774265,
  //   46.738586,
  // );
  //
  // static const CameraPosition defaultMapCameraPosition = CameraPosition(
  //   target: defaultLatLng,
  //   zoom: 1,
  // );
  //
  // static CameraPosition getMapCameraPosition(LatLng latLng, [double zoom = 12]) => CameraPosition(
  //   target: latLng,
  //   zoom: zoom,
  // );

  static double sizeFromHeight(double fraction,
      {bool removeAppBarSize = true}) {
    MediaQueryData mediaQuery = MediaQuery.of(RouteUtils.context);
    fraction = (removeAppBarSize
        ? (mediaQuery.size.height -
        AppBar().preferredSize.height -
        mediaQuery.padding.top)
        : (mediaQuery.size.height - mediaQuery.viewPadding.top)) /
        (fraction == 0 ? 1 : fraction);
    return fraction;
  }

  static double sizeFromWidth(double fraction) {
    fraction = MediaQuery.of(RouteUtils.context).size.width / (fraction == 0 ? 1 : fraction);
    return fraction;
  }



  static Map<String, List<Map<String, TimeOfDay>>> getWorkTimes() {
    return {
      "saturday": [],
      "sunday": [],
      "monday": [],
      "tuesday": [],
      "wednesday": [],
      "thursday": [],
      "friday": [],
    };
  }

  static List<Map<String, dynamic>> formatWorkTimes(Map<String, List<Map<String, TimeOfDay>>> workTimes) {
    List<Map<String, dynamic>> formattedWorkTimes = [];
    for (var key in workTimes.keys) {
      for (var item in workTimes[key]!) {
        formattedWorkTimes.add({
          'Day': key.capitalize,
          "StartTime": "2023-05-16 ${Utils.formatTime(item['from'])}",
          'EndTime': "2023-05-16 ${Utils.formatTime(item['to'])}",
        });
      }
    }
    return formattedWorkTimes;
  }

}

void handleGenericException(dynamic e) {
  final char = "-";
  final divider = char * 40;
  Function(dynamic, dynamic) logError = (e, s) {
    // FirebaseCrashlytics.instance.recordError(e, e.stackTrace, fatal: true);
    debugPrint('');
    debugPrint(divider + " Unexpected Error " + divider);
    debugPrint(e.toString());
    debugPrintStack(stackTrace: s);
    debugPrint(divider + divider + "-" * 22);
    debugPrint('');
    showSnackBar('Unexpected Error', errorMessage: true);
  };
  try {
    logError(e, e.stackTrace);
  } catch  (_, s) {
    logError(e, s);
  }
}
