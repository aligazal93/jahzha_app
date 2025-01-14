import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/coupons/view.dart';
import 'package:jahzha_app/views/home/view.dart';
import 'package:jahzha_app/views/menu/view.dart';
import 'package:jahzha_app/views/my_shipments/view.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarInitState());

  static NavBarCubit of(context) => BlocProvider.of(context);


  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  final pages = [
    HomeView(),
    MyShipmentsView(),
    CouponsView(),
    MenuView(),

  ];

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }


  void toggleTab(int value) {
    currentIndex = value;
    emit(NavBarInitState());
  }

  Widget get getCurrentView => pages[currentIndex];



}