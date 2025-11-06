class Quiz {
  int id;
  String description;
  Map<String, bool> questions;
  int maxTry;

  Quiz._withMaxTry(this.id, this.description, this.questions, this.maxTry);
  Quiz._withoutMaxTry(this.id, this.description, this.questions) : maxTry=questions.length;

  factory Quiz({required int id, required String description, required Map<String, bool> questions, int? maxTry}) {
    if(maxTry != null) {
      return Quiz._withMaxTry(id, description, questions, maxTry);
    }else{
      return Quiz._withoutMaxTry(id, description, questions);
    }
  }

}