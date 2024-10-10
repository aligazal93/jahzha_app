import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/myCoupons_card.dart';
class MyCouponsView extends StatelessWidget {
  const MyCouponsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       title: 'My coupons'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          MyCouponsCard(
            color: AppColors.green,
            statue: 'valid'.tr(),
            discount: '20%',
          ),
          MyCouponsCard(
            discount: '35%',
            color: AppColors.red,
            statue: 'Expired'.tr(),
          ),
          MyCouponsCard(
            discount: '50%',
            color: AppColors.txtGray,
            statue: 'Used'.tr(),
          ),

        ],
      ),
    );
  }
}
