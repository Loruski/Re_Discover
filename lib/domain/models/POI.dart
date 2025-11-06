import 'package:re_discover/domain/models/qrcode.dart';
import 'package:re_discover/domain/models/Quiz.dart';


class POI{
  String name;
  Set<String> images;
  Set<Quiz> quizzes;
  Qrcode qrCode;

  POI(this.name, this.images, this.quizzes, this.qrCode);
}
