// To parse this JSON data, do
//
//     final loggedUser = loggedUserFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoggedUser loggedUserFromJson(String str) => LoggedUser.fromJson(json.decode(str));

String loggedUserToJson(LoggedUser data) => json.encode(data.toJson());

class LoggedUser {
  LoggedUserUser user;
  bool store;
  dynamic? rate; //TODO
  String message;
  bool success;

  LoggedUser({
    required this.user,
    required this.store,
    required this.rate,
    required this.message,
    required this.success,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) => LoggedUser(
    user: LoggedUserUser.fromJson(json["user"]),
    store: json["store"],
    rate: json["rate"] == null ? null : json["rate"],
    message: json["message"],
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "store": store,
    "rate": rate,
    "message": message,
    "success": success,
  };
}

class LoggedUserUser {
  int id;
  String username;
  int countryId;
  String phone;
  String photo;
  String lastSeen;
  Country country;
  Store? store;
  bool? subscription;

  LoggedUserUser({
    required this.id,
    required this.username,
    required this.countryId,
    required this.phone,
    required this.photo,
    required this.lastSeen,
    required this.country,
    required this.store,
    required this.subscription
  });

  factory LoggedUserUser.fromJson(Map<String, dynamic> json) => LoggedUserUser(
    id: json["id"],
    username: json["username"],
    countryId: json["country_id"],
    phone: json["phone"],
    photo: json["photo"],
    lastSeen: json["last_seen"] ?? '',
    country: Country.fromJson(json["country"]),
    store: json["store"] == null ? null :Store.fromJson(json["store"]),
    subscription: json["subscription"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "country_id": countryId,
    "phone": phone,
    "photo": photo,
    "last_seen": lastSeen,
    "country": country.toJson(),
    "store": store?.toJson(),
    "subscription" : subscription
  };
}

class Country {
  int id;
  String nameAr;
  String nameEn;
  String code;

  Country({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.code,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "name_en": nameEn,
    "code": code,
  };
}

class Store {
  int id;
  int userId;
  String name;
  String address;
  String? longAddress;
  String? latAddress;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;
  StoreUser user;

  Store({
    required this.id,
    required this.userId,
    required this.name,
    required this.address,
     this.longAddress,
     this.latAddress,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    address: json["address"],
    longAddress: json["long_address"] == null ? null : json["long_address"],
    latAddress: json["lat_address"] == null ? null : json["lat_address"],
    photo: json["photo"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: StoreUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "address": address,
    "long_address": longAddress,
    "lat_address": latAddress,
    "photo": photo,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user.toJson(),
  };
}

class StoreUser {
  int id;
  String photo;

  StoreUser({
    required this.id,
    required this.photo,
  });

  factory StoreUser.fromJson(Map<String, dynamic> json) => StoreUser(
    id: json["id"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "photo": photo,
  };
}
