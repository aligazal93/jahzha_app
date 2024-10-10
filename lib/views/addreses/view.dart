import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/edit_address/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class AddressesView extends StatelessWidget {
  const AddressesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'the addresses'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        children: [
          AppButton(
            title: 'Add a new address'.tr(),
            constrainedAxis: Axis.horizontal,
            onTap: () {},
            titleFontSize: 16,
            titleColor: AppColors.primary,
            borderColor: AppColors.primary,
            color: AppColors.white,
          ),
          SizedBox(height: 22,),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.tGray
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,),
                  child: Row(
                    children: [
                      AppText(
                       title: 'the home'.tr(),
                       fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                      ),
                      AppText(
                       title: 'Primary address'.tr(),
                        fontSize: 12,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        fontWeight: FontWeight.w700,
                        color: AppColors.blue,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          RouteUtils.navigateTo(EditAddressView());
                        },
                        child: Image.asset('assets/images/edit.png'))
                    ],
                  ),
                ),
                Divider(),
                AppText(
                 padding: EdgeInsets.symmetric(horizontal: 12),
                 title: 'the address'.tr(),
                 color: AppColors.txtGray,
                 fontSize: 14,
                ),
                AppText(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                  title: 'City, neighborhood, street name'.tr(),
                  color: AppColors.secondary,
                  fontSize: 14,
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: AppColors.tGray
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12,),
                  child: Row(
                    children: [
                      AppText(
                        title: 'the job'.tr(),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.secondary,
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                         RouteUtils.navigateTo(EditAddressView());
                        },
                        child: Image.asset('assets/images/edit.png'))
                    ],
                  ),
                ),
                Divider(),
                AppText(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  title: 'the address'.tr(),
                  color: AppColors.txtGray,
                  fontSize: 14,
                ),
                AppText(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
                  title: 'City, neighborhood, street name'.tr(),
                  color: AppColors.secondary,
                  fontSize: 14,
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
