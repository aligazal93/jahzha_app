import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/send_shipments/view.dart';
import 'package:jahzha_app/widgets/app_text.dart';

import '../cubit/cubit.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, this.onTap, required this.index}) : super(key: key);
  final Function(int)? onTap;
  final int index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.white.theme,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 7,
                    spreadRadius: .6,
                    color: AppColors.tGray.theme,
                  ),
                ],
              ),
              child: Row(
                children: [
                  _bottomNavItem(
                    index: 0,
                    icon: 'icon-1',
                    title: 'Home'.tr(),
                  ),
                  _bottomNavItem(
                    index: 1,
                    icon: 'icon-2',
                    title: 'My shipments'.tr(),
                  ),
                  if (Utils.isAR) SizedBox(width: 20.width),
                  Spacer(),
                  if (Utils.isAR) SizedBox(width: 20.width),
                  _bottomNavItem(
                    index: 2,
                    title: 'Coupons'.tr(),
                    icon: 'icon-4',
                  ),
                  _bottomNavItem(
                    index: 3,
                    title: 'Menu'.tr(),
                    icon: 'icon-5',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: UnconstrainedBox(
                child: InkWell(
                  onTap: () {
                    RouteUtils.navigateTo(SendShipmentsView());
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 14),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.primary.theme,
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Image.asset('assets/images/icon-3.png'),
                      ),
                      AppText(
                        title: 'Send Shipment'.tr(),
                        fontSize: 12,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavItem(
      {required int index, required String title, required String icon}) {
    final cubit = NavBarCubit.of(context);
    final isActive = index == cubit.currentIndex;
    return Expanded(
      child: InkWell(
        onTap: () => cubit.toggleTab(index),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white.theme,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Image.asset(
                  'assets/images/$icon.png',
                  color: isActive
                      ? AppColors.secondary.theme
                      : AppColors.GrayLight.theme,
                ),
              ),
              AppText(
                title: title,
                color: isActive
                    ? AppColors.secondary.theme
                    : AppColors.GrayLight.theme,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
