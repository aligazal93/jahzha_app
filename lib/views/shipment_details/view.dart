import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/extensions/string.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/core/helpers/launcher.dart';
import 'package:jahzha_app/core/network_utils/network_utils.dart';
import 'package:jahzha_app/views/shipment_details/cubit.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/no_data_found.dart';
import 'package:jahzha_app/widgets/app/qr_code_card.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import '../../widgets/app_button.dart';

part 'units/details_view.dart';

part 'units/tracking_view.dart';

part 'units/status_view.dart';

part 'units/tab_bar.dart';

class ShipmentDetailsView extends StatelessWidget {
  const ShipmentDetailsView({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShipmentDetailsCubit(id: id)..getDetails(),
      child: Scaffold(
        appBar: CustomAppBar(
          color: AppColors.secondary,
          title: 'My shipments'.tr(),
          titleColor: AppColors.white,
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(
            vertical: 16.height,
            horizontal: 16.width,
          ),
        ),
        body: BlocBuilder<ShipmentDetailsCubit, ShipmentDetailsStates>(
          builder: (context, state) {
            final cubit = ShipmentDetailsCubit.of(context);
            if (cubit.isStateLoading) {
              return AppLoadingIndicator();
            } else if (cubit.details == null) {
              return NoDataFoundView();
            }
            return ListView(
              children: [
                _TabBar(),
                [
                  _StatusView(),
                  _DetailsView(),
                  _TrackingView(),
                ][cubit.currentViewIndex],
              ],
            );
          },
        ),
      ),
    );
  }
}
