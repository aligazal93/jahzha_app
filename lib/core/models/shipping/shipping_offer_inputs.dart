import 'shipping_input.dart';

class ShippingOfferInputs {
  final List<ShippingInput> shipper;
  final List<ShippingInput> receiver;
  final List<ShippingInput> general;
  final List<ShippingInput> shipments;

  ShippingOfferInputs({
    required this.shipper,
    required this.receiver,
    required this.general,
    required this.shipments,
  });

  factory ShippingOfferInputs.fromJson(Map<String, dynamic> json) {
    return ShippingOfferInputs(
      shipper: (json['shipper'] as List)
          .map((e) => ShippingInput.fromJson(e))
          .toList(),
      receiver: (json['receiver'] as List)
          .map((e) => ShippingInput.fromJson(e))
          .toList(),
      general: (json['shipment']['general_data'] as List)
          .map((e) => ShippingInput.fromJson(e))
          .toList(),
      shipments: (json['shipment']['items'] as List)
          .map((e) => ShippingInput.fromJson(e))
          .toList(),
    );
  }
}
