import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/auth/login/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';

import '../../core/helpers/utils.dart';

class LoginToContinueView extends StatelessWidget {
  const LoginToContinueView({Key? key, this.hideAppBar = false}) : super(key: key);

  final bool hideAppBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hideAppBar ? null : CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (hideAppBar)
              SizedBox(height: 72.height),
            Image.asset(
              Utils.getAssetPNGPath('x'),
              height: 164.width,
              width: 164.width,
            ),
            SizedBox(height: 48.height),
            AppText(
              title: 'login_to_continue'.tr(),
              textAlign: TextAlign.center,
              fontSize: 20.font,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 28.height),
            AppButton(
              title: 'login'.tr(),
              constrainedAxis: Axis.horizontal,
              height: 48.height,
              onTap: () => RouteUtils.navigateTo(LoginView()),
            ),
            if (!hideAppBar)
              SizedBox(height: 120.height),
          ],
        ),
      ),
    );
  }
}
