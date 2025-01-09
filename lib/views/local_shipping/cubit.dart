import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/models/shipping/get_local_offers_dto.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';

import '../shipping_offers/view.dart';

part 'states.dart';

class LocalShippingCubit extends Cubit<LocalShippingStates> {
  LocalShippingCubit() : super(LocalShippingInit());

  static LocalShippingCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final pageController = PageController();
  final dto = GetOffersDTO();
  int currentPage = 0;

  void nextPage() {
    if (!formKey.currentState!.validate()) return;
    if (currentPage >= 2) {
      RouteUtils.navigateTo(ShippingOffersView(
        dto: dto,
        isLocal: true,
      ));
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPage++;
    _emit(LocalShippingInit());
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
    _emit(LocalShippingInit());
  }

  bool get isStateLoading {
    return state is LocalShippingLoading;
  }

  void _emit(LocalShippingStates state) {
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
}