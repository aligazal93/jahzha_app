import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/coupons-details/view.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';

class CouponsView extends StatelessWidget {
  const CouponsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: 'اهلا بك'.tr(),
        name: 'Mohamed',
        icon: FontAwesomeIcons.bagShopping,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child:GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 6,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => RouteUtils.navigateTo(CouponsDetailsView()),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: AppColors.tGray
                      )
                  ),
                  child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,)
              ),
              );
            },)
      ),
    );
  }
}
