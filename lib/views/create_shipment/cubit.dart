import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/shipping/shipping_offer_inputs.dart';

part 'states.dart';

class CreateShipmentCubit extends Cubit<CreateShipmentStates> {
  CreateShipmentCubit({required this.inputs}) : super(CreateShipmentInit());

  final ShippingOfferInputs inputs;

  static CreateShipmentCubit of(context) => BlocProvider.of(context);

  final pageController = PageController();
  int currentPage = 0;

  bool get isStateLoading {
    return state is CreateShipmentLoading;
  }

  void _emit(CreateShipmentStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}