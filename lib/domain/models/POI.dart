import 'package:re_discover/domain/models/Quiz.dart';


class POI{
  String name;
  List<String> images;
  List<Quiz> quizzes;
  String qrCode;

  POI(this.name, this.images, this.quizzes, this.qrCode);
}
