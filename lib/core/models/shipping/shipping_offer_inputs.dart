import 'shipping_input.dart';

class ShippingOfferInputs {
  final List<ShippingInput> shipper;
  final List<ShippingInput> receiver;
  final List<ShippingInput> general;
  final List<ShippingInput> shipment;
  final List<ShippingInput> dimensions;
  final List<ShippingInput> radios;
  final List<List<ShippingInput>> additionalShipments = [];

  ShippingOfferInputs({
    required this.shipper,
    required this.receiver,
    required this.general,
    required this.shipment,
    required this.radios,
    required this.dimensions,
  });

  factory ShippingOfferInputs.fromJson(Map<String, dynamic> json) {
    List<ShippingInput> shipper = [];
    List<ShippingInput> receiver = [];
    List<ShippingInput> general = [];
    List<ShippingInput> shipment = [];
    List<ShippingInput> dimensions = [];
    List<ShippingInput> radios = [];
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
    for (var e in json['shipment']['radio'] ?? []) {
      if (e['type'] == 'hidden') {
        continue;
      }
      radios.add(ShippingInput.fromJson(e));
    }
    return ShippingOfferInputs(
      shipper: shipper,
      receiver: receiver,
      general: general,
      shipment: shipment,
      dimensions: dimensions,
      radios: radios,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    for (var i in shipper) {
      data.addAll(i.toJson(replaceAsteriskWith: ''));
    }
    for (var i in receiver) {
      data.addAll(i.toJson(replaceAsteriskWith: ''));
    }
    for (var i in general) {
      data.addAll(i.toJson(replaceAsteriskWith: ''));
    }
    for (var i in dimensions) {
      data.addAll(i.toJson(replaceAsteriskWith: ''));
    }
    for (var i in radios) {
      data.addAll(i.toJson(replaceAsteriskWith: ''));
    }
    for (var i in shipment) {
      data.addAll(i.toJson(replaceAsteriskWith: '0'));
    }
    for (var i = 0; i < additionalShipments.length; i++) {
      final shipment = additionalShipments[i];
      for (var e in shipment) {
        data.addAll(e.toJson(replaceAsteriskWith: '${i + 1}'));
      }
    }
    return data;
  }

  void addAdditionalShipment() {
    additionalShipments.add(shipment.map((e) => e.copy()).toList());
  }

  void removeAdditionalShipment(List<ShippingInput> value) {
    additionalShipments.remove(value);
  }
}
