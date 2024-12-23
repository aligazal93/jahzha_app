// To parse this JSON data, do
//
//     final pointPolicyModel = pointPolicyModelFromJson(jsonString);

import 'dart:convert';

PointPolicyModel pointPolicyModelFromJson(String str) => PointPolicyModel.fromJson(json.decode(str));

String pointPolicyModelToJson(PointPolicyModel data) => json.encode(data.toJson());

class PointPolicyModel {
  final int statusCode;
  final String message;
  final Data data;

  PointPolicyModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory PointPolicyModel.fromJson(Map<String, dynamic> json) => PointPolicyModel(
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
