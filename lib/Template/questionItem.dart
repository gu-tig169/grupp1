import 'package:Quiz/Template/answerOption.dart';

class QuestionItem {
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswer;
  List<AnswerOption> answerOptions = [];
  bool point;

  QuestionItem(
      {this.category,
      this.question,
      this.correctAnswer,
      this.incorrectAnswer,
      this.point = false});

  factory QuestionItem.fromJson(Map<String, dynamic> json) {
    return QuestionItem(
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswer: json['incorrect_answers'].cast<String>(),
    );
  } //fromJson

  void createAnswerOptions() {
    //skapar ett answerOption för varje instans i incorrectAnswer och lägger till i answerOptions
    for (var answer in incorrectAnswer) {
      answerOptions.add(AnswerOption(answer, false));
    }
    //skapar ett answerOption av correctAnswer och lägger till i answerOptions
    answerOptions.add(AnswerOption(correctAnswer, true));
  } //createAnswerOptions
} // class QuestionItem
