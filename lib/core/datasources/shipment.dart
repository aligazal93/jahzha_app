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
        data: {if (trackNumber?.trim().isNotEmpty ?? false) 'track_number': trackNumber},
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
}
