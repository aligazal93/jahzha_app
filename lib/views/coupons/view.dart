import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/coupons-details/view.dart';
import 'package:jahzha_app/views/coupons/cubit.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';

class CouponsView extends StatelessWidget {
  const CouponsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCouponsCubit()..getAllCouponsStore(),
      child: Scaffold(
        appBar: HomeAppBar(
          name: CachingUtils.user?.data.name == null ? 'in Jahzha'.tr() : CachingUtils.user?.data.name,
          icon: FontAwesomeIcons.bagShopping,
          title: 'Welcome'.tr(),
        ),
        body: BlocBuilder<StoreCouponsCubit , StoreCouponsStates>(
          builder: (context, state) {
            final cubit = StoreCouponsCubit.of(context);
            final data = cubit.storeCouponsModel?.data;
            if(state is StoreCouponsLoading){
              return Center(child: AppLoadingIndicator());
            }else if (data == null){
              return Center(child: NoDataFoundView());
            }
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child:GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns in the grid
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => RouteUtils.navigateTo(CouponsDetailsView(
                        id: data[index].id,
                      )),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: AppColors.tGray
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(data[index].image,width: 100,),
                              Center(child: AppText(title: data[index].name,textAlign: TextAlign.center,fontSize: 12,fontWeight: FontWeight.w700,))
                            ],
                          )
                      ),
                    );
                  },)
            );
          },
        ),
      ),
    );
  }
}
