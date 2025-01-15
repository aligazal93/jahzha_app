import 'package:jahzha_app/core/models/shipping/shipping_offer_inputs.dart';

import '../../widgets/snack_bar.dart';
import '../models/cart/cart_response.dart';
import '../models/shipping/shipping_offer.dart';
import '../network_utils/network_utils.dart';

class CartDatasource {
  Future<bool> addToCart({
    required ShippingOffer offer,
    required ShippingOfferInputs inputs,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'create-shipment',
        formData: FormData.fromMap({
          'offer_id': offer.id,
          'company_id': offer.company.id,
          ...inputs.toJson(),
        }),
      );
      final success = response.statusCode! < 300;
      showSnackBar(
        response.getMessage,
        errorMessage: !success,
      );
      return success;
    } catch (e) {
      handleGenericException(e);
    }
    return false;
  }

  Future<CartResponse?> getCart({required int page}) async {
    try {
      final response = await NetworkUtils.get(
        'cart-items?page=$page',
      );
      final success = response.statusCode! < 300;
      if (success) {
        return CartResponse.fromJson(response.data);
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
}