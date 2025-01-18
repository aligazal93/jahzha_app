import 'dart:async';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:jahzha_app/core/datasources/shipping.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/app_text_field_formatters.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/models/shipping/get_offers_dto.dart';
import 'package:jahzha_app/core/models/shipping/shipping_drop_down_item.dart';
import 'package:jahzha_app/core/models/shipping/shipping_input.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer_inputs.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/cart/view.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_country_picker.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_network_image.dart';
import 'package:jahzha_app/widgets/app_paginated_scroll.dart';
import 'package:jahzha_app/widgets/app_sheet.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
import 'package:jahzha_app/widgets/empty_view.dart';
import 'package:jahzha_app/widgets/google_places_text_form_field.dart';
import 'package:jahzha_app/widgets/image_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/helpers/utils.dart';
import '../../core/models/shipping/shipping_offer.dart';
import 'cubit.dart';

part 'units/sender_destination.dart';

part 'units/receiving_destination.dart';

part 'units/delivery_card.dart';

part 'units/ship_info.dart';

part 'units/buttons.dart';

part 'units/input.dart';

part 'units/create_shipment_app_bar.dart';

class CreateShipmentView extends StatelessWidget {
  const CreateShipmentView({
    Key? key,
    required this.offer,
    required this.inputs,
    required this.dto,
  }) : super(key: key);

  final ShippingOffer offer;
  final GetOffersDTO dto;
  final ShippingOfferInputs inputs;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocProvider(
        create: (context) => CreateShipmentCubit(
          offer: offer,
          inputs: inputs,
          dto: dto,
        ),
        child: BlocBuilder<CreateShipmentCubit, CreateShipmentStates>(
          builder: (context, state) {
            final cubit = CreateShipmentCubit.of(context);
            final currentPage = cubit.currentPage;
            return Scaffold(
              appBar: _CreateShipmentAppBar(
                title: 'Sending a shipment'.tr(),
                currentPage: currentPage,
              ),
              body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  key: cubit.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
              ),
              bottomNavigationBar: _Buttons(),
            );
          },
        ),
      ),
    );
  }
}
