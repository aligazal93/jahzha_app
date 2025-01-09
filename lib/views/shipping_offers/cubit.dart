import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/models/shipping/get_local_offers_dto.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';

import '../../core/datasources/shipping.dart';

part 'states.dart';

class ShippingOffersCubit extends Cubit<ShippingOffersStates> {
  ShippingOffersCubit({
    required this.dto,
    required this.isLocal,
  }) : super(ShippingOffersInit());

  final bool isLocal;
  final GetOffersDTO dto;

  static ShippingOffersCubit of(context) => BlocProvider.of(context);

  List<ShippingOffer> offers = [];
  List<ShippingOffer> comparisonOffers = [];
  List<ShippingOffer> filteredOffers = [];

  Future<void> getOffers() async {
    _emit(ShippingOffersLoading());
    offers = await ShippingDatasource().getOffers(
      isLocal: isLocal,
      dto: dto,
    );
    _emit(ShippingOffersInit());
  }

  Future<void> toggleComparison(ShippingOffer offer) async {
    if (comparisonOffers.contains(offer)) {
      comparisonOffers.remove(offer);
    } else {
      if (comparisonOffers.length == 2) {
        comparisonOffers[0].addToComparison = false;
        comparisonOffers.removeAt(0);
      }
      comparisonOffers.add(offer);
    }
    _emit(ShippingOffersInit());
  }

  void updateUI() {
    _emit(ShippingOffersInit());
  }

  void resetFilters() {
    dto.filterPriceInDescendingOrder = null;
    dto.orderByFastest = null;
    dto.orderByNewest = null;
    filteredOffers.clear();
    _emit(ShippingOffersInit());
  }

  Future<void> filterOffers() async {
    _emit(ShippingOffersLoading());
    filteredOffers = await ShippingDatasource().getOffers(
      isLocal: isLocal,
      dto: dto,
    );
    _emit(ShippingOffersInit());
  }

  bool get isStateLoading {
    return state is ShippingOffersLoading;
  }

  void _emit(ShippingOffersStates state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
