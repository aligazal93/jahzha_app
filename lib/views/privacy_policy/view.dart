import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/privacy_policy/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PrivacyCubit()..getPrivacyData(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'privacy policy'.tr(),
        ),
        body: BlocBuilder<PrivacyCubit,PrivacyStates>(
          builder: (context, state) {
            final cubit = PrivacyCubit.of(context);
            final data = cubit.privacyModel?.data;
            if(state is PrivacyLoading){
              return AppLoadingIndicator();
            }else if(data == null ){
              return NoDataFoundView();
            }
            return ListView(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
              children: [
                AppText(
                  title: data.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondary,
                  textAlign: TextAlign.center,
                  height: 26,
                ),
                Html(data: data.description,style: {
                  "p": Style(
                      fontSize: FontSize(12),
                      padding: HtmlPaddings.zero,
                  ),
                },),
              ],
            );
          },
        ),
      ),
    );
  }
}
