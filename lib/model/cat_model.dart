class DataModel {
  final String id;
  final String name;
  final String description;

  DataModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
  toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
    };
  }
}
