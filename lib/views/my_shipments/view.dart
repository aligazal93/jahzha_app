import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app/shipment_card.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_paginated_scroll.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

import 'cubit.dart';
part 'units/search_field.dart';
part 'units/orders.dart';

class MyShipmentsView extends StatelessWidget {
  const MyShipmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!CachingUtils.isLogged) {
      return Scaffold(
        appBar: HomeAppBar(
          name: 'in Jahzha'.tr(),
          title: 'My shipments'.tr(),
        ),
      );
    }
    return BlocProvider(
      create: (context) => MyShipmentsCubit()..getShipments(),
      child: Scaffold(
        appBar: HomeAppBar(
          name: CachingUtils.user?.data.name,
          title: 'My shipments'.tr(),
        ),
        body: BlocBuilder<MyShipmentsCubit, MyShipmentsStates>(
          builder: (context, state) {
            final cubit = MyShipmentsCubit.of(context);
            final orders = cubit.shipments;
            if (cubit.isStateLoading) {
              return AppLoadingIndicator();
            }
            return AppPaginatedScroll(
              onRefresh: cubit.getShipments,
              items: orders,
              getPaginatedItems: (page) => cubit.getShipments(page: page),
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _SearchField(),
                    SizedBox(height: 12),
                    _Orders(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
