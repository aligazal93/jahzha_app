// To parse this JSON data, do
//
//     final storeCouponsDetailsModel = storeCouponsDetailsModelFromJson(jsonString);

import 'dart:convert';

StoreCouponsDetailsModel storeCouponsDetailsModelFromJson(String str) => StoreCouponsDetailsModel.fromJson(json.decode(str));

String storeCouponsDetailsModelToJson(StoreCouponsDetailsModel data) => json.encode(data.toJson());

class StoreCouponsDetailsModel {
  final int statusCode;
  final String message;
  final Data data;

  StoreCouponsDetailsModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory StoreCouponsDetailsModel.fromJson(Map<String, dynamic> json) => StoreCouponsDetailsModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  final Store store;
  final List<Coupon> coupons;

  Data({
    required this.store,
    required this.coupons,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    store: Store.fromJson(json["store"]),
    coupons: List<Coupon>.from(json["coupons"].map((x) => Coupon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "store": store.toJson(),
    "coupons": List<dynamic>.from(coupons.map((x) => x.toJson())),
  };
}

class Coupon {
  final int couponId;
  final String coupon;
  final String availabilityText;
  final String discountValue;
  final String feature1;
  final String feature2;

  Coupon({
    required this.couponId,
    required this.coupon,
    required this.availabilityText,
    required this.discountValue,
    required this.feature1,
    required this.feature2,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
    couponId: json["coupon_id"],
    coupon: json["coupon"],
    availabilityText: json["availability_text"],
    discountValue: json["discount_value"],
    feature1: json["feature_1"],
    feature2: json["feature_2"],
  );

  Map<String, dynamic> toJson() => {
    "coupon_id": couponId,
    "coupon": coupon,
    "availability_text": availabilityText,
    "discount_value": discountValue,
    "feature_1": feature1,
    "feature_2": feature2,
  };
}

class Store {
  final int id;
  final String url;
  final String name;
  final String image;
  final String discountText;

  Store({
    required this.id,
    required this.url,
    required this.name,
    required this.image,
    required this.discountText,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    image: json["image"],
    discountText: json["discount_text"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "image": image,
    "discount_text": discountText,
  };
}
