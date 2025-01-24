import '../../widgets/snack_bar.dart';
import '../models/shipping/get_offers_dto.dart';
import '../models/shipping/shipping_drop_down_item.dart';
import '../models/shipping/shipping_offer.dart';
import '../models/shipping/shipping_offer_inputs.dart';
import '../models/shipping_lat_lng.dart';
import '../network_utils/network_utils.dart';

class ShippingDatasource {
  Future<List<ShippingOffer>> getOffers({
    required bool isLocal,
    required GetOffersDTO dto,
  }) async {
    try {
      final response = await NetworkUtils.post(
        isLocal ? 'domestic-shipment-offers' : 'international-shipment-offers',
        data: dto.toJson(isLocal: isLocal),
      );
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data'] as List)
            .map((e) => ShippingOffer.fromJson(e))
            .toList();
      }
      showSnackBar(
        response.getMessage,
        errorMessage: true,
      );
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }

  Future<ShippingOfferInputs?> getOfferInputs({
    required ShippingOffer offer,
    required PickupType type,
    ShippingLatLng? careemOriginLatLng,
    ShippingLatLng? careemDestinationLatLng,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'submit-shipping-offer',
        data: {
          'offer_id': offer.id,
          'pickup_type': type.id,
          if (careemOriginLatLng != null &&
              careemDestinationLatLng != null) ...{
            'careem_origin_lat': careemOriginLatLng.lat,
            'careem_origin_lng': careemOriginLatLng.lng,
            'careem_destination_lat': careemDestinationLatLng.lat,
            'careem_destination_lng': careemDestinationLatLng.lng,
          },
        },
      );
      final success = response.statusCode! < 300;
      if (success) {
        return ShippingOfferInputs.fromJson(response.data['data']);
      }
      showSnackBar(
        response.getMessage,
        errorMessage: true,
      );
    } catch (e) {
      handleGenericException(e);
    }
    return null;
  }

  Future<List<ShippingDropDownItem>> getDropDownItems({
    required int page,
    required String offerID,
    required String inputID,
    String? search,
}) async {
    try {
      final response = await NetworkUtils.post(
        'all-inputs-select-data?page=$page',
        data: {
          "offer_id": offerID,
          "input_select_id": inputID,
          if (search?.trim().isNotEmpty ?? false) "keyword": search,
        },
      );
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data'] as List)
            .map((e) => ShippingDropDownItem.fromJson(e))
            .toList();
      }
      showSnackBar(
        response.getMessage,
        errorMessage: true,
      );
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }
}
