import '../enums/question_type.dart';

class SurveyQuestion {
  SurveyQuestion(this.questionText, this.questionType, this.answerOptions);

  final String questionText;
  final QuestionType questionType;
  final List<String> answerOptions;
}

