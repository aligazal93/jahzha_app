import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/coupons/cubit.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';
import 'package:jahzha_app/views/navbar/units/bottom_navbar.dart';
import 'package:jahzha_app/widgets/app_sheet.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';

import '../../core/route_utils/route_utils.dart';
import '../../widgets/app_text.dart';
import '../home/units/our_services_cards.dart';

part 'units/send_shipment_sheet.dart';

class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => StoreCouponsCubit()..getAllCouponsStore(),
        )
      ],
      child: BlocBuilder<NavBarCubit, NavBarStates>(
        builder: (context, state) {
          final cubit = NavBarCubit.of(context);
          return Scaffold(
            backgroundColor: AppColors.backGroundWhite.theme,
            key: cubit.scaffoldKey,
            bottomNavigationBar: BottomNavBar(
              onTap: cubit.toggleTab,
              index: cubit.currentIndex,
            ),
            body: state is NavBarLoadingState
                ? LoadingIndicator()
                : cubit.getCurrentView,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: UnconstrainedBox(
              child: InkWell(
                onTap: _SendShipmentSheet().show,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 14),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: AppColors.primary.theme,
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Image.asset('assets/images/icon-3.png'),
                    ),
                    AppText(
                      title: 'Send Shipment'.tr(),
                      fontSize: 12,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
