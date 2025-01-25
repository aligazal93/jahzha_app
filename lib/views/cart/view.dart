import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/app_status.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/checkout/view.dart';
import 'package:jahzha_app/views/navbar/view.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/cart_card.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_paginated_scroll.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import 'cubit.dart';

part 'units/coupon.dart';
part 'units/receipt.dart';
part 'units/shipments.dart';
part 'units/shipments_count.dart';

class CartPageView extends StatelessWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'the cart'.tr(),
        ),
        body: BlocBuilder<CartCubit, CartStates>(
          builder: (context, state) {
            final cubit = CartCubit.of(context);
            if (cubit.isStateLoading) {
              return AppLoadingIndicator();
            } else if (cubit.cart?.shipments.isEmpty ?? true) {
              return NoDataFoundView();
            }
            print(cubit.cart);
            return SafeArea(
              child: AppPaginatedScroll(
                items: cubit.cart!.shipments,
                onRefresh: cubit.getCart,
                getPaginatedItems: cubit.getCart,
                builder: (context) {
                  return ListView(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      0,
                      16,
                      Platform.isAndroid ? 16 : 0,
                    ),
                    children: [
                      _ShipmentsCount(),
                      _Receipt(),
                      _Coupon(),
                      _Shipments(),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
