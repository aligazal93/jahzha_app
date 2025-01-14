import 'shipping_input.dart';

class ShippingOfferInputs {
  final List<ShippingInput> shipper;
  final List<ShippingInput> receiver;
  final List<ShippingInput> general;
  final List<ShippingInput> shipment;
  final List<ShippingInput> dimensions;

  ShippingOfferInputs({
    required this.shipper,
    required this.receiver,
    required this.general,
    required this.shipment,
    required this.dimensions,
  });

  factory ShippingOfferInputs.fromJson(Map<String, dynamic> json) {
    List<ShippingInput> shipper = [];
    List<ShippingInput> receiver = [];
    List<ShippingInput> general = [];
    List<ShippingInput> shipment = [];
    List<ShippingInput> dimensions = [];
    for (var e in json['shipper'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      shipper.add(ShippingInput.fromJson(e));
    }
    for (var e in json['receiver'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      receiver.add(ShippingInput.fromJson(e));
    }
    for (var e in json['general_data'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      general.add(ShippingInput.fromJson(e));
    }
    for (var e in json['shipment']['items'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      shipment.add(ShippingInput.fromJson(e));
    }
    for (var e in json['shipment']['dimensions'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      dimensions.add(ShippingInput.fromJson(e));
    }
    return ShippingOfferInputs(
      shipper: shipper,
      receiver: receiver,
      general: general,
      shipment: shipment,
      dimensions: dimensions,
    );
  }
}
