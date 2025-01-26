import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/datasources/general.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/models/walkthrough.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/basic_card_decoration.dart';
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
  List<Walkthrough> walkthrough = [];

  @override
  void initState() {
    getWalkthrough();
    super.initState();
  }

  Future<void> getWalkthrough() async {
    walkthrough = await GeneralDatasource().getWalkthrough();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (walkthrough.isNotEmpty) ...[
              PageView(
                onPageChanged: (index) {
                  setState(() {
                    onLastPage = (index == walkthrough.length - 1);
                  });
                },
                controller: _controller,
                children: [
                  ...walkthrough.map((e) {
                    return BoardCard(
                      image: e.image,
                      title: e.title,
                      description: e.description,
                    );
                  }),
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
                        count: walkthrough.length,
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
                                    curve: Curves.easeIn,
                                  );
                                },
                                titleFontSize: 15,
                              ),
                      ),
                      if (!onLastPage)
                        AppText(
                          title: 'Skip'.tr(),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGray,
                          onTap: () => RouteUtils.navigateTo(LoginView()),
                        ),
                    ],
                  ),
                ),
              ),
            ] else
              AppLoadingIndicator(),
            if (walkthrough.isEmpty)
              PositionedDirectional(
                top: 8,
                end: 8,
                child: BasicCard(
                  child: AppText(
                    title: 'Skip'.tr(),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGray,
                    onTap: () => RouteUtils.navigateTo(LoginView()),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
