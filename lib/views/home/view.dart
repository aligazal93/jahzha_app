import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/models/app_banner.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/coupons/view.dart';
import 'package:jahzha_app/views/home/units/our_services_cards.dart';
import 'package:jahzha_app/views/my_points/view.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/views/order_tracking/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_text.dart';

import '../../core/datasources/general.dart';
import '../send_shipping/view.dart';
part 'units/slider.dart';
part 'units/service_card.dart';
part 'units/customer_service_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        name: CachingUtils.user?.data.name == null ? 'in Jahzha'.tr() : CachingUtils.user?.data.name,
        title: 'Welcome'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Slider(),
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
                  textAlign:Utils.isAR ? TextAlign.start : TextAlign.left,
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
                    CustomerServiceCard(
                      onTap: () {
                        RouteUtils.navigateTo(MyPointsView());
                      },
                      image: 'points',
                      title: 'Points'.tr(),
                      colorCard: Color(0XFFFFFAED),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(height: 64.height),
        ],
      ),
    );
  }
}
