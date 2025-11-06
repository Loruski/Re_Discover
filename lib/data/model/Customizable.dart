class Customizable {
  late final int id;
  late String name;
  late String imgPath;

  Customizable({required this.id,required this.name,required this.imgPath});

  Customizable.fromJson(Map<String, dynamic> json) {
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