class CartShipment {
  final String id;
  final String itemNumber;
  final num totalPrice;
  final String shipperAddress;
  final String shipperPhone;
  final String shipperEmail;
  final String? receiverAddress;
  final String? receiverPhone;
  final String? receiverEmail;
  final String? arrivalTime;

  CartShipment({
    required this.id,
    required this.itemNumber,
    required this.totalPrice,
    required this.shipperAddress,
    required this.shipperPhone,
    required this.shipperEmail,
    required this.receiverAddress,
    required this.receiverPhone,
    required this.receiverEmail,
    required this.arrivalTime,
  });

  factory CartShipment.fromJson(Map<String, dynamic> json) {
    return CartShipment(
      id: json["id"],
      itemNumber: json["item_number"],
      totalPrice: num.parse(json["total_price"].toString()),
      shipperAddress: json['shipper_details']["address"],
      shipperPhone: json['shipper_details']["phone"],
      shipperEmail: json['shipper_details']["email"],
      receiverAddress: json['receiver_details']?["address"],
      receiverPhone: json['receiver_details']?["phone"],
      receiverEmail: json['receiver_details']?["email"],
      arrivalTime: json['shipment_details']?["expected_arrival_text"],
    );
  }
}
