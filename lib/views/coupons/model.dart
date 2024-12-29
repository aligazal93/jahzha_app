// To parse this JSON data, do
//
//     final storeCouponsModel = storeCouponsModelFromJson(jsonString);

import 'dart:convert';

StoreCouponsModel storeCouponsModelFromJson(String str) => StoreCouponsModel.fromJson(json.decode(str));

String storeCouponsModelToJson(StoreCouponsModel data) => json.encode(data.toJson());

class StoreCouponsModel {
  final int statusCode;
  final String message;
  final List<Datum> data;

  StoreCouponsModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory StoreCouponsModel.fromJson(Map<String, dynamic> json) => StoreCouponsModel(
    statusCode: json["status_code"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String name;
  final String image;

  Datum({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
