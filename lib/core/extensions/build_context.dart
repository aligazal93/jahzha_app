import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';

extension BuildContextExtension on BuildContext {
  AppFontFamily get localizedFontFamily {
    return locale.languageCode == 'ar'
        ? AppFontFamily.alexandria
        : AppFontFamily.montserrat;
  }

  bool get isMobile {
    return MediaQuery.of(this).size.width < 600;
  }
}
