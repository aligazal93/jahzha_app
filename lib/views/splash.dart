import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/view.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/views/onBoarding/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4), () {
      CachingUtils.isLogged ?
      RouteUtils.navigateAndPopAll(NavBarView()) :
      RouteUtils.navigateAndPopAll(OnBoardingView());
    },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset('assets/images/splash.png',fit: BoxFit.cover,width: double.infinity,),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              right: 0,
              child: FlipInY(
                delay: Duration(milliseconds:500),
                child: Container(
                  child:  Image.asset('assets/images/logo.png',),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
