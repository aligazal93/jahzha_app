// To parse this JSON data, do
//
//     final loggedUser = loggedUserFromJson(jsonString);

import 'dart:convert';

LoggedUser loggedUserFromJson(String str) => LoggedUser.fromJson(json.decode(str));

String loggedUserToJson(LoggedUser data) => json.encode(data.toJson());

class LoggedUser {
  final int statusCode;
  final String message;
  final Data data;
  final List<dynamic> additionalData;

  LoggedUser({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.additionalData,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
    statusCode: json["status_code"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    additionalData: List<dynamic>.from(json["additional_data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "data": data.toJson(),
    "additional_data": List<dynamic>.from(additionalData.map((x) => x)),
  };
}

class Data {
  final int id;
  final String? name;
  final String? phoneNumber;
  final String? email;
  final DateTime? birthdate;
  final Country country;
  final String gender;
  final String isBlocked;
  final int maximumNumberOfInternationalShipments;

  Data({
    required this.id,
     this.name,
     this.phoneNumber,
     this.email,
     this.birthdate,
    required this.country,
    required this.gender,
    required this.isBlocked,
    required this.maximumNumberOfInternationalShipments,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
    email: json["email"] == null ?  null: json["email"],
    birthdate: json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
    country: Country.fromJson(json["country"]),
    gender: json["gender"],
    isBlocked: json["is_blocked"],
    maximumNumberOfInternationalShipments: json["maximum_number_of_international_shipments"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_number": phoneNumber,
    "email": email,
    "birthdate": "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
    "country": country.toJson(),
    "gender": gender,
    "is_blocked": isBlocked,
    "maximum_number_of_international_shipments": maximumNumberOfInternationalShipments,
  };
}

class Country {
  final String name;

  Country({
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
