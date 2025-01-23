import 'shipment.dart';

class MyShipmentsResponse {
  final String? pendingShipmentText;
  final List<Shipment> shipments;

  MyShipmentsResponse({
    required this.pendingShipmentText,
    required this.shipments,
  });

  factory MyShipmentsResponse.fromJson(Map<String, dynamic> json) {
    return MyShipmentsResponse(
      pendingShipmentText: json['additional_data']?['pending_shipment_text'],
      shipments: (json['data'] as List).map((e) {
        return Shipment.fromJson(e);
      }).toList(),
    );
  }
}
