// To parse this JSON data, do
//
//     final usagePolicyModel = usagePolicyModelFromJson(jsonString);

import 'dart:convert';

UsagePolicyModel usagePolicyModelFromJson(String str) => UsagePolicyModel.fromJson(json.decode(str));

String usagePolicyModelToJson(UsagePolicyModel data) => json.encode(data.toJson());

class UsagePolicyModel {
  final int statusCode;
  final String message;
  final Data data;

  UsagePolicyModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UsagePolicyModel.fromJson(Map<String, dynamic> json) => UsagePolicyModel(
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
  final int id;
  final String title;
  final String description;
  final String image;

  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
  };
}
