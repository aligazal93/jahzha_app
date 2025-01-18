import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/route_utils/route_utils.dart';
import '../../../widgets/app_text.dart';
import '../../send_shipping/view.dart';
import '../view.dart';

class OurServicesCards extends StatelessWidget {
  const OurServicesCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title: 'Our services'.tr(),
          fontWeight: FontWeight.w700,
          padding: EdgeInsets.symmetric(
            vertical: 16,
          ),
          fontSize: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ServiceCar(
              title: 'Local shipping'.tr(),
              colorCard: Color(0xFFFFFEEEA),
              imgColor: Color(0XFFFFE2DC),
              image: 'truck',
              onTap: () =>
                  RouteUtils.navigateTo(SendShippingView(isLocal: true)),
            ),
            SizedBox(width: 12),
            ServiceCar(
              title: 'international shipping'.tr(),
              colorCard: Color(0xFFFFFAED),
              imgColor: Color(0XFFFEEEC6),
              image: 'serv',
              onTap: () =>
                  RouteUtils.navigateTo(SendShippingView(isLocal: false)),
            ),
            // SizedBox(width: 12),
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
      ],
    );
  }
}
