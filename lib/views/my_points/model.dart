// To parse this JSON data, do
//
//     final getAllUserPoints = getAllUserPointsFromJson(jsonString);

import 'dart:convert';

AllUserPoints getAllUserPointsFromJson(String str) => AllUserPoints.fromJson(json.decode(str));

String getAllUserPointsToJson(AllUserPoints data) => json.encode(data.toJson());

class AllUserPoints {
  final int statusCode;
  final String message;
  final List<Data>? data;
  final AdditionalData? additionalData;

  AllUserPoints({
    required this.statusCode,
    required this.message,
     this.data,
    this.additionalData,
  });

  factory AllUserPoints.fromJson(Map<String, dynamic> json) => AllUserPoints(
    statusCode: json["status_code"],
    message: json["message"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    // If additional_data is a list, handle it as such, or null if empty
    additionalData: json["additional_data"] != null && json["additional_data"].isNotEmpty
        ? AdditionalData.fromJson(json["additional_data"])
        : null,  // Handling empty list or null
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "additional_data": additionalData!.toJson(), // Safely handle null
  };
}

class AdditionalData {
  final int perPage;
  final int totalPageItems;
  final int currentPage;
  final int totalPoints;

  AdditionalData({
    required this.perPage,
    required this.totalPageItems,
    required this.currentPage,
    required this.totalPoints,
  });

  factory AdditionalData.fromJson(Map<String, dynamic> json) => AdditionalData(
    perPage: json["per_page"],
    totalPageItems: json["total_page_items"],
    currentPage: json["current_page"],
    totalPoints: json["total_points"],
  );

  Map<String, dynamic> toJson() => {
    "per_page": perPage,
    "total_page_items": totalPageItems,
    "current_page": currentPage,
    "total_points": totalPoints,
  };
}

class Data {
  final int id;
  final String? type;
  final int points;
  final DateTime createdAt;
  final _Shipment? shipment;

  Data({
    required this.id,
    this.type,
    required this.points,
    required this.createdAt,
    this.shipment,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    type: json["type"],
    points: json["points"],
    createdAt: DateTime.parse(json["created_at"]),
    shipment: json["shipment"] == null ? null : _Shipment.fromJson(json["shipment"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "points": points,
    "created_at": createdAt.toIso8601String(),
    "shipment": shipment?.toJson(),
  };
}

class _Shipment {
  final int id;
  final String shipmentNumber;

  _Shipment({
    required this.id,
    required this.shipmentNumber,
  });

  factory _Shipment.fromJson(Map<String, dynamic> json) => _Shipment(
    id: json["id"],
    shipmentNumber: json["shipment_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shipment_number": shipmentNumber,
  };
}
