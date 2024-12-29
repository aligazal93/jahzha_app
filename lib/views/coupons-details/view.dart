import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/coupons-details/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';
part 'units/coupon_card.dart';

class CouponsDetailsView extends StatelessWidget {
  const CouponsDetailsView({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CouponsDetailsCubit()..getCouponsDetailsData(id),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Coupons'.tr(),
        ),
        body: BlocBuilder<CouponsDetailsCubit , CouponsDetailsStates>(
          builder: (context, state) {
            final cubit = CouponsDetailsCubit.of(context);
            final data = cubit.storeCouponsDetailsModel?.data;
            final storeData = data?.store;
            final couponsData = data?.coupons;
            if(state is CouponsDetailsLoading){
              return Center(child: AppLoadingIndicator());
            }else if (couponsData!.isEmpty && couponsData == null){
              return Center(child: AppLoadingIndicator());
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: AppColors.tGray
                                  )
                              ),
                              child: Image.network(storeData!.image,fit: BoxFit.cover,)
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  title:storeData.name,
                                  color: AppColors.primary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                                SizedBox(height: 8,),
                                AppText(
                                  title: storeData.discountText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.txtGray,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //TODO Go To URL
                  AppButton(
                    title: 'Shop now'.tr(),
                    constrainedAxis: Axis.horizontal,
                    color: AppColors.primary,
                    onTap: () {},
                    height: 50,
                    titleFontSize: 16,
                    margin: EdgeInsets.symmetric(vertical: 12),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    child: ListView.builder(
                      itemCount: couponsData.length,
                      itemBuilder: (context, index) {
                        return CouponCard(
                          availabilityText: couponsData[index].availabilityText,
                          coupon: couponsData[index].coupon,
                          couponId: couponsData[index].couponId,
                          discountValue: couponsData[index].discountValue,
                          featureOne: couponsData[index].feature1,
                          featureTwo: couponsData[index].feature2,
                        );
                      },),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
