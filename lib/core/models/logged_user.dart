class LoggedUser {
  final int statusCode;
  final String message;
  final Data data;
  final num totalPoints;
  final num walletBalance;
  final num totalCoupons;

  LoggedUser({
    required this.statusCode,
    required this.message,
    required this.data,
    required this.totalCoupons,
    required this.walletBalance,
    required this.totalPoints,
  });

  factory LoggedUser.fromJson(Map<String, dynamic> json) {
    return LoggedUser(
      statusCode: json["status_code"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
      totalCoupons: json['additional_data'].toString() == '[]' ? 0 : num.tryParse(json['additional_data']['totalCoupons'].toString()) ?? 0,
      totalPoints:  json['additional_data'].toString() == '[]' ? 0 : num.tryParse(json['additional_data']['totalPoints'].toString()) ?? 0,
      walletBalance:  json['additional_data'].toString() == '[]' ? 0 : num.tryParse(json['additional_data']['walletBalance'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status_code": statusCode,
      "message": message,
      "data": data.toJson(),
      "additional_data": {
        "totalCoupons": totalCoupons,
        "totalPoints": totalPoints,
        "walletBalance": walletBalance,
      },
    };
  }
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      name: json["name"] == null ? null : json["name"],
      phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
      email: json["email"] == null ? null : json["email"],
      birthdate:
          json["birthdate"] == null ? null : DateTime.parse(json["birthdate"]),
      country: Country.fromJson(json["country"]),
      gender: json["gender"],
      isBlocked: json["is_blocked"],
      maximumNumberOfInternationalShipments:
          json["maximum_number_of_international_shipments"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "phone_number": phoneNumber,
      "email": email,
      "birthdate":
          "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
      "country": country.toJson(),
      "gender": gender,
      "is_blocked": isBlocked,
      "maximum_number_of_international_shipments":
          maximumNumberOfInternationalShipments,
    };
  }
}

class Country {
  final String name;

  Country({
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
    };
  }
}
