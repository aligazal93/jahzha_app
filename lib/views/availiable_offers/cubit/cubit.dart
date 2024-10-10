import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/views/availiable_offers/cubit/states.dart';
import 'package:jahzha_app/views/availiable_offers/view.dart';

class AvailableOffersCubit extends Cubit<AvailableOffersStates> {
  AvailableOffersCubit() : super(AvailableOffersInitStates());
  bool isChecked = false;

  static AvailableOffersCubit of(context) => BlocProvider.of(context);

  // void toggleTerms(bool isChecked) {
  //   this.isChecked = isChecked;
  //   emit(AvailableOffersInitStates());
  // }
  //



}