import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/models/shipping/get_offers_dto.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';

import '../shipping_offers/view.dart';

part 'states.dart';

class SendShippingCubit extends Cubit<SendShippingStates> {
  SendShippingCubit({required this.isLocal}) : super(SendShippingInit());

  final bool isLocal;

  static SendShippingCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final pageController = PageController();
  final dto = GetOffersDTO();
  int currentPage = 0;

  void nextPage() {
    if (!formKey.currentState!.validate()) return;
    if (currentPage >= 2) {
      RouteUtils.navigateTo(ShippingOffersView(
        dto: dto,
        isLocal: isLocal,
      ));
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage++;
    _emit(SendShippingInit());
  }

  void previousPage() {
    if (currentPage <= 0) {
      RouteUtils.pop();
      return;
    }
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage--;
    _emit(SendShippingInit());
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
    pageController.dispose();
    dto.dispose();
    return super.close();
  }

  void updateUI() async {
    await Future.delayed(Duration(milliseconds: 500));
    _emit(SendShippingInit());
  }
}