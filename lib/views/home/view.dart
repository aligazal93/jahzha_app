import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/coupons/view.dart';
import 'package:jahzha_app/views/my_points/view.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/views/order_tracking/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';

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
        icon: FontAwesomeIcons.bagShopping,
        title: 'Welcome'.tr(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: ListView(
          children: [
            Slider(),
            AppText(
             title: 'Our services'.tr(),
             textAlign:Utils.isAR ? TextAlign.start : TextAlign.left,
             fontWeight: FontWeight.w700,
             color: AppColors.secondary,
             padding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
             fontSize: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ServiceCar(
                    title: 'Local shipping'.tr(),
                    colorCard: Color(0xFFFFFEEEA),
                    imgColor: Color(0XFFFFE2DC),
                    image: 'truck',
                    onTap: () {
                      RouteUtils.navigateTo(SendShippingView(isLocal: true));
                    },
                  ),
                  ServiceCar(
                    title: 'international shipping'.tr(),
                    colorCard: Color(0xFFFFFAED),
                    imgColor: Color(0XFFFEEEC6),
                    image: 'serv',
                    onTap: () {
                      RouteUtils.navigateTo(SendShippingView(isLocal: false));
                    },
                  ),
                  // ServiceCar(
                  //   title: 'order tracking'.tr(),
                  //   colorCard: Color(0xFFE8FCF0),
                  //   imgColor: Color(0XFFCEF8DF),
                  //   image: 'track',
                  //   onTap: () {
                  //     RouteUtils.navigateTo(OrderTrackingView());
                  //   },
                  // ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            AppText(
              title: 'Customer services'.tr(),
              fontWeight: FontWeight.w700,
              textAlign:Utils.isAR ? TextAlign.start : TextAlign.left,
              color: AppColors.secondary,
              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 12),
              fontSize: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  CustomerServiceCard(
                    onTap: () => NavBarCubit.of(context).toggleTab(2),
                    image: 'coupons',
                    title: 'Coupons'.tr(),
                    colorCard: Color(0xFFE7F6FB),
                  ),
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
            ),
            SizedBox(height: 64.height),
          ],
        ),
      ),
    );
  }
}
