import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/helpers/validator.dart';
import 'package:jahzha_app/core/models/shipping/get_offers_dto.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';

import '../shipping_offers/view.dart';

part 'states.dart';

class SendShippingCubit extends Cubit<SendShippingStates> {
  SendShippingCubit({
    required this.isLocal,
  }) : super(SendShippingInit());

  final bool isLocal;

  static SendShippingCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final dto = GetOffersDTO();

  void getOffers() {
    if (!formKey.currentState!.validate()) return;
    RouteUtils.navigateTo(ShippingOffersView(
      dto: dto,
      isLocal: isLocal,
    ));
  }

  bool get isButtonEnabled {
    return dto.origin?.city != null &&
        dto.destination?.city != null &&
        Validator.weight(dto.weightTXController.text) == null;
  }

  bool get isStateLoading {
    return state is SendShippingLoading;
  }

  void _emit(SendShippingStates state) {
    if (!isClosed) {
      emit(state);
    }
  }

  @override
  Future<void> close() {
    dto.dispose();
    return super.close();
  }

  void updateUI() async {
    await Future.delayed(Duration(milliseconds: 500));
    _emit(SendShippingInit());
  }
}
