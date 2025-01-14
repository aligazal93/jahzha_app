import 'shipping_company.dart';

class ShippingOffer {
  final String id;
  final ShippingCompany company;
  final String? estimatedDeliveryTime;
  final String insuranceText;
  final bool isNew;
  final bool isFastest;
  final bool isCheapest;
  final num price;
  final String currency;
  final bool pickupByCompany;
  final bool pickupByCareem;
  final num pickupByCareemFees;
  final num pickupByCompanyFees;

  PickupType pickupType = PickupType.myself;
  bool addToComparison = false;

  num get priceWithFees {
    switch (pickupType) {
      case PickupType.myself:
        return price;
      case PickupType.careem:
        return price + pickupByCareemFees;
      case PickupType.company:
        return price + pickupByCompanyFees;
    }
  }

  ShippingOffer({
    required this.id,
    required this.company,
    required this.estimatedDeliveryTime,
    required this.insuranceText,
    required this.isNew,
    required this.isFastest,
    required this.isCheapest,
    required this.price,
    required this.currency,
    required this.pickupByCompany,
    required this.pickupByCareem,
    required this.pickupByCareemFees,
    required this.pickupByCompanyFees,
  });

  factory ShippingOffer.fromJson(Map<String, dynamic> json) {
    return ShippingOffer(
      id: json['id'],
      company: ShippingCompany.fromJson(json['company']),
      estimatedDeliveryTime: json['estimatedDeliveryTime'],
      insuranceText: json['insuranceText'],
      isNew: json['isNew'],
      isFastest: json['isFastest'],
      isCheapest: json['isCheapest'],
      price: num.parse(json['totalPrice'].toString()),
      currency: json['currency'],
      pickupByCompany: json['pickupOptions']?['pickupByCurrentCompany']?['pickupStatus'] ?? false,
      pickupByCareem: json['pickupOptions']?['pickupByCareem']?['pickupStatus'] ?? false,
      pickupByCareemFees: num.tryParse((json['pickupOptions']?['pickupByCareem']?['PickupFee']).toString()) ?? 0,
      pickupByCompanyFees: num.tryParse((json['pickupOptions']?['pickupByCurrentCompany']?['PickupFee']).toString()) ?? 0,
    );
  }
}

enum PickupType {
  myself('drop_off'),
  company('company_pickup'),
  careem('third_party_careem');

  const PickupType(this.id);
  final String id;
}