import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/helpers/app_colors.dart';

part 'units/board_card.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            controller: _controller,
            children: [
              BoardCard(
                  image: 'assets/images/board-1.png',
                  head: 'Compare shipping company prices',
                  title:
                  'We provide you with a service to compare prices of different shipping companies, allowing you to choose the best offer that suits your needs'),
              BoardCard(
                  image: 'assets/images/board-2.png',
                  head: 'Calculate the shipping cost',
                  title:
                  'You can use the shipping calculator on our website to determine the cost of sending your package based on its weight, size, and destination.'),
              BoardCard(
                  image: 'assets/images/board-3.png',
                  head: 'Book a shipping service',
                  title:
                  'You can book the shipping service directly through our website, with the ability to easily track your package.'),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment(0, 0),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: SlideEffect(
                      activeDotColor: AppColors.yellow,
                      dotHeight: 10,
                      dotColor: AppColors.darkGrayBlue,
                      dotWidth: 22,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: AppColors.primary,
                    ),
                    child: onLastPage
                        ? AppButton(
                      title: 'Log in/Create a new account'.tr(),
                      constrainedAxis: Axis.horizontal,
                      color: AppColors.primary,
                      onTap: () => RouteUtils.navigateTo(LoginView()),
                      titleFontSize: 15,
                    )
                        : AppButton(
                      title: 'Next'.tr(),
                      constrainedAxis: Axis.horizontal,
                      color: AppColors.primary,
                      onTap: () {
                        _controller.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeIn,);
                      },
                      titleFontSize: 15,
                    ),
                  ),
                  if (!onLastPage)
                  AppText(
                    title: 'Skip'.tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrayBlue,
                    onTap: () => RouteUtils.navigateTo(LoginView()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
