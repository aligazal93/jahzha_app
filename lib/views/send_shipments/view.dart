import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/app_colors.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/cart/view.dart';
import 'package:jahzha_app/views/send_shipments/cubit/cubit.dart';
import 'package:jahzha_app/views/send_shipments/cubit/states.dart';
import 'package:jahzha_app/views/send_shipments/units/ship_info.dart';
import 'package:jahzha_app/widgets/app/sendShip_appBar.dart';
import 'package:jahzha_app/widgets/app/solid_appbar.dart';
import 'package:jahzha_app/widgets/app_button.dart';
import 'package:jahzha_app/widgets/app_drop_down_menu.dart';
import 'package:jahzha_app/widgets/app_text.dart';
import 'package:jahzha_app/widgets/app_text_field.dart';
part 'units/sender_destination.dart';
part 'units/receiving_destination.dart';
part 'units/delivery_card.dart';


class SendShipmentsView extends StatefulWidget {
  const SendShipmentsView({Key? key}) : super(key: key);

  @override
  State<SendShipmentsView> createState() => _SendShipmentsViewState();
}

class _SendShipmentsViewState extends State<SendShipmentsView> {
  PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendShipmentCubit(),
      child: Scaffold(
        appBar: SendShipmentAppBar(
          title: 'Sending a shipment'.tr(),
          currentPage: currentPage,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  children: [
                    SenderDestination(),
                    ReceivingDestination(),
                    BlocBuilder<SendShipmentCubit,SendShipmentStates>(
                      builder: (context, state) {
                        return ShipInfo();
                      },
                    )

                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentPage < 2)
                    Expanded(
                      child: AppButton(
                        titleFontSize: 14,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        constrainedAxis: Axis.horizontal,
                        title: 'Next'.tr(),
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },

                      ),
                    ),
                  if (currentPage ==  2)
                    Expanded(
                      child: AppButton(
                        titleFontSize: 14,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        constrainedAxis: Axis.horizontal,
                        title: 'add to cart'.tr(),
                        onTap: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                          RouteUtils.navigateTo(CartPageView());
                        },

                      ),
                    ),
                  if (currentPage > 0)
                    Expanded(
                      child: AppButton(
                        titleFontSize: 14,
                        padding: EdgeInsets.zero,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        constrainedAxis: Axis.horizontal,
                        color: AppColors.darkGrayBlue,
                        titleColor:AppColors.txtGray,
                        title: 'Previous'.tr(),
                        onTap: () {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },

                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
