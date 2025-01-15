import 'cart_shipment.dart';

class CartResponse {
  final List<CartShipment> shipments;
  final String? note1;
  final String? note2;
  final String? shippingPrice;
  final String? couponDiscount;
  final String? pickupPrice;
  final String? totalPrice;
  final String? totalShipmentsCount;

  CartResponse({
    required this.shipments,
    required this.note1,
    required this.note2,
    required this.shippingPrice,
    required this.couponDiscount,
    required this.pickupPrice,
    required this.totalPrice,
    required this.totalShipmentsCount,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    var additionalData = json['additional_data'];
    if (additionalData.toString() == '[]') {
      additionalData = {};
    }
    return CartResponse(
      shipments: (json['data'] as List).map((e) => CartShipment.fromJson(e)).toList(),
      note1: additionalData?['note1'],
      note2: additionalData?['note2'],
      shippingPrice: additionalData?['shipping_price'],
      couponDiscount: additionalData?['coupon_discount'],
      pickupPrice: additionalData?['pickup_price'],
      totalPrice: additionalData?['total_price'],
      totalShipmentsCount: additionalData?['total_items']?.toString(),
    );
  }
}
