import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';

part 'units/balance_card.dart';
part 'units/empty_wallet.dart';

class MyBalanceView extends StatelessWidget {
  const MyBalanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Total balance'.tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 120,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.darkBlue.withOpacity(.2),
                image: DecorationImage(
                    image: AssetImage('assets/images/linear.png',),
                    fit: BoxFit.fill
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: 'Total balance'.tr(),
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          AppText(
                            title: '400',
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                          ),
                          SizedBox(width: 12,),
                          AppText(
                            title: 'SAR'.tr(),
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  AppText(
                    title: 'Recent transactions'.tr(),
                    fontSize: 18,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.w700,
                  ),
                  MyBalanceCard(
                    point: '200',
                    statue: 'Return balance'.tr(),
                  ),
                  MyBalanceCard(
                    point: '200',
                    statue: 'Return balance'.tr(),
                  ),
                  MyBalanceCard(
                    point: '200',
                    statue: 'Return balance'.tr(),
                  ),
                  MyBalanceCard(
                    point: '1500',
                    statue: 'Balance withdrawal'.tr(),
                  ),
                  // if Wallet == Zero
                  // EmptyWalletView()
                ],
              ),
            ),
            AppButton(
             title: 'Balance withdrawal'.tr(),
             margin: EdgeInsets.symmetric(vertical: 22),
             constrainedAxis: Axis.horizontal,
             titleFontSize: 16,
             onTap: () {},
             color: AppColors.primary,
            )
          ],
        ),
      ),
    );
  }
}
