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

  LoggedUser({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
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
  final dynamic name;
  final String? telephone;
  final dynamic email;
  final dynamic birthdate;
  final int countryId;
  final String countryName;
  final int gender;
  final String isBlocked;
  final int maximumNumberOfInternationalShipments;
  final List<Country> countries;

  Data({
    required this.id,
    required this.name,
    this.telephone,
    required this.email,
    required this.birthdate,
    required this.countryId,
    required this.countryName,
    required this.gender,
    required this.isBlocked,
    required this.maximumNumberOfInternationalShipments,
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    telephone: json["telephone"] == null ? null : json["telephone"],
    email: json["email"],
    birthdate: json["birthdate"],
    countryId: json["country_id"],
    countryName: json["country_name"],
    gender: json["gender"],
    isBlocked: json["is_blocked"],
    maximumNumberOfInternationalShipments: json["maximum_number_of_international_shipments"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "telephone": telephone,
    "email": email,
    "birthdate": birthdate,
    "country_id": countryId,
    "country_name": countryName,
    "gender": gender,
    "is_blocked": isBlocked,
    "maximum_number_of_international_shipments": maximumNumberOfInternationalShipments,
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  final int id;
  final String name;
  final String nationality;

  Country({
    required this.id,
    required this.name,
    required this.nationality,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
    nationality: json["nationality"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nationality": nationality,
  };
}
