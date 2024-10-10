class TrainingType {
  final String id;
  final String name;

  TrainingType({
    required this.id,
    required this.name,
  });

  factory TrainingType.fromJson(Map<String, dynamic> json) {
    return TrainingType(
      id: json['key'],
      name: json['name'],
    );
  }
}
