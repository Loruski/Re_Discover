class Badge {
  late final int id;
  late String name;
  late String imgPath;

  Badge({required this.id,required this.name,required this.imgPath});

  Badge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imgPath = json['imgPath'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imgPath': imgPath,
      };
}