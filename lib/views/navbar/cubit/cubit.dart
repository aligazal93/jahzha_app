import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit({required this.currentIndex}) : super(NavBarInitState());

  static NavBarCubit of(context) => BlocProvider.of(context);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void toggleTab(int value) {
    currentIndex = value;
    emit(NavBarInitState());
  }
}