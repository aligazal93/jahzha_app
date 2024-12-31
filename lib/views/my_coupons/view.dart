import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/enums/coupons_status.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/my_coupons/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/myCoupons_card.dart';
class MyCouponsView extends StatelessWidget {
  const MyCouponsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCouponsCubit()..getAllCoupons(),
      child: Scaffold(
        appBar: CustomAppBar(
         title: 'My coupons'.tr(),
        ),
        body: BlocBuilder<UserCouponsCubit,UserCouponsStates>(
          builder: (context, state) {
            final cubit = UserCouponsCubit.of(context);
            final data = cubit.allUserCoupons?.data;
            if(state is UserCouponsLoading){
              return AppLoadingIndicator();
            }else if(data == null){
              return NoDataFoundView();
            }
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                      return MyCouponsCard(
                        status: data[index].couponsStatus,
                        code: data[index].code,
                        discount: data[index].discount.toString(),
                        discountType: data[index].discountType,
                      );
                    },),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
