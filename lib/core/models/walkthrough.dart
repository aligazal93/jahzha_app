class Walkthrough {
  final String? title;
  final String? description;
  final String image;

  Walkthrough({
    required this.title,
    required this.description,
    required this.image,
  });

  factory Walkthrough.fromJson(Map<String, dynamic> json) {
    return Walkthrough(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}
