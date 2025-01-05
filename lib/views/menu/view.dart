import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/extensions/string.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/Myshipment_request/view.dart';
import 'package:jahzha_app/views/about_us/view.dart';
import 'package:jahzha_app/views/account_details/view.dart';
import 'package:jahzha_app/views/addreses/view.dart';
import 'package:jahzha_app/views/contact_us/view.dart';
import 'package:jahzha_app/views/jahzha_company/view.dart';
import 'package:jahzha_app/views/language/view.dart';
import 'package:jahzha_app/views/my_balance/view.dart';
import 'package:jahzha_app/views/my_coupons/view.dart';
import 'package:jahzha_app/views/my_points/view.dart';
import 'package:jahzha_app/views/point_policy/view.dart';
import 'package:jahzha_app/views/privacy_policy/view.dart';
import 'package:jahzha_app/views/terms_conditions/view.dart';
import 'package:jahzha_app/views/usage_policy/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_dialog.dart';
import 'package:jahzha_app/widgets/app_text.dart';

part 'units/info_card.dart';

part 'units/card.dart';

part 'units/account_tile.dart';

part 'units/support_button.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InfoCard(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.tGray,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: CardOne(
                            image: 'menu-1',
                            title: 'My shipments'.tr(),
                            content: 'Shipment details'.tr(),
                            onTap: () {
                              RouteUtils.navigateTo(MyShipmentsRequestView());
                            },
                          )),
                    ),
                    Expanded(
                      child: Container(
                          width: 140,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.tGray,
                              ),
                              borderRadius: BorderRadius.circular(12)),
                          child: CardOne(
                            image: 'menu-2',
                            title: 'Wallet'.tr(),
                            content: '0.00' + ' ' + 'SAR'.tr(),
                            onTap: () {
                              RouteUtils.navigateTo(MyBalanceView());
                            },
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.tGray,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: CardOne(
                              image: 'menu-3',
                              title: 'My points'.tr(),
                              content: '1000' + " " + "Point".tr(),
                              onTap: () =>
                                  RouteUtils.navigateTo(MyPointsView()),
                            )),
                      ),
                      Expanded(
                        child: Container(
                            width: 140,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 8),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.tGray,
                                ),
                                borderRadius: BorderRadius.circular(12)),
                            child: CardOne(
                              image: 'menu-4',
                              title: 'My coupons'.tr(),
                              content: '4' + ' ' + "Valid coupons".tr(),
                              onTap: () =>
                                  RouteUtils.navigateTo(MyCouponsView()),
                            )),
                      ),
                    ],
                  ),
                ),
                AppText(
                  title: 'the account'.tr().capitalize,
                  fontWeight: FontWeight.w700,
                  color: AppColors.txtGray,
                  textAlign: Utils.isAR ? TextAlign.start : TextAlign.left,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  fontSize: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.tGray)),
                  child: Column(
                    children: [
                      // AccountTile(
                      //   image: 'location',
                      //   title: 'addresses'.tr(),
                      //   onTap: () {
                      //     RouteUtils.navigateTo(AddressesView());
                      //   },
                      // ),
                      // Divider(
                      //   height: 8,
                      // ),
                      AccountTile(
                        image: 'chats',
                        title: 'call us'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(ContactUsView());
                        },
                      ),
                      Divider(
                        height: 8,
                        color: AppColors.tGray,
                      ),
                      AccountTile(
                        image: 'about',
                        title: 'Jahzha for businesses'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(JahzhaForCompaniesView());
                        },
                      ),
                    ],
                  ),
                ),
                AppText(
                  title: 'About the App'.tr(),
                  textAlign: Utils.isAR ? TextAlign.start : TextAlign.left,
                  fontWeight: FontWeight.w700,
                  color: AppColors.txtGray,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                  fontSize: 16,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.tGray)),
                  child: Column(
                    children: [
                      AccountTile(
                        image: 'info',
                        title: 'about us'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(AboutsUsView());
                        },
                      ),
                      Divider(
                        height: 8,
                        color: AppColors.tGray,
                      ),
                      AccountTile(
                        image: 'terms',
                        title: 'Terms and Conditions'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(TermsAndConditions());
                        },
                      ),
                      Divider(
                        color: AppColors.tGray,
                        height: 8,
                      ),
                      AccountTile(
                        image: 'usage',
                        title: 'Usage policy'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(UsagePolicyView());
                        },
                      ),
                      AccountTile(
                        image: 'shield',
                        title: 'privacy policy'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(PrivacyPolicyView());
                        },
                      ),
                      AccountTile(
                        image: 'coupons',
                        title: 'point policy'.tr(),
                        onTap: () {
                          RouteUtils.navigateTo(
                            PointPolicyView(),
                          );
                        },
                      ),
                      ListTile(
                        onTap: () {
                          RouteUtils.navigateTo(
                            ChooseLanguageView(),
                          );
                        },
                        title: AppText(
                          title: 'language'.tr(),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          textAlign: Utils.isAR ? TextAlign.right : TextAlign.left,

                        ),
                        leading: Icon(
                          FontAwesomeIcons.earthAfrica,
                          color: AppColors.lightGray,
                          size: 22,
                        ),
                        trailing: Icon(
                          Utils.isAR
                              ? FontAwesomeIcons.chevronLeft
                              : FontAwesomeIcons.chevronRight,
                          size: 18,
                          color: AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                  title: 'Delete account'.tr(),
                  color: AppColors.red,
                  constrainedAxis: Axis.horizontal,
                  onTap: () {
                    AppDialog.show(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            FontAwesomeIcons.userSlash,
                            color: AppColors.red,
                            size: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: AppText(
                              title:
                                  'Are you about to delete your account?'.tr(),
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondary,
                              fontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppButton(
                                  title: 'cancel'.tr(),
                                  onTap: () => RouteUtils.pop(),
                                  titleFontSize: 12,
                                  color: AppColors.secondary,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                AppButton(
                                  title: 'Delete account'.tr(),
                                  onTap: CachingUtils.signOut,
                                  titleFontSize: 12,
                                  color: AppColors.red,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      title: '',
                    );
                  },
                ),
                InkWell(
                  onTap: CachingUtils.signOut,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.red),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logout.png'),
                        AppText(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          textAlign: TextAlign.center,
                          title: 'sign out'.tr(),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.red,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 92.height),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: UnconstrainedBox(
        child: InkWell(
          onTap: () => RouteUtils.navigateTo(ContactUsView()),
          child: SupportButton(),
        ),
      ),
    );
  }
}
