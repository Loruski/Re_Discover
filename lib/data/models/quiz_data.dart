import 'package:json_annotation/json_annotation.dart';
import 'package:re_discover/domain/models/quiz.dart' as domain;

part 'quiz_data.g.dart';

@JsonSerializable()
class QuizData {
  late final int id;
  late String description;
  late Map<String, bool> questions;
  late int maxTry;

  QuizData._withMaxTry(this.id, this.description, this.questions, this.maxTry);
  QuizData._withoutMaxTry(this.id, this.description, this.questions) : maxTry = questions.length;

  factory QuizData({required int id, required String description, required Map<String, bool> questions, int? maxTry})
  {
    if(maxTry != null) {
      return QuizData._withMaxTry(id, description, questions, maxTry);
    } else {
      return QuizData._withoutMaxTry(id, description, questions);
    }
  }

  factory QuizData.fromJson(Map<String, dynamic> json) => _$QuizDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuizDataToJson(this);

  domain.Quiz toDomain() {
    return domain.Quiz(
      id: id,
      description: description,
      questions: questions,
      maxTry: maxTry,
    );
  }
}