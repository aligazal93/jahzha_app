import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/models/cart/cart_response.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';

import '../../core/helpers/app_colors.dart';
import '../../widgets/app_text.dart';
import 'cubit.dart';

part 'units/payment_methods.dart';
part 'units/receipt.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final CartResponse cart;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckoutCubit(cart: cart)..getPaymentMethods(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: "checkout".tr(),
        ),
        body: BlocBuilder<CheckoutCubit, CheckoutStates>(
          builder: (context, state) {
            final cubit = CheckoutCubit.of(context);
            if (cubit.isStateLoading) {
              return AppLoadingIndicator();
            } else if (cubit.paymentMethods.isEmpty) {
              return NoDataFoundView();
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Receipt(),
                  SizedBox(height: 12),
                  AppText(
                    title: 'payment_methods'.tr(),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  SizedBox(height: 12),
                  _PaymentMethods(),
                  /// Payment methods
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
