import '../../widgets/snack_bar.dart';
import '../models/shipping/get_local_offers_dto.dart';
import '../models/shipping/shipping_offer.dart';
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
}
