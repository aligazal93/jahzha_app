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
  final bool dropOffByUser;
  final bool pickupByCompany;
  final bool pickupByCareem;
  final num pickupByCareemFees;
  final num pickupByCompanyFees;
  final int? rewardPoints;
  final bool isLocal;

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
    required this.dropOffByUser,
    required this.pickupByCompany,
    required this.pickupByCareem,
    required this.pickupByCareemFees,
    required this.pickupByCompanyFees,
    required this.rewardPoints,
    required this.isLocal,
  });

  factory ShippingOffer.fromJson(Map<String, dynamic> json) {
    final dropOffByUser = json['pickupOptions']?['userDropOff'] ?? false;
    final pickUpByCompany = json['pickupOptions']?['pickupByCurrentCompany']?['pickupStatus'] ?? false;
    final pickupByCareem = json['pickupOptions']?['pickupByCareem']?['pickupStatus'] ?? false;
    final offer = ShippingOffer(
      id: json['id'],
      isLocal: json['shippingType'] == 'domestic',
      company: ShippingCompany.fromJson(json['company']),
      estimatedDeliveryTime: json['estimatedDeliveryTime'],
      insuranceText: json['insuranceText'],
      isNew: json['isNew'],
      isFastest: json['isFastest'],
      isCheapest: json['isCheapest'],
      price: num.parse(json['totalPrice'].toString().replaceAll(',', '')),
      currency: json['currency'],
      dropOffByUser: dropOffByUser,
      pickupByCompany: pickUpByCompany,
      pickupByCareem: pickupByCareem,
      pickupByCareemFees: num.tryParse((json['pickupOptions']?['pickupByCareem']?['PickupFee']).toString()) ?? 0,
      pickupByCompanyFees: num.tryParse((json['pickupOptions']?['pickupByCurrentCompany']?['PickupFee']).toString()) ?? 0,
      rewardPoints: int.tryParse(json['rewardPoints'].toString()) ?? 0,
    );
    if (dropOffByUser) {
      offer.pickupType = PickupType.myself;
    } else if (pickUpByCompany) {
      offer.pickupType = PickupType.company;
    } else if (pickupByCareem) {
      offer.pickupType = PickupType.careem;
    }
    return offer;
  }
}

enum PickupType {
  myself('drop_off'),
  company('company_pickup'),
  careem('third_party_careem');

  const PickupType(this.id);
  final String id;
}