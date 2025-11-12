import 'package:re_discover/data/models/quiz_data.dart';
import 'package:re_discover/data/repositories/abstract_data_repository.dart';
import 'package:re_discover/data/repositories/paths/paths.dart';
import 'package:re_discover/data/repositories/repository_hub.dart';
import 'package:re_discover/domain/models/quiz.dart';

class QuizRepository extends AbstractDataRepository<QuizData, Quiz>{
  QuizRepository(): super(path: Paths.quizPath, fromJson: QuizData.fromJson,
    assignIds: (List data, Map<Types, AbstractDataRepository>? requiredData) {
      Map<int, Quiz> toSetToHolder = {};
      for (QuizData element in data) {
        List<Question> questions = element.questions.map((questionData) => 
          Question(
            questionText: questionData.questionText, 
            answers: questionData.answers, 
            correctOptionIndex: questionData.correctOptionIndex
          )).toList();
        
        toSetToHolder[element.id] = Quiz(id: element.id, description: element.description, questions: questions);
      }
      return toSetToHolder;
    });

}