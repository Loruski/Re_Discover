class AppSkin {
  late final int id;
  late String skinPath;

  AppSkin({required this.id,required this.skinPath});

  AppSkin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skinPath = json['skinPath'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'skinPath': skinPath,
      };
}