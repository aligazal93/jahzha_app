import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jahzha_app/core/caching_utils/caching_utils.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/views/my_shipments/cubit/cubit.dart';
import 'package:jahzha_app/views/my_shipments/cubit/states.dart';
import 'package:jahzha_app/widgets/app/app_bar.dart';
import 'package:jahzha_app/widgets/app/home_app_bar.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
import 'package:jahzha_app/widgets/loading_indicator.dart';
part 'units/ship_card.dart';

class MyShipmentsView extends StatefulWidget {
  const MyShipmentsView({Key? key}) : super(key: key);

  @override
  State<MyShipmentsView> createState() => _MyShipmentsViewState();
}

class _MyShipmentsViewState extends State<MyShipmentsView> with SingleTickerProviderStateMixin {
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
      create: (context) => MyShipmentsCubit(),
      child: Scaffold(
        appBar: HomeAppBar(
          name: CachingUtils.user?.data.name == null ? 'in Jahzha'.tr() : CachingUtils.user?.data.name,
          title: 'My shipments'.tr(),
        ),
        body: BlocBuilder<MyShipmentsCubit , MyShipmentsStates>(
          builder: (context, state) {
            final cubit = MyShipmentsCubit.of(context);
            return Column(
              children: [
                Row(
                  children: [
                    ShipCard(
                      title: 'Underway'.tr(),
                      index: 0,
                    ),
                    ShipCard(
                      title: 'Finished'.tr(),
                      index: 1,
                    ),
                    ShipCard(
                      title: 'Canceled'.tr(),
                      index: 2,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                  child: AppTextField(
                    hint: 'Search for shipments'.tr(),
                    suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass),

                  ),
                ),
                state is MyShipmentsLoadingState ? LoadingIndicator() :
                   cubit.getCurrentView
              ],
            );
          },
        ),
      ),
    );
  }
}
