import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';

import '../../widgets/google_places_text_form_field.dart';
import 'cubit.dart';

part 'units/receiver_fields.dart';
part 'units/sender_fields.dart';
part 'units/shipment_fields.dart';

class SendShippingView extends StatelessWidget {
  const SendShippingView({
    Key? key,
    required this.isLocal,
  }) : super(key: key);

  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendShippingCubit(isLocal: isLocal),
      child: BlocBuilder<SendShippingCubit, SendShippingStates>(
        builder: (context, state) {
          final cubit = SendShippingCubit.of(context);
          return Scaffold(
            appBar: CustomAppBar(
              title:
                  (isLocal ? 'Local shipping' : 'international shipping').tr(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    _section(
                      title: 'Shipment details'.tr(),
                      icon: FontAwesomeIcons.boxOpen,
                      child: _ShipmentFields(),
                    ),
                    SizedBox(height: 16),
                    _section(
                      title: 'Sending side'.tr(),
                      icon: FontAwesomeIcons.locationArrow,
                      child: _SenderFields(),
                    ),
                    SizedBox(height: 16),
                    _section(
                      title: 'Shipment details'.tr(),
                      icon: FontAwesomeIcons.locationArrow,
                      child: _ReceiverFields(),
                    ),
                    SizedBox(height: 24),
                    SafeArea(
                      child: AppButton(
                        titleFontSize: 14,
                        margin: EdgeInsets.only(bottom: 16),
                        constrainedAxis: Axis.horizontal,
                        title: 'Get offers'.tr(),
                        onTap: cubit.isButtonEnabled ? cubit.getOffers : null,
                      ),
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

  Widget _section({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
            ),
            SizedBox(width: 12),
            AppText(
              title: title,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(12),
          child: child,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.tGray,
          ),
        ),
      ],
    );
  }
}
