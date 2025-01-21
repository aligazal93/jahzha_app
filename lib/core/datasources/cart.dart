import 'package:easy_localization/easy_localization.dart';
import 'package:jahzha_app/core/models/shipping/shipping_offer_inputs.dart';

import '../../widgets/app/home_app_bar.dart';
import '../../widgets/snack_bar.dart';
import '../models/cart/cart_response.dart';
import '../models/cart/payment_method.dart';
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
      if (success) {
        CartButton.refreshCount();
      }
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

  Future<int> getCartCount() async {
    try {
      final response = await NetworkUtils.get(
        'cart-items?page=1',
      );
      final success = response.statusCode! < 300;
      if (success) {
        return int.tryParse(response.data['additional_data']['total_items'].toString()) ?? 0;
      }
      showSnackBar(
        response.getMessage,
        errorMessage: true,
      );
    } catch (e) {
      handleGenericException(e);
    }
    return 0;
  }

  Future<bool> removeFromCart({required String id,}) async {
    try {
      final response = await NetworkUtils.post(
        'delete-cart-item',
        data: {'id': id},
      );
      final success = response.statusCode! < 300;
      if (success) {
        CartButton.refreshCount();
      }
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

  Future<bool> applyCoupon({required String code}) async {
    try {
      final response = await NetworkUtils.post(
        'apply-coupon',
        data: {'code': code},
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

  Future<bool> removeCoupon({required String code}) async {
    try {
      final response = await NetworkUtils.post(
        'remove-coupon',
        data: {'code': code}
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

  Future<List<PaymentMethod>> getPaymentMethods() async {
    try {
      final response = await NetworkUtils.get('payment-methods');
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data']['payment_methods'] as List).map((e) => PaymentMethod.fromJson(e)).toList();
      }
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }

  Future<String?> getPaymentURL({
    required String paymentMethodID,
  }) async {
    try {
      final checkoutID = await _getCheckoutID(
        paymentMethodID: paymentMethodID,
      );
      if (checkoutID != null) {
        final response = await NetworkUtils.post(
          'payment-link',
          data: {
            'checkout_id': checkoutID,
            'payment_method_id': paymentMethodID
          },
        );
        final success = response.statusCode! < 300;
        if (success) {
          return response.data['data']['payment_link'];
        }
      }
      showSnackBar(
        'something_went_wrong'.tr(),
        errorMessage: true,
      );
    } catch (e) {
      handleGenericException(e);
    }
    return null;
  }

  Future<String?> _getCheckoutID({required String paymentMethodID}) async {
    try {
      final response = await NetworkUtils.post(
        'process-payment',
        data: {'payment_method_id': paymentMethodID},
      );
      final success = response.statusCode! < 300;
      if (success) {
        return response.data['data']['checkout_id'];
      }
    } catch (e) {
      handleGenericException(e);
    }
    return null;
  }
}