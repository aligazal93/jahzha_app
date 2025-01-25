import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/datasources/cart.dart';
import 'package:jahzha_app/core/datasources/shipment.dart';
import 'package:jahzha_app/core/models/cart/payment_method.dart';
import 'package:jahzha_app/views/payment/view.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';

part 'states.dart';

class EditShipmentReceiverCubit extends Cubit<EditShipmentReceiverStates> {
  EditShipmentReceiverCubit({required this.shipmentID}) : super(EditShipmentReceiverInit());

  final int shipmentID;

  static EditShipmentReceiverCubit of(context) => BlocProvider.of(context);

  final _cartDatasource = CartDatasource();
  final _shipmentDatasource = ShipmentDatasource();
  final formKey = GlobalKey<FormState>();
  String? city;
  String? address;
  String? postalCode;
  List<PaymentMethod> paymentMethods = [];

  Future<void> submitEdit() async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) return;
    _emit(EditShipmentReceiverLoading());
    AppLoadingIndicator.show();
    final result = await _shipmentDatasource.editReceiverAddress(
      address: address!,
      postalCode: postalCode!,
      city: city!,
      shipmentID: shipmentID,
    );
    if (result) {
      paymentMethods = await _cartDatasource.getPaymentMethods();
    }
    await AppLoadingIndicator.hide();
    _emit(EditShipmentReceiverInit());
  }

  Future<void> checkout({
    required String paymentMethodID,
  }) async {
    AppLoadingIndicator.show();
    final result = await _shipmentDatasource.getEditReceiverAddressPaymentURL(
      paymentMethodID: paymentMethodID,
      shipmentID: shipmentID,
    );
    await AppLoadingIndicator.hide();
    if (result != null) {
      PaymentView(url: result).show();
    }
  }

  bool get isStateLoading {
    return state is EditShipmentReceiverLoading;
  }

  void _emit(EditShipmentReceiverStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}