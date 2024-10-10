import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

class JahzhaForCompaniesView extends StatelessWidget {
  const JahzhaForCompaniesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Jahzha for businesses'.tr(),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          AppText(
           title: 'Do you have more than one shipment? You can contact us to get a price quote that suits you'.tr(),
           fontWeight: FontWeight.w500,
           fontSize: 16,
           height: 25,
           color: AppColors.txtGray,
          ),
          SizedBox(height: 12,),
          AppTextField(
            label: 'full name'.tr(),
            fillColor: AppColors.tGray,

          ),
          AppTextField(
            label: 'mobile number'.tr(),
            inputType: TextInputType.phone,
            fillColor: AppColors.tGray,
          ),
          AppTextField(
            label: 'company name'.tr(),
            fillColor: AppColors.tGray,
          ),
          AppTextField(
            label: 'Number of shipments'.tr(),
            fillColor: AppColors.tGray,
          ),
          AppTextField(
            label: 'Leave us your order details'.tr(),
            maxLines: 4,
            fillColor: AppColors.tGray,
          ),
          AppButton(
           title: 'Get a quote'.tr(),
           color: AppColors.primary,
            constrainedAxis: Axis.horizontal,
            margin: EdgeInsets.symmetric(vertical: 10),
            titleFontSize: 14,
            onTap: () {
              _showMyDialog(context);
            },
          )
        ],
      ),
    );
  }
  Future<void> _showMyDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(FontAwesomeIcons.solidSquareCheck,color: AppColors.green,size: 46,),
                SizedBox(height: 12,),
                AppText(
                  textAlign: TextAlign.center,
                 title: 'Your request has been received successfully'.tr(),
                 fontSize: 16,
                 color: AppColors.secondary,
                 padding: EdgeInsets.symmetric(vertical: 12),
                 fontWeight: FontWeight.w700,
                ),
                AppText(
                  textAlign: TextAlign.center,
                  title: 'We will contact you as soon as possible to obtain a price quote. Thank you'.tr(),
                  fontSize: 14,
                  color: AppColors.txtGray,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            AppButton(
              margin: EdgeInsets.symmetric(horizontal: 20),
              title: 'Home'.tr(),
              color: AppColors.primary,
              titleFontSize: 16,
              constrainedAxis: Axis.horizontal,
              onTap: () {
                RouteUtils.navigateTo(NavBarView());
              },
            ),
            SizedBox(height: 20,),
          ],
        );
      },
    );
  }
}
