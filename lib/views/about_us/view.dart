import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/about_us/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_text.dart';

part 'units/about_card.dart';

class AboutsUsView extends StatelessWidget {
  const AboutsUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutUsCubit()..init(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'about us'.tr(),
        ),
        body: BlocBuilder<AboutUsCubit,AboutUsStates>(
          builder: (context, state) {
            final cubit = AboutUsCubit.of(context);
            final aboutData = cubit.aboutUsModel?.data;
            final aboutFeaturesData = cubit.aboutFeaturesModel?.data;
            if(state is AboutUsLoading){
              return AppLoadingIndicator();
            } else if(aboutData == null || aboutFeaturesData == null){
              return NoDataFoundView();
            }
            return ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
              children: [
                Html(
                  data: aboutData?.description,
                  style: {
                    "p": Style(
                      fontSize: FontSize(14),
                      color: AppColors.txtGray
                    ),
                  }
                ),
                AppText(
                  title: 'Why charge with jahzha'.tr(),
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textAlign: TextAlign.center,
                ),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: aboutFeaturesData!.length,
                    physics: NeverScrollableScrollPhysics(),
                    // TODDO اول مره في حاجه بتظهر ف الصور -- اول مره بس
                    itemBuilder: (context, index) {
                    return AboutCard(
                      image: aboutFeaturesData[index].image,
                      title: aboutFeaturesData[index].title,
                      content: aboutFeaturesData[index].description,
                    );
                  },)
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
