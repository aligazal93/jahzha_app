import 'package:easy_localization/easy_localization.dart';

class Order {
  final int id;
  final String trackingCode;
  final String deliveryType;
  final String companyLogo;
  final String delivery;
  final String expectedArrivalTime;

  Order({
    required this.id,
    required this.trackingCode,
    required this.deliveryType,
    required this.companyLogo,
    required this.delivery,
    required this.expectedArrivalTime,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      trackingCode: json['track_number'],
      deliveryType: json['delivery_type'],
      companyLogo: json['shipping_company_logo'],
      delivery: json['delivery_date'],
      expectedArrivalTime: json['expected_arrival_text'] ?? 'unknown'.tr(),
    );
  }
}
