class Hint {
  final int id;
  String description;
  List<String> images;

  Hint({required this.id, required this.description, required this.images});

  Hint.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        description = json['description'] as String,
        images = List<String>.from(json['images'] as List);

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'images': images,
  };
}