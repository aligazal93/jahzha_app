import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/utils.dart';
import 'package:jahzha_app/views/my_points/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_paginated_scroll.dart';
import 'package:jahzha_app/widgets/app_text.dart';

part 'units/card_points.dart';

class MyPointsView extends StatelessWidget {
  const MyPointsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyPointsCubit()..getAllPoints(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'my points'.tr(),
        ),
        body: BlocBuilder<MyPointsCubit, MyPointsStates>(
          builder: (context, state) {
            final cubit = MyPointsCubit.of(context);
            final totalPoints = cubit.allUserPoints?.additionalData;
            final myPointsData = cubit.allUserPoints?.data;
            if (state is MyPointsLoading) {
              return Center(child: AppLoadingIndicator());
            } else if (myPointsData == null) {
              return NoDataFoundView();
            }
            return AppPaginatedScroll(
              onRefresh: cubit.getAllPoints,
              items: cubit.allUserPoints!.data!,
              getPaginatedItems: (page) => cubit.getAllPoints(page: page),
              builder: (context) => ListView(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                children: [
                  Container(
                    width: double.infinity,
                    height: 120,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.darkBlue.withOpacity(.2),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/linear.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Align(
                        alignment: Utils.isAR
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              title: 'my points'.tr(),
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            AppText(
                              title: totalPoints?.totalPoints.toString() ?? "0",
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w700,
                              fontSize: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title: 'Points earned'.tr(),
                        fontSize: 18,
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w700,
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      ListView.builder(
                        itemCount: myPointsData.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return MyPointsCard(
                            type: myPointsData[index].type!,
                            createAt:
                                Utils.formatDate(myPointsData[index].createdAt),
                            idNumber: myPointsData[index].type == "admin_gift"
                                ? '0'
                                : myPointsData[index].shipment!.shipmentNumber,
                            point: myPointsData[index].points.toString(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
