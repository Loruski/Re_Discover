import 'package:re_discover/domain/models/qrcode.dart';
import 'package:re_discover/domain/models/quiz.dart';


class POI{
  String name;
  Set<String> images;
  Set<Quiz> quizzes;
  Qrcode qrCode;

  POI.build(this.name, this.images, this.quizzes, this.qrCode);

  factory POI(String name, Set<String> images, Set<Quiz> quizzes, Qrcode qrCode){
    name = "aaaaa";
    return POI.build(name, images, quizzes, qrCode);
  }
}
