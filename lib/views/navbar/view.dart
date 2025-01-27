import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/coupons/cubit.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';
import 'package:jahzha_app/views/navbar/units/bottom_navbar.dart';
import 'package:jahzha_app/widgets/app_sheet.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';

import '../../widgets/app/login_to_continue_view.dart';
import '../../widgets/app_text.dart';
import '../coupons/view.dart';
import '../home/units/our_services_cards.dart';
import '../home/view.dart';
import '../menu/view.dart';
import '../my_shipments/view.dart';

part 'units/send_shipment_sheet.dart';

class NavBarView extends StatelessWidget {
  const NavBarView({Key? key, this.initialViewIndex = 0}) : super(key: key);

  final int initialViewIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(currentIndex: initialViewIndex),
        ),
        BlocProvider(
          create: (context) => StoreCouponsCubit()..getAllCouponsStore(),
        ),
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
                : [
                    HomeView(),
                    MyShipmentsView(),
                    CouponsView(),
                    CachingUtils.isLogged ? MenuView() : LoginToContinueView(hideAppBar: true),
                  ][cubit.currentIndex],
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: UnconstrainedBox(
              child: InkWell(
                onTap: _SendShipmentSheet().show,
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.theme,
                        borderRadius: BorderRadius.circular(500),
                      ),
                      child: Image.asset(
                        'assets/images/icon-3.png',
                        width: 24,
                        height: 24,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 8),
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
