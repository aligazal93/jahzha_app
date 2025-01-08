import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';

import '../availiable_offers/view.dart';

part 'states.dart';

class LocalShippingCubit extends Cubit<LocalShippingStates> {
  LocalShippingCubit() : super(LocalShippingInit());

  static LocalShippingCubit of(context) => BlocProvider.of(context);

  final pageController = PageController();
  int currentPage = 0;
  final weightTXController = TextEditingController();
  final senderTXController = TextEditingController();
  final receiverTXController = TextEditingController();
  Prediction? senderPrediction;
  Prediction? receiverPrediction;

  Future<void> getOffers() async {
    print(senderPrediction!.city);
    print(receiverPrediction!.city);
  }

  void nextPage() {
    if (currentPage >= 2) {
      getOffers();
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
    weightTXController.dispose();
    receiverTXController.dispose();
    senderTXController.dispose();
    return super.close();
  }
}