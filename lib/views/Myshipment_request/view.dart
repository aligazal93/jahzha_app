import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/views/Myshipment_request/cubit/cubit.dart';
import 'package:jahzha_app/views/Myshipment_request/cubit/states.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';
part 'units/ship_card.dart';

class MyShipmentsRequestView extends StatefulWidget {
  const MyShipmentsRequestView({Key? key}) : super(key: key);

  @override
  State<MyShipmentsRequestView> createState() => _MyShipmentsRequestViewState();
}

class _MyShipmentsRequestViewState extends State<MyShipmentsRequestView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentRequestCubit(),
      child: Scaffold(
        appBar: CustomAppBar(
          color: AppColors.secondary,
         title: 'My shipments'.tr(),
          titleColor: AppColors.white,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
        ),
        body: BlocBuilder<ShipmentRequestCubit,ShipmentsRequestsStates>(
          builder: (context, state) {
            final cubit = ShipmentRequestCubit.of(context);
            return ListView(
              children: [
                Row(
                  children: [
                    _ShipCard(
                      title: 'Order status'.tr(),
                      index: 0,
                    ),
                    _ShipCard(
                      title: 'Order details'.tr(),
                      index: 1,
                    ),
                    _ShipCard(
                      title: 'order tracking'.tr(),
                      index: 2,
                    ),
                  ],
                ),
                state is ShipmentsRequestsLoadingState ? LoadingIndicator() :
                cubit.getCurrentView
              ],
            );
          },
        ),
      ),
    );
  }
}
