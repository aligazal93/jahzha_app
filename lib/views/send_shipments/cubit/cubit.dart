import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/views/coupons/view.dart';
import 'package:jahzha_app/views/home/view.dart';
import 'package:jahzha_app/views/menu/view.dart';
import 'package:jahzha_app/views/my_shipments/view.dart';
import 'package:jahzha_app/views/navbar/cubit/states.dart';
import 'package:jahzha_app/views/send_shipments/cubit/states.dart';
import 'package:jahzha_app/views/send_shipments/view.dart';



class SendShipmentCubit extends Cubit<SendShipmentStates> {
  SendShipmentCubit() : super(SendShipmentInitStates());

  static SendShipmentCubit of(context) => BlocProvider.of(context);


  int currentIndex = 0;
  int deliveryIndex = 0;


  void toggleTab(int value) {
    currentIndex = value;
    emit(SendShipmentInitStates());
  }
  void toggleTabDelivery(int value) {
    deliveryIndex = value;
    emit(SendShipmentInitStates());
  }

}