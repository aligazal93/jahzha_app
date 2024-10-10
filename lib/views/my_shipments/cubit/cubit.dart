import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/coupons/view.dart';
import 'package:jahzha_app/views/home/view.dart';
import 'package:jahzha_app/views/menu/view.dart';
import 'package:jahzha_app/views/my_shipments/cubit/states.dart';
import 'package:jahzha_app/views/my_shipments/units/Canceled.dart';
import 'package:jahzha_app/views/my_shipments/units/finished.dart';
import 'package:jahzha_app/views/my_shipments/units/underway.dart';
import 'package:jahzha_app/views/my_shipments/view.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';



class MyShipmentsCubit extends Cubit<MyShipmentsStates> {
  MyShipmentsCubit() : super(MyShipmentsInitState());

  static MyShipmentsCubit of(context) => BlocProvider.of(context);


  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final pages = [
    UnderWayPage(),
    FinishedPage(),
    CanceledPage(),
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
    emit(MyShipmentsInitState());
  }

  Widget get getCurrentView => pages[currentIndex];



}