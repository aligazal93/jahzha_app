import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/dimensions.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';

import '../../core/helpers/utils.dart';
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
    return Scaffold(
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
      body: ListView(
        children: [
          _TabBar(),
          [
            _StatusView(),
            _DetailsView(),
            _TrackingView(),
          ][0],
        ],
      ),
    );
  }
}
