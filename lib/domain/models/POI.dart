import 'package:re_discover/domain/models/Position.dart';
import 'package:re_discover/domain/models/Quiz.dart';


class POI{
  final int id;
  String name;
  String description;
  List<String> images;
  List<Quiz> quizzes;
  String qrCode;
  Position position;

  POI(this.id, this.name, this.description, this.images, this.quizzes, this.qrCode, this.position);
}
