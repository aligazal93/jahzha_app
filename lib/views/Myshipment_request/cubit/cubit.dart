import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/Myshipment_request/cubit/states.dart';
import 'package:jahzha_app/views/Myshipment_request/units/orderDetails.dart';
import 'package:jahzha_app/views/Myshipment_request/units/orderStatues.dart';
import 'package:jahzha_app/views/Myshipment_request/units/orderTracking.dart';
import 'package:jahzha_app/views/my_shipments/units/Canceled.dart';
import 'package:jahzha_app/views/my_shipments/units/finished.dart';
import 'package:jahzha_app/views/order_tracking/view.dart';



class ShipmentRequestCubit extends Cubit<ShipmentsRequestsStates> {
  ShipmentRequestCubit() : super(ShipmentsRequestsInitState());

  static ShipmentRequestCubit of(context) => BlocProvider.of(context);


  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final pages = [
    OrderStatuesView(),
    OrderDetailsView(),
    ShipOrderTracking()
  ];

  // void init() async {
  //   emit(NavBarLoadingState());
  //   final isAssigned = await LocationManager.isLocationAssigned();
  //   if (!isAssigned) {
  //     RouteManager.navigateAndPopAll(SelectLocationView());
  //   }
  //   emit(NavBarInitState());
  // }

  void toggleTab(int value) {
    currentIndex = value;
    emit(ShipmentsRequestsInitState());
  }

  Widget get getCurrentView => pages[currentIndex];



}