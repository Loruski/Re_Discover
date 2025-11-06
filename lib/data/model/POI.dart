  import 'package:re_discover/domain/models/Quiz.dart';

class POI{
  final int id;
  String name;
  List<String> images;
  List<int> quizzes;
  String qrCode;

  POI({required this.id,required this.name, required this.images, required this.quizzes,required this.qrCode});

  POI.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'] as String,
        images = List<String>.from(json['images'] as List),
        quizzes = List<int>.from(json['quizzes'] as List),
        qrCode = json['qrCode'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'images': images.toList(),
        'quizzes': quizzes,
        'qrCode': qrCode
  };

}
