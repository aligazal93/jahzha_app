import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer_inputs.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/cart/view.dart';
import 'package:jahzha_app/widgets/app/sendShip_appBar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
import 'cubit.dart';

part 'units/sender_destination.dart';
part 'units/receiving_destination.dart';
part 'units/delivery_card.dart';
part 'units/ship_info.dart';
part 'units/buttons.dart';

class CreateShipmentView extends StatelessWidget {
  const CreateShipmentView({Key? key, required this.inputs}) : super(key: key);

  final ShippingOfferInputs inputs;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateShipmentCubit(
        inputs: inputs,
      ),
      child: BlocBuilder<CreateShipmentCubit, CreateShipmentStates>(
        builder: (context, state) {
          final cubit = CreateShipmentCubit.of(context);
          final currentPage = cubit.currentPage;
          return Scaffold(
            appBar: SendShipmentAppBar(
              title: 'Sending a shipment'.tr(),
              currentPage: currentPage,
            ),
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: PageView(
                controller: cubit.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _ShipperPage(),
                  _ReceiverPage(),
                  _ShipmentPage(),
                ],
              ),
            ),
            bottomNavigationBar: _Buttons(),
          );
        },
      ),
    );
  }
}
