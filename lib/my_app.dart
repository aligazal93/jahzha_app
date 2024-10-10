import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: false,
      child:SplashView(),
      builder: (_, child) => KeyboardPopScaffold(
        child: MaterialApp(
          title: 'Jahzha App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            hoverColor: Colors.transparent,
            fontFamily: "Alexandria",
            scaffoldBackgroundColor: AppColors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            primaryColor: AppColors.primary,
          ),
          onGenerateRoute: onGenerateRoute,
          navigatorKey: navigatorKey,
          home: child,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: [Locale('ar'), Locale('en')],
          locale: context.locale,
        ),
      ),
    );
  }
}
