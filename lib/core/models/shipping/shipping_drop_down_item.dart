class ShippingDropDownItem {
  final String id;
  final String name;
  final String? image;
  final String? helpImage;

  ShippingDropDownItem({
    required this.id,
    required this.name,
    required this.image,
    required this.helpImage,
  });

  factory ShippingDropDownItem.fromJson(Map<String, dynamic> json) {
    return ShippingDropDownItem(
      id: json['id'],
      name: json['name'],
      image: json['vehicle_image'],
      helpImage: json['dimensions_image'],
    );
  }
}
