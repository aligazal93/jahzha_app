// // To parse this JSON data, do
// //
// //     final countriesModel = countriesModelFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));
//
// String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());
//
// class CountriesModel {
//   bool success;
//   List<Country> countries;
//   String message;
//
//   CountriesModel({
//     required this.success,
//     required this.countries,
//     required this.message,
//   });
//
//   factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
//     success: json["success"],
//     countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
//     "message": message,
//   };
// }
//
// class Country {
//   int id;
//   String name;
//   String nameEn;
//   String code;
//
//   Country({
//     required this.id,
//     required this.name,
//     required this.nameEn,
//     required this.code,
//   });
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//     id: json["id"],
//     name: json["name"],
//     nameEn: json["name_en"],
//     code: json["code"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "name_en": nameEn,
//     "code": code,
//   };
// }
