import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/navbar/cubit/cubit.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';
import 'package:jahzha_app/views/navbar/units/bottom_navbar.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';


class NavBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
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
                : cubit.getCurrentView,
          );
        },
      ),
    );
  }
}
