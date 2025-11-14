class Cosmetic {
  late final int id;
  late String name;
  late String imgPath;

  Cosmetic({required this.id,required this.name,required this.imgPath});
  @override
    String toString() {
      
      return "id: $id, name: $name, imgPath: $imgPath";
    }
}