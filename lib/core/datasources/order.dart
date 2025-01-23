import 'package:jahzha_app/core/models/order/order.dart';
import 'package:jahzha_app/widgets/snack_bar.dart';

import '../models/order/order_details.dart';
import '../network_utils/network_utils.dart';

class OrderDatasource {
  Future<List<Order>> getOrders({
    required int page,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'user-shipments?page=$page',
      );
      final success = response.statusCode! < 300;
      if (success) {
        return (response.data['data'] as List).map((e) {
          return Order.fromJson(e);
        }).toList();
      }
    } catch (e) {
      handleGenericException(e);
    }
    return [];
  }

  Future<OrderDetails?> getOrderDetails({
    required int id,
  }) async {
    try {
      final response = await NetworkUtils.post(
        'user-shipment-details',
        data: {'id': id},
      );
      final success = response.statusCode! < 300;
      if (success) {
        return OrderDetails.fromJson(response.data);
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
