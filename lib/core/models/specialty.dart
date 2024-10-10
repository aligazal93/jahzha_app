class Specialty {
  final String id;
  final String name;

  Specialty({
    required this.id,
    required this.name,
  });

  factory Specialty.fromJson(Map<String, dynamic> json) {
    return Specialty(
      id: json['key'],
      name: json['name'],
    );
  }
}