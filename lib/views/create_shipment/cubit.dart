import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../../core/models/shipping/get_offers_dto.dart';
import '../../core/models/shipping/shipping_offer_inputs.dart';
import '../../core/route_utils/route_utils.dart';
import '../../widgets/alerting_dialog.dart';
import '../cart/view.dart';

part 'states.dart';

class CreateShipmentCubit extends Cubit<CreateShipmentStates> {
  CreateShipmentCubit({
    required this.offer,
    required this.inputs,
    required this.dto,
  }) : super(CreateShipmentInit());

  final ShippingOffer offer;
  final GetOffersDTO dto;
  final ShippingOfferInputs inputs;

  static CreateShipmentCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final pageController = PageController();
  int currentPage = 0;
  Map<String, Prediction?> predictions = {
    "shipper['street']": null,
    "receiver['street']": null,
  };

  Future<void> addToCart() async {
    if (!validate()) {
      return;
    }
    await AppLoadingIndicator.show();
    final result = await CartDatasource().addToCart(
      offer: offer,
      inputs: inputs,
    );
    await AppLoadingIndicator.hide();
    if (result) {
      RouteUtils.navigateAndPopUntilFirstPage(CartPageView());
    }
  }

  void nextPage() {
    if (!validate()) {
      return;
    }
    currentPage++;
    pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _emit(CreateShipmentInit());
  }

  bool validate() {
    if (!formKey.currentState!.validate() || !_validateRadios()) {
      showSnackBar(
        'please_fill_all_required_fields'.tr(),
        errorMessage: true,
      );
      return false;
    }
    return true;
  }

  bool _validateRadios() {
    if (currentPage != 2) {
      return true;
    }
    return inputs.radios.firstWhereOrNull((e) {
      return e.validation.required && e.controller.text != '1';
    }) == null;
  }

  void previousPage() async {
    if (currentPage == 0) {
      final result = await AlertingDialog.show(
        alertTitle: "discard_changes".tr(),
        confirmTitle: "discard_and_leave".tr(),
        cancelTitle: "keep".tr(),
      );
      if (result) {
        RouteUtils.pop();
      }
      return;
    }
    currentPage--;
    pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _emit(CreateShipmentInit());
  }

  void updateUI() {
    _emit(CreateShipmentInit());
  }

  /// TO Handle Shipper and Receiver Address to be less than 15 km
  bool addPrediction({
    required String id,
    required Prediction v,
  }) {
    predictions[id] = v;
    final values = predictions.values;
    if (values.contains(null)) {
      return true;
    }
    final distance = Geolocator.distanceBetween(
      double.parse(values.first!.lat!),
      double.parse(values.first!.lng!),
      double.parse(values.last!.lat!),
      double.parse(values.last!.lng!),) / 1000;
    if (distance > 15) {
      predictions[id] = null;
      showSnackBar(
        'distance_must_be_less_than_15km'.tr(),
        errorMessage: true,
      );
      return false;
    }
    return true;
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