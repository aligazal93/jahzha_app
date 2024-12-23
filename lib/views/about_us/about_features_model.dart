// To parse this JSON data, do
//
//     final aboutFeaturesModel = aboutFeaturesModelFromJson(jsonString);

import 'dart:convert';

AboutFeaturesModel aboutFeaturesModelFromJson(String str) => AboutFeaturesModel.fromJson(json.decode(str));

String aboutFeaturesModelToJson(AboutFeaturesModel data) => json.encode(data.toJson());

class AboutFeaturesModel {
  final int statusCode;
  final String message;
  final List<Datum> data;

  AboutFeaturesModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory AboutFeaturesModel.fromJson(Map<String, dynamic> json) => AboutFeaturesModel(
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
  final String title;
  final String description;
  final String image;

  Datum({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
