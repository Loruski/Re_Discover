import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/Quiz.dart' as domain;

part 'Quiz.g.dart';

@JsonSerializable()
class Quiz {
  late final int id;
  late String description;
  late Map<String, bool> questions;
  late int maxTry;

  Quiz._withMaxTry(this.id, this.description, this.questions, this.maxTry);
  Quiz._withoutMaxTry(this.id, this.description, this.questions) : maxTry = questions.length;

  factory Quiz({required int id, required String description, required Map<String, bool> questions, int? maxTry})
  {
    if(maxTry != null) {
      return Quiz._withMaxTry(id, description, questions, maxTry);
    } else {
      return Quiz._withoutMaxTry(id, description, questions);
    }
  }

  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);

  Map<String, dynamic> toJson() => _$QuizToJson(this);

  domain.Quiz toDomain() {
    return domain.Quiz(
      id: id,
      description: description,
      questions: questions,
      maxTry: maxTry,
    );
  }
}