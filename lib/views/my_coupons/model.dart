// To parse this JSON data, do
//
//     final allUserCoupons = allUserCouponsFromJson(jsonString);

import 'dart:convert';

import 'package:jahzha_app/core/enums/coupons_status.dart';

AllUserCoupons allUserCouponsFromJson(String str) => AllUserCoupons.fromJson(json.decode(str));

String allUserCouponsToJson(AllUserCoupons data) => json.encode(data.toJson());

class AllUserCoupons {
  final int statusCode;
  final String message;
  final List<Datum> data;
  final List<dynamic> additionalData;

  AllUserCoupons({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.additionalData,
  });

  factory AllUserCoupons.fromJson(Map<String, dynamic> json) => AllUserCoupons(
    statusCode: json["status_code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    additionalData: List<dynamic>.from(json["additional_data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "additional_data": List<dynamic>.from(additionalData.map((x) => x)),
  };
}

class Datum {
  final int id;
  final String code;
  final dynamic discount;
  final String discountType;
  final CouponsStatus couponsStatus;

  Datum({
    required this.id,
    required this.code,
    required this.discount,
    required this.discountType,
    required this.couponsStatus
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    code: json["code"],
    discount: json["discount"],
    discountType: json["discount_type"],
      couponsStatus: CouponsStatus.fromString(json["status"]), // Convert string to CouponsStatus
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "discount": discount,
    "discount_type": discountType,
    "status": couponsStatus.title,
  };
}

