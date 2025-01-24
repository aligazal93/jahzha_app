import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jahzha_app/core/extensions/build_context.dart';
import 'package:jahzha_app/views/splash.dart';

import 'core/helpers/app_colors.dart';
import 'core/route_utils/route_utils.dart';
import 'widgets/pop_scaffold.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.primary,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: ScreenUtilInit(
        designSize: context.isMobile ? const Size(375, 812) : const Size(744, 1133),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'جهزها',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            hoverColor: Colors.transparent,
            useMaterial3: false,
            fontFamily: context.localizedFontFamily.id,
            scaffoldBackgroundColor: AppColors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            primaryColor: AppColors.primary,
            dividerColor: AppColors.black.withOpacity(0.8),
          ),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: SplashView(),
          builder: (_, child) => KeyboardPopScaffold(
            child: child!,
          ),
        ),
      ),
    );
  }
}
