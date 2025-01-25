import 'package:easy_localization/easy_localization.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../models/shipment/my_shipments_response.dart';
import '../models/shipment/shipment_details.dart';
import '../network_utils/network_utils.dart';

class ShipmentDatasource {
  Future<MyShipmentsResponse?> getMyShipments({
    String? trackNumber,
    required int page,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'user-shipments?page=$page',
        data: {
          if (trackNumber?.trim().isNotEmpty ?? false)
            'track_number': trackNumber
        },
      );
      final success = response.statusCode! < 300;
      if (success) {
        return MyShipmentsResponse.fromJson(response.data);
      }
    } catch (e) {
      handleGenericException(e);
    }
    return null;
  }

  Future<ShipmentDetails?> getShipmentDetails({
    required int id,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'user-shipment-details',
        data: {'id': id},
      );
      final success = response.statusCode! < 300;
      if (success) {
        return ShipmentDetails.fromJson(response.data);
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

  Future<bool> editReceiverAddress({
    required String address,
    required String postalCode,
    required String city,
    required int shipmentID,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'change-receiver-address',
        data: {
          "receiver_address": address,
          "receiver_postal_code": postalCode,
          "receiver_city": city,
          "shipment_id": shipmentID,
        },
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

  Future<String?> getEditReceiverAddressPaymentURL({
    required String paymentMethodID,
    required int shipmentID,
  }) async {
    try {
      final checkoutID = await _getCheckoutID(
        paymentMethodID: paymentMethodID,
        shipmentID: shipmentID,
      );
      if (checkoutID != null) {
        final response = await NetworkUtils.post(
          'change-address-payment-link',
          data: {
            'checkout_id': checkoutID,
            'payment_method_id': paymentMethodID,
            "shipment_id": shipmentID,
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

  Future<String?> _getCheckoutID({
    required String paymentMethodID,
    required int shipmentID,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'change-address-process-payment',
        data: {
          'payment_method_id': paymentMethodID,
          "shipment_id": shipmentID,
        },
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
