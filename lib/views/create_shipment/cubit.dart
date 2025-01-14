import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/models/shipping/get_offers_dto.dart';
import '../../core/models/shipping/shipping_offer_inputs.dart';
import '../../core/route_utils/route_utils.dart';
import '../cart/view.dart';

part 'states.dart';

class CreateShipmentCubit extends Cubit<CreateShipmentStates> {
  CreateShipmentCubit({
    required this.inputs,
    required this.dto,
  }) : super(CreateShipmentInit());

  final GetOffersDTO dto;
  final ShippingOfferInputs inputs;

  static CreateShipmentCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final pageController = PageController();
  int currentPage = 0;

  Future<void> addToCart() async {
    if (!formKey.currentState!.validate()) return;
    RouteUtils.navigateTo(CartPageView());
  }

  void nextPage() {
    if (!formKey.currentState!.validate()) return;
    currentPage++;
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _emit(CreateShipmentInit());
  }

  void previousPage() {
    currentPage--;
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _emit(CreateShipmentInit());
  }

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