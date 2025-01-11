class AppBanner {
  final int id;
  final String image;

  AppBanner({required this.id, required this.image,});

  factory AppBanner.fromJson(Map<String, dynamic> json) {
    return AppBanner(
      id: json['id'],
      image: json['image'],
    );
  }
}