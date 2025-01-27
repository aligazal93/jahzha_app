import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/models/app_banner.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/home/units/our_services_cards.dart';
import 'package:jahzha_app/views/my_points/view.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_refresh_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';

import '../../core/datasources/general.dart';
import '../../core/helpers/app_status.dart';
import '../../core/permission_manager/permissions_section.dart';

part 'units/customer_service_card.dart';

part 'units/service_card.dart';

part 'units/slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    AppStatusUtils.getAppStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        name: CachingUtils.user?.data.name == null
            ? 'in Jahzha'.tr()
            : CachingUtils.user?.data.name,
        title: 'Welcome'.tr(),
      ),
      body: AppRefreshIndicator(
        onRefresh: () async => setState(() {}),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Slider(key: UniqueKey()),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: AppPermissionsSections(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: OurServicesCards(),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title: 'Customer services'.tr(),
                    fontWeight: FontWeight.w700,
                    textAlign: Utils.isAR ? TextAlign.start : TextAlign.left,
                    color: AppColors.secondary,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    fontSize: 16,
                  ),
                  Row(
                    children: [
                      CustomerServiceCard(
                        onTap: () => NavBarCubit.of(context).toggleTab(2),
                        image: 'coupons',
                        title: 'Coupons'.tr(),
                        colorCard: Color(0xFFE7F6FB),
                      ),
                      SizedBox(width: 12),
                      if (CachingUtils.isLogged)
                        CustomerServiceCard(
                          onTap: () => RouteUtils.navigateTo(MyPointsView()),
                          image: 'points',
                          title: 'Points'.tr(),
                          colorCard: Color(0XFFFFFAED),
                        )
                      else
                        Spacer(),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 64.height),
          ],
        ),
      ),
    );
  }
}
