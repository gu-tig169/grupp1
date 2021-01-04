import 'package:Quiz/Template/answerOption.dart';

class QuestionItem {
  String category;
  String question;
  String correctAnswer;
  List<String> incorrectAnswer;
  final List<AnswerOption> _answerOptions = [];
  bool _point = false;

  QuestionItem(
      {this.category, this.question, this.correctAnswer, this.incorrectAnswer});

  List<AnswerOption> get answerOptions => _answerOptions;
  bool get point => _point;
  set point(bool) {
    _point = true;
  }

  factory QuestionItem.fromJson(Map<String, dynamic> json) {
    return QuestionItem(
      category: json['category'],
      question: json['question'],
      correctAnswer: json['correct_answer'],
      incorrectAnswer: json['incorrect_answers'].cast<String>(),
    );
  } //fromJson

  void createAnswerOptions() {
    //skapar ett answerOption för varje instans i listan incorrectAnswer och lägger till i answerOptions
    for (var _answer in incorrectAnswer) {
      _answerOptions.add(AnswerOption(_answer, false));
    }
    //skapar ett answerOption av correctAnswer och lägger till i answerOptions
    _answerOptions.add(AnswerOption(correctAnswer, true));
    _answerOptions.shuffle();
  } //createAnswerOptions
} // class QuestionItem
