import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jahzha_app/core/models/shipping/get_offers_dto.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer.dart';
import 'package:jahzha_app/core/route_utils/route_utils.dart';
import 'package:jahzha_app/widgets/app_loading_indicator.dart';

import '../../core/datasources/shipping.dart';
import '../../core/models/shipping_lat_lng.dart';
import '../create_shipment/view.dart';

part 'states.dart';

class ShippingOffersCubit extends Cubit<ShippingOffersStates> {
  ShippingOffersCubit({
    required this.dto,
    required this.isLocal,
  }) : super(ShippingOffersInit());

  final bool isLocal;
  final GetOffersDTO dto;

  static ShippingOffersCubit of(context) => BlocProvider.of(context);

  final _datasource = ShippingDatasource();

  List<ShippingOffer> offers = [];
  List<ShippingOffer> comparisonOffers = [];
  List<ShippingOffer> filteredOffers = [];

  Future<void> getOffers() async {
    _emit(ShippingOffersLoading());
    offers = await _datasource.getOffers(
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

  Future<void> orderOffer({
    required ShippingOffer offer,
    ShippingLatLng? origin,
    ShippingLatLng? destination,
  }) async {
    await AppLoadingIndicator.show();
    final result = await _datasource.getOfferInputs(
      offer: offer,
      type: offer.pickupType,
      careemOriginLatLng: origin,
      careemDestinationLatLng: destination,
    );
    await AppLoadingIndicator.hide();
    if (result != null) {
      for (final input in result.shipper) {
        if (input.requestKey.contains('[phone]')) {
          input.phoneCode = CountryCode.fromCountryCode(dto.origin!.countryCode!).dialCode;
        }
      }
      for (final input in result.receiver) {
        if (input.requestKey.contains('[phone]')) {
          input.phoneCode = CountryCode.fromCountryCode(dto.destination!.countryCode!).dialCode;
        }
      }
      RouteUtils.navigateTo(CreateShipmentView(
        offer: offer,
        dto: dto,
        inputs: result,
      ));
    }
    updateUI();
  }

  void updateUI() {
    _emit(ShippingOffersInit());
  }

  void resetFilters() {
    dto.filterPriceInDescendingOrder = null;
    dto.orderByFastest = null;
    dto.orderByNewest = null;
    dto.orderByCheapest = null;
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
