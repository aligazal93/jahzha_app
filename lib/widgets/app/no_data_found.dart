import 'package:flutter/material.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:lottie/lottie.dart';

class NoDataFoundView extends StatelessWidget {
  const NoDataFoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Lottie.asset('assets/lottie/no-data.json'),
          ),
          SizedBox(
            height: 12,
          ),
          AppText(
            title: Utils.isAR ? 'لا يوجد بيانات لعرضها' : 'No Data Available',
            fontSize: 18,
            color: AppColors.primary.theme,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
