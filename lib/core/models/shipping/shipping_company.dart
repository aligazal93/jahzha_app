class ShippingCompany {
  final int id;
  final String name;
  final String logo;
  final String description;

  ShippingCompany({
    required this.id,
    required this.name,
    required this.logo,
    required this.description,
  });

  factory ShippingCompany.fromJson(Map<String, dynamic> json) {
    return ShippingCompany(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
    );
  }
}
